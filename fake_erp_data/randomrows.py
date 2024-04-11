"""
This program contains functions to sample uniformly random rows from master tables
"""
import random
from utildb import read_sql_query, getconn


conn = getconn()
cursor = conn.cursor()
df_dic = {}

def getRandomPaymentSchedule(date):
    if  'PaymentSchedules' not in df_dic:
        sql = f"""SELECT id, loan_id, amount FROM PaymentSchedule 
        WHERE payment_status_id=1 and due_date < '{date}'"""
        #print('sql ', sql )
        df_dic['PaymentSchedules'] = read_sql_query(sql, conn)
    if len(df_dic['PaymentSchedules']) > 0 :    
       index = random.randint(1, len(df_dic['PaymentSchedules'])-1)
       id = int( df_dic['PaymentSchedules']['id'][index] )
       loan_id = int( df_dic['PaymentSchedules']['loan_id'][index] )
       amount = float( df_dic['PaymentSchedules']['amount'][index] )
    else:
       id, loan_id, amount = None, None, None    
    return id, loan_id, amount


def getRandomBank():
    if 'banks' not in df_dic:
       df_dic['banks'] = read_sql_query("SELECT id FROM banks", conn)
    index = random.randint(1, len(df_dic['banks'])-1)
    return int( df_dic['banks']['id'][index] )


def getRandomEmployee():
    if 'employees' not in df_dic:
       df_dic['employees'] = read_sql_query("SELECT id, salary FROM employees", conn)
    index = random.randint(1, len(df_dic['employees'])-1)
    return int( df_dic['employees']['id'][index] ), int( df_dic['employees']['salary'][index] )
    

def getRandomBusinessUnit():    
    if  'businees_units' not in df_dic:
        df_dic['businees_units'] = read_sql_query("SELECT id FROM business_units", conn)
    index = random.randint(0, len(df_dic['businees_units'])-1)
    return int(df_dic['businees_units']['id'][index])

def getRandomExpenseCategory():
    if  'expense_categories' not in df_dic:
        df_dic['expense_categories'] = read_sql_query("SELECT id FROM revenue_expense_categories WHERE revenue_expense='E'", conn)
    index = random.randint(0, len(df_dic['expense_categories'])-1)
    return int(df_dic['expense_categories']['id'][index])

def getRandomRevenueCategory():
    if  'revenue_categories' not in df_dic:
        df_dic['revenue_categories'] = read_sql_query("SELECT id FROM revenue_expense_categories  WHERE revenue_expense='R'", conn)
    index = random.randint(0, len(df_dic['revenue_categories'])-1)
    return int(df_dic['revenue_categories']['id'][index])


def getRandomDeduction():

    if  'deductions' not in df_dic:
        df_dic['deductions'] = read_sql_query("SELECT id FROM deductions", conn)
    index = random.randint(0, len(df_dic['deductions'])-1)
    return int(df_dic['deductions']['id'][index])


def getRandomLocation():

    if  'location' not in df_dic:
        df_dic['location'] = read_sql_query("SELECT id FROM locations", conn )
    index = random.randint(0, len(df_dic['location'])-1)
    return int(df_dic['location']['id'][index])

def getRandomPromotion():

    if  'promotions' not in df_dic:
        df_dic['promotions'] = read_sql_query("SELECT id FROM promotions", conn )
    index = random.randint(0, len(df_dic['promotions'])-1)
    return int(df_dic['promotions']['id'][index])

def getRandomSalesChannel():
    if  'sales_channels' not in df_dic:
        df_dic['sales_channels'] = read_sql_query("SELECT id FROM sales_channels", conn )
    index = random.randint(0, len(df_dic['sales_channels'])-1)
    return int(df_dic['sales_channels']['id'][index])

def getRandomSalesPoint():
    if  'sales_points' not in df_dic:
        df_dic['sales_points'] = read_sql_query("SELECT id, branch_id FROM sales_points", conn)
    index = random.randint(0, len(df_dic['sales_points'])-1)
    return int(df_dic['sales_points']['id'][index]), int(df_dic['sales_points']['branch_id'][index])

def getRandomService():
    if  'services' not in df_dic:
        df_dic['services'] = read_sql_query("SELECT id, selling_price FROM product_services WHERE product_service='S'", conn)
    index = random.randint(0, len(df_dic['services'])-1)
    return int(df_dic['services']['id'][index]), float(df_dic['services']['selling_price'][index])


def getRandomSupplier():
    if  'suppliers' not in df_dic:
        df_dic['suppliers'] = read_sql_query("SELECT id FROM suppliers", conn )
    index = random.randint(0, len(df_dic['suppliers'])-1)
    return int(df_dic['suppliers']['id'][index])

def getRandomBranch():
    if  'branches' not in df_dic:
        df_dic['branches'] = read_sql_query("SELECT id FROM branches", conn )
    index = random.randint(0, len(df_dic['branches'])-1)
    return int(df_dic['branches']['id'][index])

def getRandomProduct():
    if  'products' not in df_dic:
        df_dic['products'] = read_sql_query("SELECT id, selling_price FROM product_services WHERE product_service='P'", conn)
    index = random.randint(0, len(df_dic['products'])-1)
    return int(df_dic['products']['id'][index]), float(df_dic['products']['selling_price'][index])


def getRandomCustomer():
    if  'customers' not in df_dic:
        df_dic['customers'] = read_sql_query("SELECT id FROM customers", conn )
    index = random.randint(0, len(df_dic['customers'])-1)
    return int(df_dic['customers']['id'][index])

def getRandomUser():
    if  'users' not in df_dic:
        df_dic['users'] = read_sql_query("SELECT id FROM users", conn )
    index = random.randint(0, len(df_dic['users'])-1)
    return int(df_dic['users']['id'][index])


def getRandomSalesperson():
    if  'salespersons' not in df_dic:
        df_dic['salespersons'] = read_sql_query("SELECT id FROM salespersons", conn )
    index = random.randint(0, len(df_dic['salespersons'])-1)
    return int(df_dic['salespersons']['id'][index])

def getRandomPurchaseOrder():
    if  'purchase_orders' not in df_dic:
        df_dic['purchase_orders'] = read_sql_query("SELECT id, branch_id FROM purchase_orders WHERE order_status_id = 1", conn)
    index = random.randint(0, len(df_dic['purchase_orders'])-1)
    return int(df_dic['purchase_orders']['id'][index]), int(df_dic['purchase_orders']['branch_id'][index])

def getRandomPaymentTerm():
    if  'payment_terms' not in df_dic:
        df_dic['payment_terms'] = read_sql_query("SELECT id FROM payment_terms", conn )
    index = random.randint(0, len(df_dic['payment_terms'])-1)
    return int(df_dic['payment_terms']['id'][index])

def getRandomPaymentMethod():
    if  'payment_methods' not in df_dic:
        df_dic['payment_methods'] = read_sql_query("SELECT id FROM payment_methods", conn )
    index = random.randint(0, len(df_dic['payment_methods'])-1)
    return int(df_dic['payment_methods']['id'][index])

def getRandomInvoiceProduct():
    if  'invoiceproduct' not in df_dic:
        df_dic['invoiceproduct'] = read_sql_query("SELECT b.product_id, a.invoicenumber FROM SalesDetails b, Sales a WHERE a.id=b.sale_id", conn)
    index = random.randint(0, len(df_dic['invoiceproduct'])-1)
    return int(df_dic['invoiceproduct']['product_id'][index]), df_dic['invoiceproduct']['invoicenumber'][index]

