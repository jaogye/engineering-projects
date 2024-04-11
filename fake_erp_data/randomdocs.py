
from randomrows import *
from datetime import datetime, timedelta
conn = getconn()
cursor = conn.cursor()


def get_payroll(date, employee_id=None):    
    doc ={}
    gross_salary = random.randint(1800, 4000)
    if employee_id is None:
       employee_id, gross_salary = getRandomEmployee()

    doc['payroll_date'] = date
    doc['employee_id'] = employee_id
    doc['period_start'] = (date + timedelta(days=-30)) 
    doc['period_end'] = date
    doc['gross_salary'] = gross_salary
    doc['hours_worked'] = random.randint(140, 200)
    doc['user_id'] = getRandomUser()
    doc['branch_id'] = getRandomBranch()
    doc['expense_category_id'] = getRandomExpenseCategory()
    doc['businessunit_id'] = getRandomBusinessUnit()

    deductions = []
    n = random.randint(1, 5)
    for _ in range(n):  
        id = getRandomDeduction()
        amount = random.randint(10, 200)  
        deductions.append((id,amount))

    doc['deductions'] = deductions
    #print('AT_payroll ', doc )
    #AT_payroll_record(conn, doc)    
    
    return doc 

def get_payroll_payment(date, payroll_id):
    doc = {}  
    doc['payment_date'] = date
    doc['payroll_id'] = payroll_id 
    doc['payment_method_id'] = getRandomPaymentMethod()
    doc['user_id'] = getRandomUser()

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
    doc[ 'revenue_expense_category_id'] = getRandomRevenueCategory()
    products = []
    cursor.execute("""SELECT a.product_id, b.selling_price FROM Inventory a, product_services b
                    WHERE a.product_id=b.id and a.quantity > 1 and a.branch_id=?""", (branch_id,))
    available_products = cursor.fetchall()
    if available_products is not None:
        for product_id, price in available_products:
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


def get_loan_obtention(date):
    doc = {}    
    doc['name'] = ''
    doc['bank_id'] = getRandomBank()
    doc['user_id'] = getRandomUser()
    doc['expense_category_id'] = getRandomExpenseCategory()
    doc['business_unit_id'] = getRandomBusinessUnit()
    time_pass = random.randint(1, 5)
    doc['loan_date'] = date
    doc['start_date'] = (date + timedelta(days=time_pass)) 
    time_pass = random.randint(90, 365)
    doc['end_date'] =  (date + timedelta(days=time_pass))     
    doc['total_amount'] = random.randint(5000,10000)
    doc['interest_rate'] = random.randint(5,10)    
    doc['terms'] = ''
    return doc

def get_loan_payment(date):
    doc = {}
    id, loan_id, amount = getRandomPaymentSchedule(date)
    if id is not None:
       doc['payment_date'] = date
       doc['loan_id'] = loan_id
       doc['user_id'] = getRandomUser()
       doc['payment_method_id'] = getRandomPaymentMethod()
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
