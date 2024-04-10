"""
This program contains functions to sample uniformly random rows from master tables
"""
import random
from utildb import read_sql_query, getconn

df_deductions, df_location, df_promotions, df_sales_channels, df_sales_points = None, None, None, None, None
df_services, df_invoiceproduct, df_suppliers, df_branches, df_products = None, None, None, None, None
df_customers, df_salespersons, df_purchase_orders, df_payment_terms = None, None, None, None
df_businees_units, df_revenue_expense_categories, df_users, df_payment_methods = None, None, None, None

conn = getconn()
cursor = conn.cursor()


def getRandomEmployee():
    global df_employees
    if df_employees is None:
       df_employees = read_sql_query("SELECT id, salary FROM employees", conn, ['id', 'salary'])
    index = random.randint(1, len(df_employees)-1)
    return int( df_employees['id'][index] ), int( df_employees['salary'][index] )
    

def getRandomBusinessUnit():
    global df_businees_units
    if df_businees_units is None:
        df_businees_units = read_sql_query("SELECT id FROM business_units", conn, ['id'])
    index = random.randint(0, len(df_businees_units)-1)
    return int(df_businees_units['id'][index])

def getRandomRevenueExpenseCategory():
    global df_revenue_expense_categories
    if df_revenue_expense_categories is None:
        df_revenue_expense_categories = read_sql_query("SELECT id FROM revenue_expense_categories", conn, ['id'])
    index = random.randint(0, len(df_revenue_expense_categories)-1)
    return int(df_revenue_expense_categories['id'][index])


def getRandomDeduction():
    global df_deductions
    if df_deductions is None:
        df_deductions = read_sql_query("SELECT id FROM deductions", conn, ['id'])
    index = random.randint(0, len(df_deductions)-1)
    return int(df_deductions['id'][index])


def getRandomLocation():
    global df_location
    if df_location is None:
        df_location = read_sql_query("SELECT id FROM locations", conn, ['id'])
    index = random.randint(0, len(df_location)-1)
    return int(df_location['id'][index])

def getRandomPromotion():
    global df_promotions
    if df_promotions is None:
        df_promotions = read_sql_query("SELECT id FROM promotions", conn, ['id'])
    index = random.randint(0, len(df_promotions)-1)
    return int(df_promotions['id'][index])

def getRandomSalesChannel():
    global df_sales_channels
    if df_sales_channels is None:
        df_sales_channels = read_sql_query("SELECT id FROM sales_channels", conn, ['id'])
    index = random.randint(0, len(df_sales_channels)-1)
    return int(df_sales_channels['id'][index])

def getRandomSalesPoint():
    global df_sales_points
    if df_sales_points is None:
        df_sales_points = read_sql_query("SELECT id, branch_id FROM sales_points", conn, ['id', 'branch_id'])
    index = random.randint(0, len(df_sales_points)-1)
    return int(df_sales_points['id'][index]), int(df_sales_points['branch_id'][index])

def getRandomService():
    global df_services
    if df_services is None:
        df_services = read_sql_query("SELECT id, selling_price FROM product_services WHERE product_service='S'", conn, ['id', 'selling_price'])
    index = random.randint(0, len(df_services)-1)
    return int(df_services['id'][index]), float(df_services['selling_price'][index])


def getRandomSupplier():
    global df_suppliers
    if df_suppliers is None:
        df_suppliers = read_sql_query("SELECT id FROM suppliers", conn, ['id'])
    index = random.randint(0, len(df_suppliers)-1)
    return int(df_suppliers['id'][index])

def getRandomBranch():
    global df_branches
    if df_branches is None:
        df_branches = read_sql_query("SELECT id FROM branches", conn, ['id'])
    index = random.randint(0, len(df_branches)-1)
    return int(df_branches['id'][index])

def getRandomProduct():
    global df_products
    if df_products is None:
        df_products = read_sql_query("SELECT id, selling_price FROM product_services WHERE product_service='P'", conn, ['id', 'selling_price'])
    index = random.randint(0, len(df_products)-1)
    return int(df_products['id'][index]), float(df_products['selling_price'][index])


def getRandomCustomer():
    global df_customers
    if df_customers is None:
        df_customers = read_sql_query("SELECT id FROM customers", conn, ['id'])
    index = random.randint(0, len(df_customers)-1)
    return int(df_customers['id'][index])

def getRandomUser():
    global df_users
    if df_users is None:
        df_users = read_sql_query("SELECT id FROM users", conn, ['id'])
    index = random.randint(0, len(df_users)-1)
    return int(df_users['id'][index])


def getRandomSalesperson():
    global df_salespersons
    if df_salespersons is None:
        df_salespersons = read_sql_query("SELECT id FROM salespersons", conn, ['id'])
    index = random.randint(0, len(df_salespersons)-1)
    return int(df_salespersons['id'][index])

def getRandomPurchaseOrder():
    global df_purchase_orders
    if df_purchase_orders is None:
        df_purchase_orders = read_sql_query("SELECT id, branch_id FROM purchase_orders WHERE order_status_id = 1", conn, ['id', 'branch_id'])
    index = random.randint(0, len(df_purchase_orders)-1)
    return int(df_purchase_orders['id'][index]), int(df_purchase_orders['branch_id'][index])

def getRandomPaymentTerm():
    global df_payment_terms
    if df_payment_terms is None:
        df_payment_terms = read_sql_query("SELECT id FROM payment_terms", conn, ['id'])
    index = random.randint(0, len(df_payment_terms)-1)
    return int(df_payment_terms['id'][index])

def getRandomPaymentMethod():
    global df_payment_methods
    if df_payment_methods is None:
        df_payment_methods = read_sql_query("SELECT id FROM payment_methods", conn, ['id'])
    index = random.randint(0, len(df_payment_methods)-1)
    return int(df_payment_methods['id'][index])

def getRandomInvoiceProduct():
    global df_invoiceproduct
    if df_invoiceproduct is None:
        df_invoiceproduct = read_sql_query("SELECT b.product_id, a.invoicenumber FROM SalesDetails b, Sales a WHERE a.id=b.sale_id", conn, ['product_id', 'invoicenumber'])
    index = random.randint(0, len(df_invoiceproduct)-1)
    return int(df_invoiceproduct['product_id'][index]), df_invoiceproduct['invoicenumber'][index]

