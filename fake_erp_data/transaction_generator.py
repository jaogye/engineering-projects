"""
This program generates fake accounting transactions for a retail 

"""

from utildb import getconn
from datetime import datetime, timedelta
import random
from app_codes import *
from randomrows import *
from retail_transactions import AT_payroll_record, AT_payroll_payment
from retail_transactions import AT_service_purchase_order
from retail_transactions import AT_purchase_order, AT_invoice_reception, AT_inventory_entry, AT_supplier_payment
from retail_transactions import AT_loan_payment, AT_loan_obtention
from retail_transactions import AT_sale_order, AT_sale_transaction, AT_customer_payment, AT_return_and_refund
from retail_transactions import AT_insurance_payment, AT_insurance_reimbursements, AT_insurance_amortization
from retail_transactions import AT_utility_payment, AT_tax_payment, AT_rent_mortgage_payment, AT_interest_transaction

conn = getconn()
cursor = conn.cursor()

def get_payroll(date):    
    doc ={}
    employee_id, gross_salary = getRandomEmployee()
        
    doc['payroll_date'] = date
    doc['employee_id'] = employee_id
    doc['period_start'] = (date + timedelta(days=-30)) 
    doc['period_end'] = date
    doc['gross_salary'] = gross_salary
    doc['hours_worked'] = random.randint(140, 200)
    doc['user_id'] = getRandomUser()
    deductions = []
    n = random.randint(1, 5)
    for _ in range(n):  
        id = getRandomDeduction()
        amount = random.randint(10, 200)  
        deductions.append((id,amount))

    doc['deductions'] = deductions
    print('AT_payroll ', doc )
    #AT_payroll_record(conn, doc)    
    
    return doc 

# =======================================================================

def get_purchase_order(date):    
    doc ={}        
    doc['supplier_id'] = getRandomSupplier()
    doc['payment_term_id'] = getRandomPaymentMethod()
    doc['branch_id'] = getRandomBranch()
    doc['order_date'] = date     
    doc['user_id'] = getRandomUser()    
    products = []
    n = random.randint(1, 5)
    for _ in range(n):              
        product_id, price = getRandomProduct()
        quantity = random.randint(20, 200)
        products.append((product_id,quantity, price))

    doc['products'] = products

    #print('get_purchase_order ', doc )
    #AT_purchase_order(conn, doc)
    return doc 


def get_invoice_reception(date):
        
    doc = {}        
    doc['purchase_order_id'] = 0
    doc['reception_date'] = date     
    doc['user_id'] = getRandomUser()
    doc['invoicenumber'] = str(random.randint(0,100000) )

    # print('AT_purchase_transaction ', doc )         
    #AT_invoice_reception(conn, doc)           
    return doc     


def get_sale_order(date):    
    doc ={}        
    doc['customer_id'] = getRandomCustomer()
    doc['payment_term_id'] = getRandomPaymentMethod()
    doc['branch_id'] = getRandomBranch()
    doc['order_date'] = date     
    doc['user_id'] = getRandomUser()    
    products = []
    n = random.randint(1, 5)
    for _ in range(n):              
        product_id, price = getRandomProduct()
        quantity = random.randint(20, 200)
        products.append((product_id,quantity, price))

    doc['products'] = products

    #print('get_sale_order ', doc )
    #AT_sale_order(conn, doc)
    return doc 

def get_sale_transaction(date):
        
    sales_point_id, branch_id = getRandomSalesPoint()            
    doc = {}        
    doc['sales_point_id'] = sales_point_id
    doc['branch_id'] = branch_id
    doc['customer_id'] = getRandomCustomer()
    doc['salesperson_id'] = getRandomSalesperson()
    doc['sales_channel_id'] = getRandomSalesChannel()
    doc['promotion_id'] = getRandomPromotion()
    doc['payment_term_id'] = getRandomPaymentTerm()
    doc['payment_method_id'] = getRandomPaymentMethod()
    doc['businessunit_id'] = getRandomBusinessUnit()
    doc['sale_date'] = date     
    doc['user_id'] = getRandomUser()
    doc[ 'revenue_expense_category_id'] = getRandomRevenueExpenseCategory()
    products = []
    cursor.execute("""SELECT a.product_id, b.selling_price, a.quantity FROM Inventory a, product_services b
                    WHERE a.product_id=b.id and a.quantity > 0 and a.branch_id=?""", (branch_id,))
    available_products = cursor.fetchall()
    if available_products is not None:
        for product_id, price, tot_quantity in available_products:
            quantity = random.randint(1, 2)
            products.append((product_id,quantity, price))
    
    if products == []:
       doc = {} 
    else:    
       doc['products'] = products

    # print('AT_sale_transaction ', doc )         
    #AT_sale_transaction(conn, doc)           
    return doc     




def get_customer_payment(date, accountsreceivable_id):
    cursor.execute("""SELECT party_id, balance FROM accountsreceivable 
                       WHERE id =?""", (accountsreceivable_id, ))    
    response = cursor.fetchone()
    if response is None:
       raise Exception("No payments for any customer_id " )
    
    customer_id, amount_paid = response    
    doc = {}
    doc['accountsreceivable_id'] = accountsreceivable_id
    doc['payment_date'] = date 
    doc['supplier_id'] = customer_id
    doc['amount_paid'] = int(amount_paid)
    doc['payment_method_id'] = getRandomPaymentMethod()
    doc['user_id'] = getRandomUser()
    return doc 



def get_return_and_refund(date, sale_id ):

    cursor.execute("""SELECT s.invoicenumber, b.product_id, b.quantity 
        FROM inventory_transactions a, inventory_transactions_detail b, sales s 
        WHERE a.id=b.transaction_id and a.sale_id=s.id and s.id=?""", (sale_id,))
    data = cursor.fetchall()
    ii = random.randint(0, len(data)-1)
    invoicenumber, product_id, quantity = data[ii]

    reason = "Bad packing material"
    doc={}
    doc['return_date'] = date
    doc['invoicenumber'] = invoicenumber 
    doc['product_id'] = product_id
    doc['payment_method_id'] = getRandomPaymentMethod()
    doc['return_quantity'] = quantity
    doc['reason'] = reason
    doc['user_id'] = getRandomUser()
    doc['approver_id'] = getRandomUser()

    # print('AT_return_and_refund ',date, doc)         
    #AT_return_and_refund(conn, doc )
    return doc     

def get_inventory_entry(date, purchase_order_id):
    doc = {}
    doc['entry_date'] = date
    doc['purchase_order_id'] = purchase_order_id
    doc['user_id'] = getRandomUser()
    return doc


def get_supplier_payment(date, accountspayable_id):
    cursor.execute("""SELECT party_id, balance FROM accountspayable 
                       WHERE id =?""", (accountspayable_id, ))    
    response = cursor.fetchone()
    if response is None:
       raise Exception("No payments for any supplier_id " )
    
    supplier_id, amount_paid = response    
    doc = {}
    doc['payment_date'] = date 
    doc['supplier_id'] = supplier_id
    doc['amount_paid'] = int(amount_paid)
    doc['payment_method_id'] = getRandomPaymentMethod()
    doc['user_id'] = getRandomUser()
    return doc 



def get_service_purchase_order(date):
    doc = {}        
    doc['vendor_id'] = getRandomSupplier()
    doc['branch_id'] = getRandomBranch()
    doc['payment_term_id'] = getRandomPaymentTerm()
    doc['order_date'] = date
    doc['user_id'] = getRandomUser()

    services_ordered = []
    n = random.randint(1, 5)
    for _ in range(n):  
        service_id = getRandomService()
        price = random.randint(100, 400)/100  
        services_ordered.append((service_id, price))

    doc['services_ordered'] = services_ordered

        #print('AT_service_purchase_order ', date, vendor_id, branch_id, payment_term_id) 
        #AT_service_purchase_order(conn, doc) 
    return doc 


ini_date_str = '2023-01-01'
ini_date = datetime.strptime(ini_date_str, '%Y-%m-%d')
for i in range(30):    
    date = (ini_date + timedelta(days=i))
    print('date ', date ) 
    n =random.randint(0,5)
    for _ in range(n):
        doc = get_purchase_order(date)
        total_amount = sum(quantity * price_at_order for _, quantity, price_at_order in doc['products'])
        print('purchase_order: total_amount ', total_amount )
        purchase_order_id = AT_purchase_order(conn, doc)
        time_pass = random.randint(1, 5)
        date2 = (ini_date + timedelta(days=time_pass)) 
        doc = get_invoice_reception()

        time_pass = random.randint(1, 5)
        date2 = (ini_date + timedelta(days=time_pass)) 

        doc = get_inventory_entry(date2, purchase_order_id)
        print('get_inventory_entry ', doc, '  purchase_order_id ', purchase_order_id )
        inventory_transaction_id, accountspayable_id = AT_inventory_entry(conn, doc)
        time_pass = random.randint(1, 5)
        date3 = (date2 + timedelta(days=time_pass)) 
        doc = get_supplier_payment(date3, accountspayable_id)
        print('get_supplier_payment ', doc, ' accountspayable_id ', accountspayable_id )
        AT_supplier_payment(conn,doc)

    n =random.randint(0,10)
    for _ in range(n):
        doc = get_sale_transaction(date)
        if  doc != {} : 
            sale_id, inventorytransaction_id, accountsreceivable_id, payment_id, transaction_id = AT_sale_transaction(conn,doc) 
            if accountsreceivable_id is not None:
              time_pass = random.randint(1, 5)
              date4 = (date + timedelta(days=time_pass)) 
              doc = get_customer_payment(date4, accountsreceivable_id)
              AT_customer_payment(conn, doc)        

            time_pass = random.randint(1, 5)
            date5 = (date + timedelta(days=time_pass)) 
            doc = get_return_and_refund(date, sale_id )

# ==========================================================================================

