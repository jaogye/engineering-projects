from utildb import getconn, newid, newnumbertransaction
from datetime import datetime, timedelta
from app_codes import *

#import logging
#logging.getLogger("httpx").setLevel(logging.WARNING)

conn2 = getconn() # Connection only for counters 



def AT_purchase_order(conn, doc):
    """
    Creates a purchase order and optionally an account payable record for credit purchases.
    
    :param conn: pyodbc connection to the database 
    :param doc: dictionary containing the rest of the transaction parameters
    :param doc['supplier_id']: ID of the supplier.
    :param doc['credit_terms']: Optional; dictionary containing 'due_date' for credit purchases.    
    :param doc['payment_term_id']: Payment term     
    :param doc['products']: List of tuples, each containing (product_id, quantity, price).
    """
    cursor = conn.cursor() 
    total_amount = sum(quantity * price for _, quantity, price in doc['products'])
    purchase_order_id = newid(conn2,'purchase_orders') 
    order_status_id = PO_PENDIND
    
    cursor.execute("SELECT net_due_days FROM payment_terms WHERE id=?", (doc['payment_term_id'],) )    
    net_due_days = cursor.fetchone()[0]    
    expected_delivery_date = (doc['order_date'] + timedelta(days=net_due_days)).strftime('%Y-%m-%d') 

    if  net_due_days <= 0:            
        transaction_type_id = PURCHASE_INVENTORY_CASH
    else:   
        transaction_type_id = PURCHASE_INVENTORY_CREDIT
    
    # Insert purchase order
    cursor.execute("""
        INSERT INTO Purchase_Orders (id, supplier_id, order_date, expected_delivery_date, branch_id, 
               total_amount, order_status_id, payment_term_id, transaction_type_id, user_id)
        VALUES (?,?,?,?, ?,?,?,?,?, ?)
    """, (purchase_order_id, doc['supplier_id'], doc['order_date'], expected_delivery_date, doc['branch_id'], 
               total_amount, order_status_id, doc['payment_term_id'], transaction_type_id, doc['user_id']))

    # Insert order details    
    for product_id, quantity, price in doc['products']:
        id = newid(conn2, 'purchase_order_details')        
        cursor.execute("""
            INSERT INTO Purchase_Order_Details (id, purchase_order_id, product_id, quantity, price, pending)
            VALUES (?,?,?,?,?,?)
        """,(id, purchase_order_id, product_id, quantity, price, quantity))

    conn.commit()    
    return purchase_order_id



def AT_invoice_reception(conn, doc):
    """
    Processes inventory entry based on a purchase order: updates inventory levels and marks the purchase order as received.
    
    :param conn: pyodbc connection to the database 
    :param doc: dictionary containing the rest of the transaction parameters    
    :param doc['purchase_order_id']: ID of the purchase order being processed.
    :param doc['reception_invoice_date']: date
    :param doc['user_id']: user who enters the reception
    :param doc['invoicenumber']: 
    """    
    cursor = conn.cursor()

    # Fetch purchase order details
    cursor.execute("""
        SELECT a.supplier_id, a.branch_id, a.payment_term_id, b.location_id 
                   FROM Purchase_Orders a, branches b 
                   WHERE a.id = ? AND a.branch_id=b.id
    """, (doc['purchase_order_id'],))
    supplier_id, branch_id,  payment_term_id, location_id = cursor.fetchone()

    cursor.execute("SELECT net_due_days FROM payment_terms WHERE id=?", (payment_term_id,) )    
    net_due_days = cursor.fetchone()[0]    

    if  net_due_days <= 0:            
        transaction_type_id = PURCHASE_INVENTORY_CASH
    else:   
        transaction_type_id = PURCHASE_INVENTORY_CREDIT

    number_transaction = newnumbertransaction(conn,transaction_type_id)
    # Fetch purchase order details
    cursor.execute("""
        SELECT product_id, quantity, price FROM Purchase_Order_Details WHERE purchase_order_id = ?
    """, (doc['purchase_order_id'],))
    order_details = cursor.fetchall()

    purchase_id = newid(conn2, 'purchases')
    purchase_amount = sum(quantity * price for _, quantity, price in order_details)    
    cursor.execute("""
            INSERT INTO purchases (id, transaction_type_id, number_transaction, reception_invoice_date, 
                   invoicenumber, supplier_id, purchase_order_id, user_id, payment_term_id, 
                   purchase_amount, branch_id)
            VALUES (?,?,?,?, ? ,?,?, ?, ?,?,?)
        """, (purchase_id, transaction_type_id, number_transaction, doc['invoice_reception_date'],  
              doc['invoicenumber'], supplier_id, doc['purchase_order_id'], doc['user_id'], payment_term_id, 
              purchase_amount, branch_id))
  
    
    for product_id, quantity, price in order_details:        
        detail_id = newid(conn2, 'purchasesdetails')        
        # Record inventory transaction
        cursor.execute("""
            INSERT INTO purchasesdetails (id, purchase_id, product_id, quantity, value)
            VALUES (?, ?, ?, ?, ?)
        """, (detail_id, purchase_id, product_id, quantity, quantity*price))

    conn.commit()


def AT_inventory_entry(conn, doc):
    """
    Processes inventory entry based on a purchase order: updates inventory levels and marks the purchase order as received.
    
    :param conn: pyodbc connection to the database 
    :param doc: dictionary containing the rest of the transaction parameters    
    :param doc['purchase_order_id']: ID of the purchase order being processed.
    :param doc['products']: List of tuples, each containing (product_id, quantity, price).
    """    
    cursor = conn.cursor()

    # Fetch purchase order details
    cursor.execute("""
        SELECT a.supplier_id, a.branch_id, a.transaction_type_id, a.payment_term_id, b.location_id FROM Purchase_Orders a, branches b 
                   WHERE a.id = ? AND a.branch_id=b.id
    """, (doc['purchase_order_id'],))
    supplier_id, branch_id, transaction_type_id, payment_term_id, location_id = cursor.fetchone()

    number_transaction = newnumbertransaction(conn,transaction_type_id)
    # Fetch purchase order details
    cursor.execute("""
        SELECT product_id, quantity, price FROM Purchase_Order_Details WHERE purchase_order_id = ?
    """, (doc['purchase_order_id'],))
    order_details = cursor.fetchall()

    inventory_transaction_id = newid(conn2, 'inventory_transactions')
    cursor.execute("""
            INSERT INTO Inventory_Transactions (id, transaction_type_id, number_transaction, transaction_date, 
                   branch_id, supplier_id, purchase_order_id, user_id)
            VALUES (?,?,?,?, ? ,?,?, ?)
        """, (inventory_transaction_id, transaction_type_id, number_transaction, doc['entry_date'],  
              branch_id, supplier_id, doc['purchase_order_id'], doc['user_id']))
  
    # Update inventory for each product
    total_amount = sum(quantity * price for _, quantity, price in order_details)
    
    for product_id, quantity, price in order_details:        
        # Check if product exists in inventory
        cursor.execute("SELECT quantity FROM Inventory WHERE product_id = ? and branch_id=?", (product_id,branch_id))
        result = cursor.fetchone()
        if result is None:
            # Insert new inventory record
            inventory_id = newid(conn2, 'inventory')
            cursor.execute(f"""
                INSERT INTO Inventory (id, product_id, branch_id, quantity, value, cost_avg) VALUES (?, ?, ?,?,?,?)
            """, (inventory_id, product_id, branch_id, quantity, quantity*price, price))
        else:
            # Update existing inventory record
            cursor.execute("""
                UPDATE Inventory SET quantity = quantity + ?, value = value+? WHERE product_id =? and branch_id = ?
            """, (quantity, quantity*price, product_id, branch_id))

            cursor.execute("""
                UPDATE Inventory SET cost_avg = value/quantity WHERE product_id =? and branch_id = ?
            """, ( product_id, branch_id))

        detail_id = newid(conn2, 'inventory_transactions_detail')        
        # Record inventory transaction
        cursor.execute("""
            INSERT INTO inventory_transactions_detail (id, transaction_id, product_id, quantity, value)
            VALUES (?, ?, ?, ?, ?)
        """, (detail_id, inventory_transaction_id, product_id, quantity, quantity*price))
    
    # Mark purchase order as received
    cursor.execute("""
        UPDATE Purchase_Orders SET order_status_id = ? WHERE id = ?
    """, (PO_RECEIVEDFULL, doc['purchase_order_id']))
    
    cursor.execute("SELECT net_due_days FROM payment_terms WHERE id=?", (payment_term_id,) )    
    net_due_days = cursor.fetchone()[0]    
    due_date = (doc['entry_date'] + timedelta(days=net_due_days)).strftime('%Y-%m-%d') 
    accountspayable_id = newid(conn2, 'accountspayable') 
    payment_status_id = PS_UNPAID 
    cursor.execute("""
            INSERT INTO AccountsPayable (id, BillDate, amount_due, balance, due_date, party_id, 
                   payment_status_id, purchase_order_id, transaction_type_id, number_transaction, user_id)
            VALUES (?,?,?,?, ?,?,?,?, ?,?, ?)
        """, (accountspayable_id, doc['entry_date'], total_amount, total_amount, due_date, supplier_id, 
                   payment_status_id, doc['purchase_order_id'], transaction_type_id, number_transaction, doc['user_id'] ) )

    # posting to the ledger
    transaction_id = newid(conn2, 'transactions')
    cursor.execute( f"""INSERT transactions(id, transaction_date, transaction_type_id, number_transaction, user_id)
    VALUES(?,?,?,?,?) """, (transaction_id, doc['entry_date'], transaction_type_id, number_transaction, doc['user_id']) ) 

    cursor.execute( """
    INSERT transaction_details( transaction_id, ledger_account_id, payment_term_id,  debit_credit, 
    value, quantity, party_id , user_id , branch_id, catalogue_item_id, location_id ) 
    SELECT ?, ?, ?, 'D', b.value, b.quantity, a.supplier_id, a.user_id, a.branch_id, 
    b.product_id, c.location_id
    FROM inventory_transactions a, inventory_transactions_detail b, branches c 
    WHERE a.id=b.transaction_id AND a.branch_id=c.id AND a.number_transaction = ? """, 
    (transaction_id, LEDGER_INVENTORY, payment_term_id, number_transaction) ) 

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, ledger_account_id,  debit_credit, value,
            party_id , user_id , branch_id, location_id, payment_term_id )
            VALUES (?,?,'C', ?,?,?,?,?, ?)
        """, (transaction_id, LEDGER_ACCOUNTS_PAYABLE, total_amount, supplier_id, doc['user_id'], 
              branch_id, location_id, payment_term_id ) )

    conn.commit()
    return inventory_transaction_id, accountspayable_id


def AT_supplier_payment(conn, doc):
    """
    Records a payment made to a supplier for a purchase order.

    :payment_date: when the payment is done
    :param conn: pyodbc connection to the database 
    :param doc: dictionary containing the rest of the transaction parameters    
    :param doc['purchase_order_id']: ID of the purchase order for which the payment is made
    :param doc['amount_paid']: Amount of the payment
    """
    cursor = conn.cursor()
    description = "Payments of purchase order"    
    transaction_type_id = PAYMENT_SUPPLIER
    number_transaction = newnumbertransaction(conn,transaction_type_id)
    # Insert supplier payment record

    cursor.execute("""SELECT a.id, a.purchase_order_id, b.branch_id, c.location_id 
                   FROM accountspayable a, purchase_orders b, branches c 
                   WHERE  a.purchase_order_id=b.id AND b.branch_id=c.id AND 
                          a.party_id=? and a.balance>0""", (doc['supplier_id'],))    
    response = cursor.fetchone()
    if response is None:
       conn.commit()
       return 
       #raise Exception("No payments for the supplier_id: " + str(doc['supplier_id'] ))  
    

    payment_id = newid(conn2, 'payments')
    accountspayable_id, purchase_order_id, branch_id, location_id = response
    cursor.execute("""UPDATE accountspayable SET balance = balance - ?, payment_status_id=?
                       WHERE id =?""", (doc['amount_paid'], PS_PAID, accountspayable_id))
        
    cursor.execute("""
        INSERT INTO Payments (id, party_id, amount, description, payment_date, payment_method_id, transaction_type_id,
        number_transaction, accountspayable_id, user_id)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    """,( payment_id, doc['supplier_id'], doc['amount_paid'], description, doc['payment_date'], doc['payment_method_id'], 
         transaction_type_id, number_transaction, accountspayable_id, doc['user_id'] ) )

    cursor.execute("""UPDATE purchase_orders SET order_status_id = ?
                       WHERE id =?""", (PO_CLOSED, purchase_order_id))

    # posting to the ledger
    transaction_id = newid(conn2, 'transactions')
    cursor.execute( f"""INSERT transactions(id, transaction_date, transaction_type_id, number_transaction, user_id)
    VALUES(?,?,?,?,?) """, (transaction_id, doc['payment_date'], transaction_type_id, number_transaction, doc['user_id']) ) 

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, ledger_account_id,  debit_credit, value,
            party_id , user_id , branch_id, location_id )                     
            VALUES (?,?,'D', ?,?,?,?,?)
        """, (transaction_id, LEDGER_ACCOUNTS_PAYABLE, doc['amount_paid'], doc['supplier_id'], doc['user_id'], 
              branch_id, location_id ) )

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, ledger_account_id,  debit_credit, value,
            party_id , user_id , branch_id, location_id )                     
            VALUES (?,?,'C', ?,?,?,?,?)
        """, (transaction_id, LEDGER_CASH, doc['amount_paid'], doc['supplier_id'], doc['user_id'], 
              branch_id, location_id ) )

    conn.commit()
    return payment_id


def AT_service_order(conn, doc):
    """
    Creates a service purchase order and updates Accounts Payable.
    
    :param conn: pyodbc connection to the database 
    :param doc: dictionary containing the rest of the transaction parameters
    :param doc['order_date']: Transaction date
    :param doc['expected_delivery_date']
    :param doc['vendor_id']: ID of the vendor providing the service.
    :param doc['service_id']: ID of the service.
    :param doc['total_amount']:    
    :param doc['expense_category_id']:
    :param doc['business_unit_id']:  
    :param doc['branch_id']: ID of the branch ordering the service.
    :param doc['location_id']: ID of the location ordering the service.    
    :param doc['payment_term_id']: Payment term 
    :param doc['user_id']: ID of the user who record the order
    """    
    cursor = conn.cursor() 

  
    purchase_order_id = newid(conn2, 'purchase_orders') 
    order_status_id = PO_PENDIND
    # Insert service order
    cursor.execute("""
        INSERT INTO service_orders (id, vendor_id, service_id, order_date, expected_delivery_date, 
                branch_id,  total_amount, order_status_id, payment_term_id,  user_id, 
                expense_category_id, business_unit_id  )
        VALUES (?,?,?,?,?,  ?,?,?,?,?,  ?,?)
    """, (purchase_order_id, doc['vendor_id'], doc['service_id'], doc['order_date'], doc['expected_delivery_date'], 
          doc['branch_id'],  doc['total_amount'], order_status_id, doc['payment_term_id'], doc['user_id'],
            doc['expense_category_id'],  doc['business_unit_id'] ))

    conn.commit()
    return purchase_order_id



def AT_service_acceptance(conn, doc):
    """
    Acceptance a service purchase order and loads into Accounts Payable.
    
    :param conn: pyodbc connection to the database 
    :param doc: dictionary containing the rest of the transaction parameters
    :param doc['acceptance_date']: Transaction date
    :param doc['service_order_id']: ID of the service order.
    :param doc['worked_hours']: 
    """    
    cursor = conn.cursor() 
    transaction_type_id = ACCEPTANCE_SERVICES
    description = "Acceptance of the service"
    number_transaction = newnumbertransaction(conn,transaction_type_id)
    cursor.execute("""SELECT order_date, vendor_id, service_id, branch_id, location_id, total_amount, 
                   payment_term_id, expense_category_id, business_unit_id
                   FROM service_orders WHERE id=?""", (doc['service_order_id'],))
    
    order_date, vendor_id, service_id, branch_id, location_id, total_amount, \
    payment_term_id, expense_category_id, business_unit_id = cursor.fetchone()

    cursor.execute("SELECT net_due_days FROM payment_terms WHERE id=?", (payment_term_id,) )    
    net_due_days = cursor.fetchone()[0]    
    if type(order_date) is str:
       order_date = datetime.strptime(order_date, '%Y-%m-%d')

    expected_delivery_date = (order_date + timedelta(days=net_due_days)).strftime('%Y-%m-%d') 

    # Insert service order
    cursor.execute("""UPDATE service_orders SET acceptance_date=?,worked_hours=?, order_status_id=? 
                   WHERE id=?
    """, (doc['acceptance_date'], doc['worked_hours'], PO_RECEIVEDFULL, doc['service_order_id']))

    accountspayable_id = newid(conn2, 'accountspayable') 
    payment_status_id = PS_UNPAID 

    cursor.execute("""
            INSERT INTO AccountsPayable (id, BillDate, amount_due, balance, due_date, party_id, 
                   payment_status_id, service_order_id, transaction_type_id, number_transaction, user_id)
            VALUES (?,?,?,?, ?,?,?,?, ?,?, ?)""", 
            (accountspayable_id, doc['acceptance_date'], total_amount, total_amount, expected_delivery_date, 
             vendor_id, payment_status_id, doc['service_order_id'], transaction_type_id, number_transaction, doc['user_id']) )

    # posting to the ledger
    transaction_id = newid(conn2, 'transactions')
    cursor.execute( f"""INSERT transactions(id, transaction_date, transaction_type_id, number_transaction, user_id)
    VALUES(?,?,?,?,?) """, (transaction_id, doc['acceptance_date'], transaction_type_id, number_transaction, doc['user_id']) ) 

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, ledger_account_id,  debit_credit, value,
            party_id , user_id , branch_id, location_id, 
            catalogue_item_id, description )
            VALUES (?,?,'C', ?,?,?,?,?,?,?)
        """, (transaction_id, LEDGER_ACCOUNTS_PAYABLE, total_amount, vendor_id, doc['user_id'], 
              branch_id, location_id, service_id, description ) )

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, ledger_account_id,  debit_credit, value,
            party_id , user_id , branch_id, location_id, revenue_expense_category_id, businessunit_id, 
            catalogue_item_id, description )
            VALUES (?,?,'D', ?,?,?,?,?,?,?,?,?)
        """, (transaction_id, LEDGER_OPERATING_EXPENSES, total_amount, vendor_id, doc['user_id'], 
              branch_id, location_id, expense_category_id, business_unit_id, service_id, description ) )

    cursor = conn.cursor() 
    return accountspayable_id


def AT_service_payment(conn, doc):
    """
    Records a payment made to a vendor for a service order.

    :param conn: pyodbc connection to the database 
    :param doc: dictionary containing the rest of the transaction parameters    
    :param doc['payment_date']: when the payment is done
    :param doc['service_order_id']: 
    :param doc['payment_method_id']:
    :param doc['user_id']:
    """
    cursor = conn.cursor()
    description = "Payments of services"    
    transaction_type_id = PAYMENT_SERVICES
    number_transaction = newnumbertransaction(conn,transaction_type_id)

    cursor.execute("""SELECT a.id, b.branch_id, b.location_id, a.amount_due, b.vendor_id 
                   FROM accountspayable a, service_orders b
                   WHERE a.service_order_id=b.id AND a.service_order_id=?""", (doc['service_order_id'],))
    response = cursor.fetchone()

    if response is None:
       raise Exception("Invalid service_order_id")

    cursor.execute("""UPDATE service_orders SET order_status_id=?
                       WHERE id =?""", (PO_CLOSED,  doc['service_order_id']))

    accountspayable_id, branch_id, location_id, amount_paid, vendor_id = response
    payment_id = newid(conn2, 'payments')    
    cursor.execute("""UPDATE accountspayable SET balance = balance - ?, payment_status_id=?
                       WHERE id =?""", (amount_paid, PS_PAID, accountspayable_id))

    # Insert supplier payment record        
    cursor.execute("""
        INSERT INTO Payments (id, party_id, amount, description, payment_date, payment_method_id, 
        transaction_type_id, number_transaction, accountspayable_id, user_id)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    """,( payment_id, vendor_id, amount_paid, description, doc['payment_date'], doc['payment_method_id'], 
         transaction_type_id, number_transaction, accountspayable_id, doc['user_id'] ) )

    # posting to the ledger
    transaction_id = newid(conn2, 'transactions')
    cursor.execute( f"""INSERT transactions(id, transaction_date, transaction_type_id, number_transaction, user_id)
    VALUES(?,?,?,?,?) """, (transaction_id, doc['payment_date'], transaction_type_id, number_transaction, doc['user_id']) ) 

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, ledger_account_id,  debit_credit, value,
            party_id , user_id , branch_id, location_id )                     
            VALUES (?,?,'D', ?,?,?,?,?)
        """, (transaction_id, LEDGER_ACCOUNTS_PAYABLE, amount_paid, vendor_id, doc['user_id'], 
              branch_id, location_id ) )

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, ledger_account_id,  debit_credit, value,
            party_id , user_id , branch_id, location_id )                     
            VALUES (?,?,'C', ?,?,?,?,?)
        """, (transaction_id, LEDGER_CASH, amount_paid, vendor_id, doc['user_id'], 
              branch_id, location_id ) )

    conn.commit()
    return payment_id


# ==========================================================================


def calculate_net_salary(gross_salary, deductions):
    net_salary = gross_salary
    for _, amount in deductions:
          net_salary = net_salary - amount 
    return net_salary

def AT_payroll_record(conn, doc):
    """
    Creates a payroll record and associated deductions for an employee.
    
    :param conn: pyodbc connection to the database 
    :param doc: dictionary containing the rest of the transaction parameters    
    :param doc['payroll_date']: date when the payroll is processed 
    :param doc['employee_id']: The employee's ID.
    :param doc['branch_id']: The employee's branch_id.    
    :param doc['period_start']: The start date of the payroll period.
    :param doc['period_end']: The end date of the payroll period.
    :param doc['gross_salary']: The gross salary for the period.
    :param doc['expense_category_id']: The expense category that payment of employee generates
    :param doc['businessunit_id']: The business where the employee is associated 
    :param doc['deductions']: A dictionary of deduction descriptions and amounts.
    """
    net_salary = calculate_net_salary(doc['gross_salary'], doc['deductions'])
    payroll_id = newid(conn2, 'payroll') 
    transaction_type_id = PAYROLL_GENERATION
    number_transaction = newnumbertransaction(conn,transaction_type_id)
    cursor = conn.cursor() 

    cursor.execute("SELECT location_id FROM branches WHERE id=?",(doc['branch_id'],))  
    location_id = cursor.fetchone()[0]

    # Create Insert payroll sentence
    cursor.execute("""
           INSERT INTO Payroll(id, employee_id, payroll_date, period_start, period_end, gross_salary, net_salary, 
                   hours_worked, transaction_type_id, number_transaction, user_id, branch_id)
           VALUES (?,?,?, ? ,?,?,?, ?, ?, ?,?, ?); 
        """, (payroll_id, doc['employee_id'], doc['payroll_date'], doc['period_start'], doc['period_end'], 
              doc['gross_salary'], net_salary, doc['hours_worked'], transaction_type_id, number_transaction, 
              doc['user_id'], doc['branch_id']) )
    
    # Create Insert deductions sentence
    for deduction_id, amount in doc['deductions']:
        id = newid(conn2, 'employeedeductions') 
        cursor.execute("""
            INSERT INTO EmployeeDeductions (id, payroll_id, deduction_id, amount)
            VALUES(?,?,?,?)
            """, (id, payroll_id, deduction_id, amount))
        

    # Update Accounts Payable
    due_date = doc['payroll_date'].strftime('%Y-%m-%d') 
    accountspayable_id = newid(conn2, 'accountspayable') 
    payment_status_id = PS_UNPAID 

    cursor.execute("""
            INSERT INTO AccountsPayable (id, BillDate, amount_due, balance, due_date, party_id, 
                   payment_status_id, payroll_id, transaction_type_id, number_transaction, user_id)
            VALUES (?,?,?,?, ?,?,?,?, ?,?, ?)""", 
            (accountspayable_id, doc['payroll_date'], net_salary, net_salary, due_date, doc['employee_id'], 
             payment_status_id, payroll_id, transaction_type_id, number_transaction, doc['user_id']) )

    # posting to the ledger
    transaction_id = newid(conn2, 'transactions')
    cursor.execute( f"""INSERT transactions(id, transaction_date, transaction_type_id, number_transaction, user_id)
    VALUES(?,?,?,?,?) """, (transaction_id, doc['payroll_date'], transaction_type_id, number_transaction, doc['user_id']) ) 

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, ledger_account_id,  debit_credit, value,
            party_id , user_id , branch_id, location_id, description )                     
            VALUES (?,?,'C', ?,?,?,?,?,?)
        """, (transaction_id, LEDGER_ACCOUNTS_PAYABLE, net_salary, doc['employee_id'], doc['user_id'], 
              doc['branch_id'], location_id, "net salary" ) )

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, ledger_account_id,  debit_credit, value,
            party_id , user_id , branch_id, location_id, description )
            VALUES (?,?,'C', ?,?,?,?,?,?)
        """, (transaction_id, LEDGER_ACCOUNTS_RECEIVABLE, doc['gross_salary']-net_salary, 
              doc['employee_id'], doc['user_id'], doc['branch_id'], location_id , "Discount benefits to the employee") )

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, ledger_account_id,  debit_credit, value,
            party_id , user_id , branch_id, location_id, revenue_expense_category_id, businessunit_id, 
                   description )
            VALUES (?,?,'D', ?,?,?,?,?,?,?,?)
        """, (transaction_id, LEDGER_OPERATING_EXPENSES, doc['gross_salary'], doc['employee_id'], doc['user_id'], 
              doc['branch_id'], location_id, doc['expense_category_id'], doc['businessunit_id'], "gross salary" ) )

    conn.commit()
    return payroll_id, accountspayable_id

# Example usage
# Assuming 'conn' is your database connection object
# deductions = {"Tax": 500.00, "Health Insurance": 150.00}
# AT_payroll_record(conn, 1, '2024-01-01', '2024-01-31', 3000.00, deductions)



def AT_payroll_payment(conn, doc):
    """
    Records a payment made to a supplier for a purchase order.

    :param conn: pyodbc connection to the database 
    :param doc: dictionary containing the rest of the transaction parameters    
    :param doc['payment_date']: when the payment is done
    :param doc['payroll_id']: 
    :param doc['payment_method_id']:
    :param doc['user_id']:
    """
    cursor = conn.cursor()
    description = "Payments of salaries"    
    transaction_type_id = PAYMENT_SALARIES
    number_transaction = newnumbertransaction(conn,transaction_type_id)

    cursor.execute("""SELECT a.id, b.branch_id, c.location_id, a.amount_due, b.employee_id 
                   FROM accountspayable a, payroll b, branches c 
                   WHERE a.payroll_id=b.id AND c.id=b.branch_id AND a.payroll_id=?""", (doc['payroll_id'],))
    response = cursor.fetchone()

    if response is None:
       raise Exception("Invalid payroll_id")
    
    accountspayable_id, branch_id, location_id, amount_paid, employee_id = response
    payment_id = newid(conn2, 'payments')    
    cursor.execute("""UPDATE accountspayable SET balance = balance - ?, payment_status_id=?
                       WHERE id =?""", (amount_paid, PS_PAID, accountspayable_id))

    # Insert supplier payment record        
    cursor.execute("""
        INSERT INTO Payments (id, party_id, amount, description, payment_date, payment_method_id, transaction_type_id,
        number_transaction, accountspayable_id, user_id)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    """,( payment_id, employee_id, amount_paid, description, doc['payment_date'], doc['payment_method_id'], 
         transaction_type_id, number_transaction, accountspayable_id, doc['user_id'] ) )

    # posting to the ledger
    transaction_id = newid(conn2, 'transactions')
    cursor.execute( f"""INSERT transactions(id, transaction_date, transaction_type_id, number_transaction, user_id)
    VALUES(?,?,?,?,?) """, (transaction_id, doc['payment_date'], transaction_type_id, number_transaction, doc['user_id']) ) 

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, ledger_account_id,  debit_credit, value,
            party_id , user_id , branch_id, location_id )                     
            VALUES (?,?,'D', ?,?,?,?,?)
        """, (transaction_id, LEDGER_ACCOUNTS_PAYABLE, amount_paid, employee_id, doc['user_id'], 
              branch_id, location_id ) )

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, ledger_account_id,  debit_credit, value,
            party_id , user_id , branch_id, location_id )                     
            VALUES (?,?,'C', ?,?,?,?,?)
        """, (transaction_id, LEDGER_CASH, amount_paid, employee_id, doc['user_id'], 
              branch_id, location_id ) )

    conn.commit()
    return payment_id


        

    
# ===============================================
    
def AT_sale_order(conn, doc):
    """
    Creates a sale order and optionally an account payable record for credit sales.
    
    :param conn: pyodbc connection to the database 
    :param doc: dictionary containing the rest of the transaction parameters
    :param doc['customer_id']: ID of the customer.
    :param doc['credit_terms']: Optional; dictionary containing 'due_date' for credit sales.    
    :param doc['payment_term_id']: Payment term     
    :param doc['products']: List of tuples, each containing (product_id, quantity, price).
    """
    cursor = conn.cursor() 
    total_amount = sum(quantity * price for _, quantity, price in doc['products'])
    sale_order_id = newid(conn2,'sale_orders') 
    order_status_id = PO_PENDIND
    
    cursor.execute("SELECT net_due_days FROM payment_terms WHERE id=?", (doc['payment_term_id'],) )    
    net_due_days = cursor.fetchone()[0]    
    expected_delivery_date = (doc['order_date'] + timedelta(days=net_due_days)).strftime('%Y-%m-%d') 

    if  net_due_days <= 0:            
        transaction_type_id = SALES_CASH
    else:   
        transaction_type_id = SALES_CREDIT
    
    # Insert sale order
    cursor.execute("""
        INSERT INTO sale_orders (id, customer_id, order_date, expected_delivery_date, branch_id, 
               total_amount, order_status_id, payment_term_id, transaction_type_id, user_id)
        VALUES (?,?,?,?, ?,?,?,?,?, ?)
    """, (sale_order_id, doc['customer_id'], doc['order_date'], expected_delivery_date, doc['branch_id'], 
               total_amount, order_status_id, doc['payment_term_id'], transaction_type_id, doc['user_id']))

    # Insert order details    
    for product_id, quantity, price in doc['products']:
        id = newid(conn2, 'sale_order_details')        
        cursor.execute("""
            INSERT INTO sale_Order_Details (id, sale_order_id, product_id, quantity, price, pending)
            VALUES (?,?,?,?,?,?)
        """,(id, sale_order_id, product_id, quantity, price, quantity))

    conn.commit()    
    return sale_order_id



def AT_sale_transaction(conn, doc):
    """
    Records a sales transaction, updates inventory, and manages accounts receivable if necessary.
    
    :param conn: pyodbc connection to the database 
    :param doc: dictionary containing the rest of the transaction parameters    
    :param doc['sale_date']: date when the sale is done
    :param doc['salespoint_id']: ID of the sales point where the transaction occurs.    
    :param doc['customer_id']: ID of the customer making the purchase.
    :param doc['salesperson_id']: Sales person
    :param doc['sales_channel_id']: Sales channel
    :param doc['payment_term_id']: Payment term
    :param doc['payment_method_id']: Payment method
    :param doc['revenue_expense_category_id']: The expense category that fee transaction is associated
    :param doc['businessunit_id']: The business unit that fee transaction is associated
    :param doc['products: List of tuples, each containing (product_id, quantity, sale_price).
    """    
    cursor = conn.cursor() 
    total_amount = sum(quantity * sale_price for _, quantity, sale_price in doc['products'])
    sale_id = newid(conn2, 'sales') 
    invoicenumber = str(sale_id).zfill(6) 

    cursor.execute("SELECT net_due_days FROM payment_terms WHERE id=?", (doc['payment_term_id'],) )    
    net_due_days = cursor.fetchone()[0]
    if  net_due_days <= 0:            
        transaction_type_id = SALES_CASH
    else:   
        transaction_type_id = SALES_CREDIT

    number_transaction = newnumbertransaction(conn,transaction_type_id)    
    # Record the sale
    cursor.execute("""
        INSERT INTO Sales (id, sales_point_id, customer_id, invoicenumber, salesperson_id, sales_channel_id,
               sale_date, sale_amount, promotion_id, payment_method_id, payment_term_id, transaction_type_id,
                   number_transaction, user_id, branch_id)
        VALUES (?,?,?,?,?,?, ?,?,?,?,?,?,?, ?,?)
    """, (sale_id, doc['sales_point_id'], doc['customer_id'], invoicenumber, doc['salesperson_id'], 
               doc['sales_channel_id'], doc['sale_date'], total_amount, doc['promotion_id'], 
               doc['payment_method_id'], doc['payment_term_id'], transaction_type_id, 
               number_transaction, doc['user_id'] , doc['branch_id']) )
    
    cursor.execute("""SELECT location_id FROM branches WHERE id=?""", (doc['branch_id'],) )
    location_id = cursor.fetchone()[0]

    inventorytransaction_id = newid(conn2, 'inventory_transactions')         
    # Update inventory
    cursor.execute("""
            INSERT INTO inventory_transactions (id, transaction_type_id, transaction_date, branch_id, 
                   customer_id, sale_id,  number_transaction, user_id)
            VALUES (?,?,?, ?,?,?, ?,?) 
    """, (inventorytransaction_id, transaction_type_id, doc['sale_date'], doc['branch_id'], 
                   doc['customer_id'], sale_id, number_transaction, doc['user_id'] ))


    # posting to the ledger
    # Posting Revenue
    transaction_id = newid(conn2, 'transactions')
    cursor.execute( f"""INSERT transactions(id, transaction_date, transaction_type_id, number_transaction, user_id)
    VALUES(?,?,?,?,?) """, (transaction_id, doc['sale_date'], transaction_type_id, number_transaction, doc['user_id']) ) 


    # Record each product sold
    for product_id, quantity, price in doc['products']:
        cursor.execute("SELECT quantity, value, cost_avg FROM inventory WHERE product_id=? and branch_id=?", 
                       (product_id, doc['branch_id']))
                
        response = cursor.fetchone()
        tot_quantity, tot_value, cost_avg = response
        if tot_quantity > 0:
           cost_avg = tot_value/tot_quantity
           
        value = quantity*cost_avg # average cost  
        inventorydetail_id = newid(conn2, 'inventory_transactions_detail')         
        cursor.execute("""
            INSERT INTO inventory_transactions_detail (id, transaction_id, product_id, quantity, value)
            VALUES (?,?,?,?,?)
        """, (inventorydetail_id, inventorytransaction_id, product_id, -quantity, -value))

        saledetail_id = newid(conn2, 'salesdetails') 
        cursor.execute("""
            INSERT INTO SalesDetails (id, sale_id, product_id, quantity, price, sale_amount, cost_amount)
            VALUES (?,?,?,?,?,?,?)
        """, (saledetail_id, sale_id, product_id, quantity, price, quantity * price, quantity * cost_avg))

        cursor.execute("UPDATE inventory SET quantity=quantity-?, value=value-?, cost_avg=? WHERE product_id=? and branch_id=?", 
                       (quantity, value, cost_avg, product_id, doc['branch_id']))

        # Posting goods cost
        cursor.execute("""
            INSERT INTO transaction_details( transaction_id, ledger_account_id, debit_credit, value, quantity,
            catalogue_item_id, party_id, user_id , branch_id, location_id, payment_term_id )
            VALUES(?, ?, 'C',?,?,  ?,?,?,  ?,?,?  )                   
        """, (transaction_id, LEDGER_INVENTORY, value , quantity, product_id,  doc['customer_id'], doc['user_id'], 
              doc['branch_id'], location_id,  doc['payment_term_id'] ) )

        cursor.execute("""
            INSERT INTO transaction_details( transaction_id, ledger_account_id,  debit_credit, value, quantity,
            catalogue_item_id, party_id, user_id , branch_id, location_id, payment_term_id )
            VALUES(?, ?, 'C',?,?,  ?,?,?,  ?,?,?  )                        
        """, (transaction_id, LEDGER_COST_OF_GOODS_SOLD, value , quantity, product_id, doc['customer_id'], doc['user_id'], 
              doc['branch_id'], location_id, doc['payment_term_id'] ) )


    # Handle accounts receivable for credit sales

    accountsreceivable_id, payment_id = None, None
    if net_due_days > 0:
        accountsreceivable_id = newid(conn2, 'accountsreceivable') 
        payment_status_id = PS_UNPAID 
        due_date = (doc['sale_date'] + timedelta(days=net_due_days)).strftime('%Y-%m-%d') 
        cursor.execute("""
            INSERT INTO AccountsReceivable (id, BillDate, amount_due, balance, due_date, party_id, 
                   payment_status_id, sale_id, transaction_type_id, number_transaction, user_id )
            VALUES (?,?,?,?, ?,?,?,?, ?,?,?)
        """,(accountsreceivable_id, doc['sale_date'], total_amount, total_amount, due_date, doc['customer_id'], 
                   payment_status_id, sale_id, transaction_type_id, number_transaction, doc['user_id']) )
    else:
        description = "SALES CASH"
        payment_id = newid(conn2, 'Payments')
        cursor.execute("SELECT name FROM payment_methods WHERE id =?", (doc['payment_method_id'],))
        payment_name = cursor.fetchone()[0]
        if payment_name=='Credit Card':
           transaction_fee = CREDITCARD_COMISSION * total_amount
           description = "Payment using Credit Card"
           payment_id = newid(conn2, 'payments')
           cursor.execute("""
           INSERT INTO Payments (id, party_id, amount, transaction_fee, description, payment_date, payment_method_id, 
                          sale_id, transaction_type_id, number_transaction, user_id)
            VALUES (?,?,? ,?,?,?,?,  ?,?,?,?)
            """,( payment_id, doc['customer_id'], total_amount, transaction_fee, description, doc['sale_date'], doc['payment_method_id'], 
                  sale_id, transaction_type_id, number_transaction, doc['user_id'] ) )
        else:
           cursor.execute("""
           INSERT INTO Payments (id, party_id, amount, description, payment_date, payment_method_id, sale_id, 
            transaction_type_id, number_transaction, user_id)
           VALUES (?,?,? ,?,?,?, ?,?,?,?)
        """, (payment_id, doc['customer_id'], total_amount, description, doc['sale_date'], doc['payment_method_id'], 
           sale_id, transaction_type_id, number_transaction, doc['user_id']))


    if  net_due_days > 0:  
        cursor.execute("""
            INSERT INTO transaction_details( transaction_id, ledger_account_id,  debit_credit, value,
            party_id , user_id , branch_id, location_id, payment_term_id )                     
            VALUES (?,?,'D', ?,?,?,?,?,?)
        """, (transaction_id, LEDGER_ACCOUNTS_RECEIVABLE, total_amount, doc['customer_id'], doc['user_id'], 
              doc['branch_id'], location_id, doc['payment_term_id'] ) )
    else:
        if  payment_name=='Credit Card':
            cursor.execute("""
            INSERT INTO transaction_details( transaction_id, ledger_account_id,  debit_credit, value,
            party_id , user_id , branch_id, location_id, payment_term_id )           
            VALUES (?,?,'D', ?,?,?,?,?,?)
            """, (transaction_id, LEDGER_CASH, (1-CREDITCARD_COMISSION)*total_amount*(1-VAT_TAX), doc['customer_id'], doc['user_id'], 
              doc['branch_id'], location_id, doc['payment_term_id'] ) )

            cursor.execute("""
            INSERT INTO transaction_details( transaction_id, ledger_account_id,  debit_credit, value,
            party_id , user_id , branch_id, location_id, payment_term_id )
            VALUES (?,?,'D', ?,?,?,?,?,?)
            """, (transaction_id, LEDGER_TAXES_PAYABLE, (1-CREDITCARD_COMISSION)*total_amount*VAT_TAX, doc['customer_id'], doc['user_id'], 
              doc['branch_id'], location_id, doc['payment_term_id'] ) )

            cursor.execute("""
            INSERT INTO transaction_details( transaction_id, ledger_account_id,  debit_credit, value,
            party_id , user_id , branch_id, location_id, payment_term_id, revenue_expense_category_id, businessunit_id )
            VALUES (?,?,'D', ?,?,?,?,?,?,?,?)
            """, (transaction_id, LEDGER_INTEREST_EXPENSES, CREDITCARD_COMISSION*total_amount, doc['customer_id'], doc['user_id'], 
              doc['branch_id'], location_id, doc['payment_term_id'], doc['revenue_expense_category_id'], doc['businessunit_id'] ) )

        else:
            cursor.execute("""
            INSERT INTO transaction_details( transaction_id, ledger_account_id,  debit_credit, value,
            party_id , user_id , branch_id, location_id, payment_term_id )
            VALUES (?,?,'D', ?,?,?,?,?,?)
            """, (transaction_id, LEDGER_CASH, total_amount*(1-VAT_TAX), doc['customer_id'], doc['user_id'], 
              doc['branch_id'], location_id, doc['payment_term_id'] ) )

            cursor.execute("""
            INSERT INTO transaction_details( transaction_id, ledger_account_id,  debit_credit, value,
            party_id , user_id , branch_id, location_id, payment_term_id )             
            VALUES (?,?,'D', ?,?,?,?,?,?)
            """, (transaction_id, LEDGER_TAXES_PAYABLE, total_amount*VAT_TAX, doc['customer_id'], doc['user_id'], 
              doc['branch_id'], location_id, doc['payment_term_id'] ) )

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, ledger_account_id, debit_credit, value, quantity,
            catalogue_item_id, party_id, user_id , branch_id, location_id )
            SELECT ?, ?, 'C', b.sale_amount, b.quantity, b.product_id, ?, ?, ?, ?
            FROM SalesDetails b WHERE b.sale_id = ?
        """, (transaction_id, LEDGER_SALES_REVENUE, doc['customer_id'], doc['user_id'], 
              doc['branch_id'], location_id, sale_id ) )


    conn.commit()
    return sale_id, inventorytransaction_id, accountsreceivable_id, payment_id, transaction_id

    
def AT_customer_payment(conn, doc):
    """
    Records a payment made to a supplier for a purchase order.

    :payment_date: when the payment is done
    :param conn: pyodbc connection to the database 
    :param doc: dictionary containing the rest of the transaction parameters
    :param doc['purchase_order_id']: ID of the purchase order for which the payment is made
    :param doc['amount_paid']: Amount of the payment
    """
    cursor = conn.cursor()
    description = "Payments of invoice"    
    transaction_type_id = PAYMENT_FROM_CUSTOMERS
    number_transaction = newnumbertransaction(conn,transaction_type_id)
    # Insert supplier payment record

    cursor.execute("""SELECT a.sale_id, b.branch_id, c.location_id, a.party_id FROM accountsreceivable a, sales b, branches c 
                    WHERE a.sale_id=b.id AND a.id=? AND b.branch_id=c.id""", (doc['accountsreceivable_id'],))    
    response = cursor.fetchone()
    
    if response:
        payment_id = newid(conn2, 'payments')
        sale_id, branch_id, location_id, customer_id = response
        cursor.execute("""UPDATE accountsreceivable SET balance = balance - ?, payment_status_id=?
                       WHERE id =?""", (doc['amount_paid'], PS_PAID, doc['accountsreceivable_id']))
        
        cursor.execute("""
        INSERT INTO Payments (id, party_id, amount, description, payment_date, payment_method_id, transaction_type_id,
        number_transaction, sale_id, user_id)
        VALUES (?,?,?,  ?,?,?,  ?,?,?,?)
    """,( payment_id, customer_id, doc['amount_paid'], description, doc['payment_date'], doc['payment_method_id'], transaction_type_id,
        number_transaction, sale_id, doc['user_id'] ) )

        cursor.execute("""UPDATE purchase_orders SET order_status_id = ?
                       WHERE id =?""", (PO_CLOSED, sale_id))

    transaction_id = newid(conn2, 'transactions')
    cursor.execute( f"""INSERT transactions(id, transaction_date, transaction_type_id, number_transaction, user_id)
    VALUES(?,?,?,?,?) """, (transaction_id, doc['payment_date'], transaction_type_id, number_transaction, doc['user_id']) ) 

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, ledger_account_id,  debit_credit, value,
            party_id , user_id , branch_id, location_id )                     
            VALUES (?,?,'C', ?,?,?,?,?)
        """, (transaction_id, LEDGER_ACCOUNTS_RECEIVABLE, doc['amount_paid'], doc['supplier_id'], doc['user_id'], 
              branch_id, location_id ) )

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, ledger_account_id,  debit_credit, value,
            party_id , user_id , branch_id, location_id )                     
            VALUES (?,?,'D', ?,?,?,?,?)
        """, (transaction_id, LEDGER_CASH, doc['amount_paid'], doc['supplier_id'], doc['user_id'], 
              branch_id, location_id ) )

    conn.commit()


def AT_return_and_refund(conn, doc):
    """
    Processes a product return, adjusts inventory, and issues a refund.
    
    :param conn: pyodbc connection to the database 
    :param doc: dictionary containing the rest of the transaction parameters 
    :param   
    :param doc['sale_detail_id']: ID of the sale detail for the returned product.
    :param doc['return_quantity']: Quantity of the product being returned.
    :param doc['reason']: Reason for the return.
    :param doc['return_date'] = date
    :param doc['invoicenumber'] 
    :param doc['product_id'] 
    :param doc['payment_method_id'] 
    :param doc['user_id'] 
    :param doc['approver_id'] 

    """
    cursor = conn.cursor()
    #return_date = refund_date = datetime.now().strftime('%Y-%m-%d')
            
    # Fetch sale ID and product ID from sale detail
    cursor.execute("""SELECT b.sale_id, b.price, a.customer_id, 
                   a.branch_id, b.quantity, c.location_id
                   FROM SalesDetails b, Sales a, branches c 
                   WHERE a.id=b.sale_id and a.branch_id=c.id and 
                   a.invoicenumber=? and b.product_id = ?""", (doc['invoicenumber'],doc['product_id']))
    sale_id, price, customer_id, branch_id, quantity, location_id = cursor.fetchone()
    if doc['return_quantity'] > quantity:
       raise Exception("The return quantity is higher than the sold quantity")  
        
    cursor.execute("""SELECT payment_status_id FROM accountsreceivable WHERE sale_id=?
                   """, (sale_id,)) 

    response = cursor.fetchone()  
    if response is None:       
       payment_status_id = PO_CLOSED
    else:
       payment_status_id = response[0] 

    if payment_status_id == PO_CLOSED:
       transaction_type_id = RETURN_PRODUCTS_ON_CASH
    else: 
       transaction_type_id = RETURN_PRODUCTS_ON_CREDIT_NOTES 

    number_transaction = newnumbertransaction(conn,transaction_type_id)

    # Calculate refund amount based on return quantity and price at sale
    refund_amount = doc['return_quantity'] * price

    transaction_id = newid(conn2, 'inventory_transactions')
    cursor.execute("""
        INSERT INTO Inventory_Transactions (id, transaction_type_id, transaction_date, branch_id, 
                   customer_id, sale_id, user_id)
        VALUES (?,?,?, ? ,?,?,?)
        """, (transaction_id, transaction_type_id, doc['return_date'],  branch_id, 
              customer_id, sale_id, doc['user_id']))

    cursor.execute("SELECT quantity, cost_avg FROM Inventory WHERE product_id = ? and branch_id=?", (doc['product_id'],branch_id))
    result = cursor.fetchone()
    if result:
        _, cost_avg = result 
        return_value = doc['return_quantity']*cost_avg
        # Update existing inventory record
        cursor.execute("""
            UPDATE Inventory SET quantity = quantity + ?, value = value+? WHERE product_id =? and branch_id = ?
            """, (doc['return_quantity'], return_value, doc['product_id'] , branch_id))
    else:
        cursor.execute("SELECT cost FROM products WHERE id=?", (doc['product_id'] ,))
        cost_avg = cursor.fetchone()[0]
        return_value = doc['return_quantity']*cost_avg
        # Insert new inventory record
        inventory_id = newid(conn2, 'inventory')
        cursor.execute(f"""
            INSERT INTO Inventory (id, product_id, branch_id, quantity, value) VALUES (?, ?, ?,?,?)
        """, (inventory_id, doc['product_id'], branch_id, doc['return_quantity'], return_value))

    detail_id = newid(conn2, 'inventory_transactions_detail')        
    # Record inventory transaction
    cursor.execute("""
        INSERT INTO inventory_transactions_detail (id, transaction_id, product_id, quantity, value)
        VALUES (?, ?, ?, ?, ?)
    """, (detail_id, transaction_id, doc['product_id'], doc['return_quantity'], return_value))

    # posting to the ledger
    transaction_id = newid(conn2, 'transactions')
    cursor.execute( f"""INSERT transactions(id, transaction_date, transaction_type_id, number_transaction, user_id)
    VALUES(?,?,?,?,?) """, (transaction_id, doc['return_date'], transaction_type_id, number_transaction, doc['user_id']) ) 

    # Record the refund 
    if transaction_type_id == RETURN_PRODUCTS_ON_CASH:
        description = "RETURN PRODUCTS ON CASH"
        payment_id = newid(conn2, 'payments')
        cursor.execute("""
        INSERT INTO Payments (id, party_id, amount, description, payment_date, payment_method_id, transaction_type_id,
        number_transaction, sale_id, user_id)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    """,( payment_id, customer_id, refund_amount, description, doc['return_date'], doc['payment_method_id'], transaction_type_id,
        number_transaction, sale_id, doc['user_id'] ) )

        cursor.execute("""
            INSERT INTO transaction_details( transaction_id, ledger_account_id,  debit_credit, value,
            party_id , user_id , branch_id, location_id, catalogue_item_id, description ) 
            VALUES (?,?,'C', ?,?,?,?,?,?, ?)
        """, (transaction_id, LEDGER_CASH, refund_amount, customer_id, doc['user_id'], 
              branch_id, location_id, doc['product_id'], description ) )

    else: # Credit note generation 
        reason = "RETURN_PRODUCTS_ON_CREDIT_NOTES" 

        accountsnote_id = newid(conn2, 'payments')
        cursor.execute("""
        INSERT INTO AccountNotes (id, debit_credit, party_id, sale_id, approver_id, date_issued, 
                       user_id, Amount ,Reason, transaction_type_id, number_transaction)
        VALUES (?,'C',?,?,?,  ?,?,?, ?,?,?)
        """, (accountsnote_id, customer_id, sale_id, doc['approver_id'], doc['return_date'], 
              doc['user_id'], refund_amount, reason, transaction_type_id, number_transaction ) )
       
        cursor.execute("""
            INSERT INTO transaction_details( transaction_id, debit_credit, ledger_account_id, value,
            party_id , user_id , branch_id, location_id, catalogue_item_id, description ) 
            VALUES (?,'C',?,? ,?,?,?,?, ?,?)
        """, (transaction_id, LEDGER_ACCOUNTS_RECEIVABLE, refund_amount, customer_id, doc['user_id'], 
              branch_id, location_id, doc['product_id'], reason ) )

    # posting to the ledger

    cursor.execute( """
    INSERT transaction_details( transaction_id, debit_credit, ledger_account_id, value, quantity,
    party_id , user_id , branch_id, catalogue_item_id, location_id ) 
    VALUES (?,'D',?,?,?   ,?,?,?,?,?)                """, 
    (transaction_id, LEDGER_INVENTORY, refund_amount,  doc['return_quantity'], customer_id, doc['user_id'],
     branch_id, doc['product_id'], location_id) ) 

    conn.commit()

# Payments 
# ===========================================================================================
    

# conn, payment_date, property_id, amount_paid, payment_method_id
def AT_rent_mortgage_payment(conn, doc):
    """
    Records a rent or mortgage payment for a property.

    :param conn: pyodbc connection to the database 
    :param doc: dictionary containing the rest of the transaction parameters    
    :param doc['payment_date']: when the payment is done 
    :param doc['property_id']: ID of the property for which the payment is made.
    :param doc['landlord_id']: Amount of the payment.
    :param doc['revenue_expense_category_id']: The expense category that the rent/mortgage is associated
    :param doc['businessunit_id']: The business unit that the rent/mortgage is associated
    """
    cursor = conn.cursor()
    description = "Payments of rent or mortgage"
    payment_id = newid(conn2, 'payments')
    transaction_type_id = PAYMENT_RENT_EXPENSES
    number_transaction = newnumbertransaction(conn,transaction_type_id)
    
    cursor.execute("""SELECT a.contract_type_id, b.payment_type_id, a.branch_id, a.expense_category, 
                   a.business_unit_id, a.party_id  FROM contracts a, contract_types b 
                   WHERE a.id=?""", (doc['contract_id'],))
    response = cursor.fetchone()
    if response is None:
       raise Exception("Invalid contract ID ")  
    
    contract_type_id, payment_type_id, branch_id, expense_category_id, business_unit_id,party_id = response[0]
    if transaction_type_id != payment_type_id:
       raise Exception("The contract ID is not for payment utility")  
      
    number_transaction = newnumbertransaction(conn,transaction_type_id)    
    cursor.execute("SELECT id, amount FROM PaymentSchedules WHERE payment_status_id=1 AND contract_id=? AND due_date <=?", (doc['contract_id'], doc['payment_date']))
    response = cursor.fetchone()
    if response is None:
       raise Exception("No PaymentSchedules found for the contract ")  

    schedule_id, amount_paid = response
    cursor.execute("UPDATE PaymentSchedules SET payment_status_id=? WHERE id=?", ( PS_PAID,schedule_id ))

    # Insert rent/mortgage payment record
    cursor.execute("""
        INSERT INTO Payments (id, party_id, amount, description, payment_date, payment_method_id, transaction_type_id,
        number_transaction, schedule_id, user_id, contract_type_id, contract_id)
        VALUES (?,?,?,?,  ?,?,?,?,  ?,?,?,?)
    """,( payment_id, party_id, amount_paid, description, doc['payment_date'], doc['payment_method_id'], transaction_type_id,
        number_transaction, schedule_id, doc['user_id'], contract_type_id, doc['contract_id'] ) )

    # posting to the ledger
    transaction_id = newid(conn2, 'transactions')
    cursor.execute( f"""INSERT transactions(id, transaction_date, transaction_type_id, number_transaction, user_id)
    VALUES(?,?,?,?,?) """, (transaction_id, doc['payment_date'], transaction_type_id, number_transaction, doc['user_id']) ) 

    cursor.execute("""
        INSERT INTO transaction_details( transaction_id, ledger_account_id,  debit_credit, value,
        party_id , user_id, revenue_expense_category_id, businessunit_id,  description, branch_id ) 
        VALUES (?,?,'D', ?,?,?,?,?,?, ?)
        """, (transaction_id, LEDGER_OPERATING_EXPENSES, amount_paid, party_id, doc['user_id'], 
             expense_category_id, business_unit_id, description, branch_id ) )

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, ledger_account_id,  debit_credit, value,
            party_id , user_id ,  description, branch_id ) 
            VALUES (?,?,'C', ?,?,?,?,?)
        """, (transaction_id, LEDGER_CASH, amount_paid, party_id, doc['user_id'], description, branch_id ) )

    conn.commit()



    


    #conn, payment_date, tax_type_id, branch_id, amount_paid, payment_method_id
def AT_sales_tax_payment(conn, doc):
    """
    Records a tax payment in the database.
    
    :param conn: pyodbc connection to the database 
    :param doc: dictionary containing the rest of the transaction parameters    
    :param doc['tax_type_id']: The ID of the tax type being paid.
    :param doc['branch_id']: The ID of the branch making the payment (can be None).
    :param doc['amount']: The amount of the tax payment.
    :param doc['revenue_expense_category_id']: The expense category that the rent/mortgage is associated
    :param doc['businessunit_id']: The business unit that the rent/mortgage is associated
    :param doc['taxtype_id'] : type of taxes 
    :param doc['taxauthority_id']:  tax authority
    :param doc['revenue_expense_category_id']: The expense category that the rent/mortgage is associated
    :param doc['businessunit_id']: The business unit that the rent/mortgage is associated
    :
    """
    cursor = conn.cursor()
    payment_id = newid(conn2, 'payments')
    transaction_type_id = PAYMENT_SALES_TAXES
    number_transaction = newnumbertransaction(conn,transaction_type_id)
    
    cursor.execute("SELECT id FROM PaymentSchedules WHERE tax_type_id=? and branch_id=?", (doc['tax_type_id'], doc['branch_id']))
    response = cursor.fetchone()
    if response is None:
       raise Exception("No PaymentSchedules found for the tax_type_id and branch_id")  

    taxliability_id = response[0]
    cursor.execute("""
        INSERT INTO Payments (id, party_id, amount, description, payment_date, payment_method_id, transaction_type_id,
        number_transaction, purchase_order_id, user_id)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    """,( payment_id, doc['taxauthority_id'], doc['amount_paid'], doc['description'], doc['payment_date'], doc['payment_method_id'], transaction_type_id,
        number_transaction, taxliability_id, doc['user_id'] ) )

    # posting to the ledger
    transaction_id = newid(conn2, 'transactions')
    cursor.execute( f"""
    INSERT transactions(id, transaction_date, transaction_type_id, number_transaction, user_id)
    VALUES(?,?,?,?,?) 
    """, (transaction_id, doc['payment_date'], transaction_type_id, number_transaction, doc['user_id']) ) 

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, party_id, ledger_account_id,  debit_credit, value,
            user_id, revenue_expense_category_id, businessunit_id, taxtype_id,  revenue_expense_category_id, description ) 
            VALUES (?,?,?,'D', ?,?,?,?,?,?,?)
        """, (transaction_id, doc['taxauthority_id'], LEDGER_TAX_EXPENSES, doc['amount_paid'], doc['user_id'], 
             doc['revenue_expense_category_id'], doc['businessunit_id'], doc['taxtype_id'], "TAX PAYMENT" ) )

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, party_id, ledger_account_id,  debit_credit, value,
            party_id , user_id , revenue_expense_category_id, businessunit_id, taxtype_id, revenue_expense_category_id, description ) 
            VALUES (?,?,?,'C', ?,?,?,?,?,?,?)
        """, (transaction_id, doc['taxauthority_id'], LEDGER_CASH, doc['amount_paid'], doc['user_id'], 
               doc['revenue_expense_category_id'], doc['businessunit_id'], doc['taxtype_id'], "TAX PAYMENT" ) )

    conn.commit()



from datetime import datetime, timedelta

def calculate_monthly_payment(P, annual_interest_rate, n):
    r = annual_interest_rate / 12 / 100  # Convert annual rate to monthly and percentage to decimal
    monthly_payment = P * (r * (1 + r)**n) / ((1 + r)**n - 1)
    return monthly_payment

def compute_payment_schedule(total_amount, interest_rate, start_date, end_date):
    if type(start_date) is str:
       start_date = datetime.strptime(start_date, '%Y-%m-%d')

    if type(end_date) is str:   
       end_date = datetime.strptime(end_date, '%Y-%m-%d')
    
    # Calculate total months
    n = (end_date.year - start_date.year) * 12 + end_date.month - start_date.month
    
    monthly_payment = calculate_monthly_payment(total_amount, interest_rate, n)
    
    schedule = []
    remaining_balance = total_amount
    current_date = start_date
    
    for _ in range(n):
        interest_payment = (interest_rate / 12 / 100) * remaining_balance
        principal_payment = monthly_payment - interest_payment
        remaining_balance -= principal_payment
        
        # Ensure the last payment adjusts to clear the balance due to rounding
        if remaining_balance < 0:
            monthly_payment += remaining_balance
            principal_payment += remaining_balance
            remaining_balance = 0
        
        schedule.append({
            'Date': current_date.strftime('%Y-%m-%d'),
            'Principal Payment': principal_payment,
            'Interest Payment': interest_payment,
            'Remaining Balance': remaining_balance
        })
        
        # Increment the date by one month
        month = current_date.month - 1 + 1
        year = current_date.year + month // 12
        month = month % 12 + 1
        day = min(current_date.day, [31, 28 + (year % 4 == 0 and year % 100 != 0 or year % 400 == 0), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month - 1])
        current_date = datetime(year, month, day)
        
    return schedule

# Example usage
#schedule = compute_payment_schedule(10000, 5, '2024-01-01', '2025-12-31')
#for payment in schedule[:2]:  # Just show the first 2 payments for brevity
#    print(payment)



def AT_loan_obtention(conn, doc):
    """
    Records of a loan.

    :param conn: pyodbc connection to the database 
    :param doc['name']:
    :param doc['bank_id']:
    :param doc['expense_category_id']:
    :param doc['business_unit_id']:
    :param doc['loan_date']:
    :param doc['start_date']:
    :param doc['end_date']:
    :param doc['total_amount']:
    :param doc['interest_rate']:
    :param doc['user_id']:
    :param doc['terms']:
    """
    cursor = conn.cursor()
    loan_id = newid(conn2, 'loans')
    description = "LOAN OBTENTION"
    transaction_type_id = OBTAINING_LOAN_FROM_BANK
    number_transaction = newnumbertransaction(conn,transaction_type_id)

    # Insert loan record
    cursor.execute("""
        INSERT INTO loans (id, name, bank_id, expense_category_id, business_unit_id, loan_date, start_date,
    end_date, total_amount, interest_rate, terms, user_id )
        VALUES (?, ?, ?, ?,  ?, ?, ?,  ?, ?, ?, ?, ?)
    """,( loan_id,  doc['name'], doc['bank_id'], doc['expense_category_id'], doc['business_unit_id'], 
         doc['loan_date'], doc['start_date'], doc['end_date'], doc['total_amount'], doc['interest_rate'], 
         doc['terms'], doc['user_id']) )

    # Insertion of payment schedule
    schedule = compute_payment_schedule(doc['total_amount'], doc['interest_rate'], doc['start_date'], doc['end_date'])
    for payment in schedule:
        amount = payment['Principal Payment'] + payment['Interest Payment']
        paymentschedule_id = newid(conn2, 'paymentschedule')
        cursor.execute("""
        INSERT INTO paymentschedule (id,  loan_id, due_date, payment_status_id,  amount,
        interest_paid, principal_paid, remaning_balance  )
        VALUES (?, ?, ?,  ?, ?, ?,  ?, ?)""",
        (paymentschedule_id, loan_id, payment['Date'], PS_UNPAID, amount,  
         payment['Principal Payment'] , payment['Interest Payment'], payment['Remaining Balance'] ) )

    # posting to the ledger
    transaction_id = newid(conn2, 'transactions')
    cursor.execute( f"""INSERT transactions(id, transaction_date, transaction_type_id, number_transaction, user_id)
    VALUES(?,?,?,?,?) """, (transaction_id, doc['loan_date'], transaction_type_id, number_transaction, doc['user_id']) ) 

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, party_id, ledger_account_id,  debit_credit, value,
            user_id, loan_id,  description ) 
            VALUES (?,?,?,'C', ?,?,?,?)
        """, (transaction_id, doc['bank_id'], LEDGER_LOANS_PAYABLE, doc['total_amount'], doc['user_id'], 
             loan_id, description ) )

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, party_id, ledger_account_id,  debit_credit, value,
            user_id, loan_id,  description ) 
            VALUES (?,?,?,'D', ?,?,?,?)
        """, (transaction_id, doc['bank_id'], LEDGER_CASH, doc['total_amount'], doc['user_id'], 
             loan_id, description ) )

    conn.commit()




def AT_loan_payment(conn, doc):
    """
    Records a payment made towards a loan.

    :param conn: pyodbc connection to the database 
    :param doc['payment_date']: when the payment is done 
    :param doc['loan_id']: ID of the property for which the payment is made.    
    :param doc['user_id']: ID of the user who perform the transaction
    :param doc['payment_method_id']: Payment method ID
    """
    cursor = conn.cursor()
    description = "Payments of loan"
    payment_id = newid(conn2, 'payments')
    transaction_type_id = PAYMENT_LOAN_INSTALLMENT_TO_BANK
    number_transaction = newnumbertransaction(conn,transaction_type_id)

    cursor.execute("""SELECT a.contract_type_id, b.payment_type_id, a.branch_id, a.expense_category, 
                   a.business_unit_id, a.party_id  FROM loans a, contract_types b 
                   WHERE a.id=?""", (doc['loan_id'],))
    response = cursor.fetchone()
    if response is None:
       raise Exception("Invalid contract ID ")  
    
    contract_type_id, payment_type_id, branch_id, expense_category_id, business_unit_id,party_id = response[0]
    if transaction_type_id != payment_type_id:
       raise Exception("The contract ID is not for payment utility")  
      
    number_transaction = newnumbertransaction(conn,transaction_type_id)    
    cursor.execute("SELECT id, amount,  interest_paid FROM PaymentSchedules WHERE payment_status_id=1 AND contract_id=? AND due_date <=?", (doc['contract_id'], doc['payment_date']))
    response = cursor.fetchone()
    if response is None:
       raise Exception("No PaymentSchedules found for the loan ")  

    schedule_id, principal_paid, interest_paid = response
    amount_paid = principal_paid +  interest_paid

    cursor.execute("UPDATE PaymentSchedules SET payment_status_id=? WHERE id=?", ( PS_PAID,schedule_id ))

    # Insert rent/mortgage payment record
    cursor.execute("""
        INSERT INTO Payments (id, party_id, amount, description, payment_date, payment_method_id, transaction_type_id,
        number_transaction, schedule_id, user_id, contract_type_id, contract_id)
        VALUES (?,?,?,?,  ?,?,?,?,  ?,?,?,?)
    """,( payment_id, party_id, amount_paid, description, doc['payment_date'], doc['payment_method_id'], transaction_type_id,
        number_transaction, schedule_id, doc['user_id'], contract_type_id, doc['contract_id'] ) )

    # posting to the ledger
    transaction_id = newid(conn2, 'transactions')
    cursor.execute( f"""INSERT transactions(id, transaction_date, transaction_type_id, number_transaction, user_id)
    VALUES(?,?,?,?,?) """, (transaction_id, doc['payment_date'], transaction_type_id, number_transaction, doc['user_id']) ) 

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, party_id, ledger_account_id,  debit_credit, value,
            user_id, revenue_expense_category_id, businessunit_id, loan_id, description, branch_id ) 
            VALUES (?,?,?,'D', ?,?,?,?,?,?,?)
        """, (transaction_id, party_id, LEDGER_LOANS_PAYABLE, principal_paid, doc['user_id'], 
             expense_category_id, business_unit_id, doc['contract_id'], "LOAN PRINCIPAL PAYMENT", branch_id ) )

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, party_id, ledger_account_id,  debit_credit, value,
            user_id, revenue_expense_category_id, businessunit_id, loan_id,  description, branch_id ) 
            VALUES (?,?,?,'D', ?,?,?,?,?,?,?)
        """, (transaction_id, party_id, LEDGER_INTEREST_EXPENSES, interest_paid, doc['user_id'], 
             expense_category_id, business_unit_id, doc['contract_id'], "LOAN INTEREST PAYMENT", branch_id ) )

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, party_id, ledger_account_id,  debit_credit, value,
            user_id , revenue_expense_category_id, businessunit_id, loan_id, description, branch_id ) 
            VALUES (?,?,?,'C', ?,?,?,?,?,?,?)
        """, (transaction_id, party_id, LEDGER_CASH, amount_paid, doc['user_id'], 
               expense_category_id, business_unit_id, doc['contract_id'], "LOAN (PRINCIPAL+INTERES) PAYMENT", branch_id ) )

    conn.commit()



def AT_insurance_reimbursements(conn, doc):
    """"
    Recording Claims Reimbursements: If an event covered by the policy occurs and the company receives a reimbursement from the insurer, this reimbursement must be appropriately recorded.
        Journal Entry for Reimbursement:
            Debit (Dr.) Cash or Banks: Increases by the value of the reimbursement received.
            Credit (Cr.) Insurance Reimbursement Income: The income from the reimbursement is recorded, which may be specifically identified as non-operating income if so defined by the company's accounting policy.

    :param conn: Database connection object
    :param doc['contract_id']: ID of the insurance policy for which the payment is made
    :param doc['payment_date']: payment date
    :param doc['amount_paid']: Amount of the payment
    :param doc['payment_method_id']:
    :param doc['user_id']
    """
    cursor = conn.cursor()
    description = "Insurance reimbursements"
    transaction_type_id = INSURANCE_REIMBURSEMET
    number_transaction = newnumbertransaction(conn,transaction_type_id)

    cursor.execute("""SELECT party_id, revenue_category_id FROM contracts WHERE id=?""", (doc['contract_id'],)) 

    response = cursor.fetchone()  
    if response is None:
       raise Exception("Account Receivable not found")  

    provider_id, revenue_category_id = response
    payment_id = newid(conn2, 'payments')
    # Insert insurance payment record
    cursor.execute("""
        INSERT INTO Payments (id, party_id, amount, description, payment_date, payment_method_id, 
                   transaction_type_id, number_transaction, contract_id, user_id)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    """,( payment_id, provider_id, doc['amount_paid'], description, doc['payment_date'], doc['payment_method_id'], 
         transaction_type_id, number_transaction, doc['contract_id'], doc['user_id'] ) )

    # posting to the ledger
    transaction_id = newid(conn2, 'transactions')
    cursor.execute( f"""INSERT transactions(id, transaction_date, transaction_type_id, number_transaction, user_id)
    VALUES(?,?,?,?,?) """, (transaction_id, doc['payment_date'], transaction_type_id, number_transaction, doc['user_id']) ) 

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, party_id, ledger_account_id,  debit_credit, value,
            user_id, contract_id,  revenue_expense_category_id, description ) 
            VALUES (?,?,?,'C', ?,?,?,?,?)
        """, (transaction_id, provider_id, LEDGER_INSURANCE_REIMBURSEMENT_INCOME, doc['amount_paid'], 
              doc['user_id'], doc['contract_id'], revenue_category_id, description ) )

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, party_id, ledger_account_id,  debit_credit, value,
            user_id , contract_id, revenue_expense_category_id, description ) 
            VALUES (?,?,?,'D', ?,?,?,?,?)
        """, (transaction_id, provider_id, LEDGER_CASH, doc['amount_paid'], doc['user_id'], 
               doc['contract_id'], revenue_category_id,  description ) )

    conn.commit()




def AT_insurance_amortization(conn, doc):
    """
    Amortization of the Insurance Premium: Over the coverage period, the company must recognize the insurance expense gradually. This is done by amortizing the prepaid cost of the insurance over the period covered by the policy.
        Journal Entry for Monthly Amortization:
            Debit (Dr.) Insurance Expense: Reflects the cost of insurance that corresponds to the period.
            Credit (Cr.) Prepaid Insurance Expense: Reduces the value of the prepaid asset, as part of this service has now been consumed.

    :param conn: Database connection object
    :param doc['contract_id']: ID of the insurance policy for which the payment is made
    :param doc['amortization_date']: payment date
    :param doc['user_id']
    """
    cursor = conn.cursor()
    description = "Insurance amortization"
    transaction_type_id = INSURANCE_AMORTIZATION
    number_transaction = newnumbertransaction(conn,transaction_type_id)

    cursor.execute("""SELECT party_id, location_id, branch_id, expense_category_id, business_unit_id, 
                   monthly_amount FROM Contracts WHERE id=?  """, (doc['contract_id'],) )

    provider_id, location_id, branch_id, expense_category_id, business_unit_id, monthly_amount =cursor.fetchone()
    # posting to the ledger
    transaction_id = newid(conn2, 'transactions')
    cursor.execute( f"""INSERT transactions(id, transaction_date, transaction_type_id, number_transaction, user_id)
    VALUES(?,?,?,?,?) """, (transaction_id, doc['amortization_date'], transaction_type_id, 
                            number_transaction, doc['user_id']) ) 

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, party_id, ledger_account_id,  debit_credit, value,
            user_id, contract_id,  revenue_expense_category_id, businessunit_id, branch_id, 
                   location_id, description ) 
            VALUES (?,?,?,'D',?, ?,?,?,?,?,  ?,?)
        """, (transaction_id, provider_id, LEDGER_PREPAID_INSURANCE_EXPENSES, monthly_amount, 
              doc['user_id'], doc['contract_id'],  expense_category_id, business_unit_id, branch_id, 
              location_id, description ) )

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, party_id, ledger_account_id,  debit_credit, value,
            user_id , contract_id, revenue_expense_category_id, businessunit_id, branch_id, 
                   location_id, description ) 
            VALUES (?,?,?,'C', ?,?,?,?,?,  ?,?,?)
        """, (transaction_id, provider_id, LEDGER_INSURANCE_EXPENSES, monthly_amount, 
              doc['user_id'], doc['contract_id'], expense_category_id, business_unit_id, branch_id, 
              location_id, description ) )

    conn.commit()



def AT_insurance_payment(conn, doc):
    """
    Recording the Insurance Premium: When a company acquires an insurance policy, it must record the payment of the premium. This payment is recorded as a prepaid expense (prepaid) on the balance sheet, as the insurance provides future benefits.
        Journal Entry for Premium Payment:
            Debit (Dr.) Prepaid Insurance Expense: This asset is increased since the company is prepaying for the insurance service.
            Credit (Cr.) Cash or Banks: This asset is decreased since the company is disbursing cash to pay the premium.

    :param conn: Database connection object
    :param doc['contract_date']: contract date
    :param doc['name']:
    :param doc['branch_id']:
    :param doc['location_id']:
    :param doc['provider_id']:
    :param doc['policy_type_id']:   -- e.g., 'Liability', 'Property', 'WorkersComp'
    :param doc['coverage_details']:
    :param doc['start_date']:
    :param doc['end_date']:
    :param doc['total_amount']: 
    :param doc['montly_amount']:     
    :param doc['payment_method_id']:
    :param doc['expense_category_id']:
    :param doc['revenue_category_id']:    
    :param doc['business_unit_id']:
    :param doc['user_id']:
    
    """    
    cursor = conn.cursor()
    description = "Payments of insurance policy"
    transaction_type_id = PAYMENT_INSURANCE
    number_transaction = newnumbertransaction(conn,transaction_type_id)

    contract_id = newid(conn2, 'contracts')
    # Insert InsurancePolicy record
    cursor.execute("""INSERT INTO contracts (id, contract_type_id, name, party_id, location_id,
    branch_id, expense_category_id, revenue_category_id, business_unit_id, contract_date,  start_date, end_date,
    total_amount, policy_type_id, terms  )
        VALUES (?,?,?,?,?,  ?,?,?, ?,?,?,  ?,?,?,?)
    """,( contract_id, CONTRACT_TYPE_INSURANCE_POLICY, doc['name'], doc['provider_id'], doc['location_id'],
          doc['branch_id'], doc['expense_category_id'],doc['revenue_category_id'], doc['business_unit_id'], doc['contract_date'], 
          doc['start_date'], doc['end_date'], doc['total_amount'] , doc['policy_type_id'],  doc['coverage_details'] ) )

    payment_id = newid(conn2, 'payments')
    # Insert insurance payment record
    cursor.execute("""
        INSERT INTO Payments (id, party_id, amount, description, payment_date, payment_method_id, 
                   transaction_type_id, number_transaction, contract_id, user_id)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    """,( payment_id, doc['provider_id'], doc['total_amount'], description, doc['contract_date'], doc['payment_method_id'], 
         transaction_type_id, number_transaction, contract_id, doc['user_id'] ) )

    # posting to the ledger
    transaction_id = newid(conn2, 'transactions')
    cursor.execute( f"""INSERT transactions(id, transaction_date, transaction_type_id, number_transaction, user_id)
    VALUES(?,?,?,?,?) """, (transaction_id, doc['contract_date'], transaction_type_id, number_transaction, doc['user_id']) ) 

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, party_id, ledger_account_id,  debit_credit, value,
            user_id, contract_id,  revenue_expense_category_id, description ) 
            VALUES (?,?,?,'D', ?,?,?,?,?)
        """, (transaction_id, doc['provider_id'], LEDGER_PREPAID_INSURANCE_EXPENSES, doc['total_amount'], 
              doc['user_id'], contract_id, doc['expense_category_id'], description ) )

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, party_id, ledger_account_id,  debit_credit, value,
            user_id , contract_id, revenue_expense_category_id, description ) 
            VALUES (?,?,?,'C', ?,?,?,?,?)
        """, (transaction_id, doc['provider_id'], LEDGER_CASH, doc['total_amount'], 
              doc['user_id'], contract_id, doc['expense_category_id'], description ) )

    conn.commit()
    return contract_id, payment_id


def AT_utility_payment(conn, doc):
    """
    Records utility service payment .

    :param conn: pyodbc connection to the database 
    :param doc: dictionary containing the rest of the transaction parameters    
    :param doc['payment_date']: when the payment is done 
    :param doc['contract_id']: ID of the property for which the payment is made.    
    :param doc['user_id']: ID of the user who perform the transaction
    :param doc['payment_method_id']: Payment method ID
    """
    cursor = conn.cursor()
    description = "Payments of utility services"
    payment_id = newid(conn2, 'payments')
    transaction_type_id = PAYMENT_UTILITIES_EXPENSES
    cursor.execute("""SELECT a.contract_type_id, b.payment_type_id, a.branch_id, a.expense_category, 
                   a.business_unit_id, a.party_id  FROM contracts a, contract_types b 
                   WHERE a.id=?""", (doc['contract_id'],))
    response = cursor.fetchone()
    if response is None:
       raise Exception("Invalid contract ID ")  
    
    contract_type_id, payment_type_id, branch_id, expense_category_id, business_unit_id,party_id = response[0]
    if transaction_type_id != payment_type_id:
       raise Exception("The contract ID is not for payment utility")  
      
    number_transaction = newnumbertransaction(conn,transaction_type_id)    
    cursor.execute("SELECT id, amount FROM PaymentSchedules WHERE payment_status_id=1 AND contract_id=? AND due_date <=?", (doc['contract_id'], doc['payment_date']))
    response = cursor.fetchone()
    if response is None:
       raise Exception("No PaymentSchedules found for the contract ")  

    schedule_id, amount_paid = response
    cursor.execute("UPDATE PaymentSchedules SET payment_status_id=? WHERE id=?", ( PS_PAID,schedule_id ))

    # Insert rent/mortgage payment record
    cursor.execute("""
        INSERT INTO Payments (id, party_id, amount, description, payment_date, payment_method_id, transaction_type_id,
        number_transaction, schedule_id, user_id, contract_type_id, contract_id)
        VALUES (?,?,?,?,  ?,?,?,?,  ?,?,?,?)
    """,( payment_id, party_id, amount_paid, description, doc['payment_date'], doc['payment_method_id'], transaction_type_id,
        number_transaction, schedule_id, doc['user_id'], contract_type_id, doc['contract_id'] ) )

    # posting to the ledger
    transaction_id = newid(conn2, 'transactions')
    cursor.execute( f"""INSERT transactions(id, transaction_date, transaction_type_id, number_transaction, user_id)
    VALUES(?,?,?,?,?) """, (transaction_id, doc['payment_date'], transaction_type_id, number_transaction, doc['user_id']) ) 

    cursor.execute("""
        INSERT INTO transaction_details( transaction_id, ledger_account_id,  debit_credit, value,
        party_id , user_id, revenue_expense_category_id, businessunit_id,  description, branch_id ) 
        VALUES (?,?,'D', ?,?,?,?,?,?, ?)
        """, (transaction_id, LEDGER_OPERATING_EXPENSES, amount_paid, party_id, doc['user_id'], 
             expense_category_id, business_unit_id, description, branch_id ) )

    cursor.execute("""
            INSERT INTO transaction_details( transaction_id, ledger_account_id,  debit_credit, value,
            party_id , user_id ,  description, branch_id ) 
            VALUES (?,?,'C', ?,?,?,?,?)
        """, (transaction_id, LEDGER_CASH, amount_paid, party_id, doc['user_id'], 
               description, branch_id ) )

    conn.commit()





# Miscelaneous 
# ==============================================================================

def calculate_annual_depreciation(cost, life_expectancy_years):
    return cost / life_expectancy_years

def AT_depreciation(conn, asset_id, life_expectancy_years):
    """
    Records annual depreciation for a tangible asset.
    
    :param conn: pyodbc connection to the database 
    :param doc['asset_id: ID of the asset being depreciated.
    :param doc['life_expectancy_years: Useful life of the asset in years.
    """
    cursor = conn.cursor()
    # Fetch asset cost

    transaction_type_id = DEPRECIATION
    cursor.execute(f"SELECT cost FROM Assets WHERE id = ?", (asset_id,))
    cost = cursor.fetchone()[0]
    
    # Calculate annual depreciation
    annual_depreciation_amount = calculate_annual_depreciation(cost, life_expectancy_years)
    
    # Assume depreciation starts a year after purchase
    depreciation_date = (datetime.now() + timedelta(days=365)).strftime('%Y-%m-%d')
    accumulated_depreciation = annual_depreciation_amount  # For the first year
    
    # Insert depreciation record
    cursor.execute(f"""
        INSERT INTO DepreciationSchedule (asset_id, depreciation_date, annual_depreciation_amount, accumulated_depreciation)
        VALUES (?, ?, ?, ?)
    """, (asset_id, depreciation_date, annual_depreciation_amount, accumulated_depreciation))
    conn.commit()
        


def AT_interest_transaction(conn, transaction_date, financial_account_id, amount, transaction_type):
    """

    Records an interest income or expense transaction and updates the financial account balance.
    
    :param conn: pyodbc connection to the database 
    :param doc['financial_account_id: ID of the financial account.
    :param doc['amount: Amount of the interest transaction.
    :param doc['transaction_type: Type of transaction ('Income' or 'Expense').
    """     
    
    cursor = conn.cursor()
    
    # Insert interest transaction record
    cursor.execute(f"""
        INSERT INTO InterestTransactions (financial_account_id, transaction_date, amount, transaction_type)
        VALUES (?, ?, ?, ?)
    """, (financial_account_id, transaction_date, amount, transaction_type))
    
    # Update financial account balance based on transaction type
    if transaction_type == 'Income':
        cursor.execute(f"""
            UPDATE FinancialAccounts SET balance = balance + ? WHERE id = ?
        """, (amount, financial_account_id))
    elif transaction_type == 'Expense':
        cursor.execute(f"""
            UPDATE FinancialAccounts SET balance = balance - ? WHERE id = ?
        """, (amount, financial_account_id))

    conn.commit()

