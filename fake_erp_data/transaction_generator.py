"""
This program generates fake accounting transactions for a retail 

"""
from utildb import getconn, check_table_exists
from datetime import datetime, timedelta
import random
from app_codes import *
from randomdocs import *

from create_table_strings import str_create_table
from retail_transactions import AT_payroll_record, AT_payroll_payment
from retail_transactions import AT_service_purchase_order
from retail_transactions import AT_purchase_order, AT_invoice_reception, AT_inventory_entry, AT_supplier_payment
from retail_transactions import AT_loan_obtention, AT_loan_payment
from retail_transactions import AT_sale_order, AT_sale_transaction, AT_customer_payment, AT_return_and_refund
from retail_transactions import AT_insurance_payment, AT_insurance_reimbursements, AT_insurance_amortization
from retail_transactions import AT_utility_payment, AT_tax_payment, AT_rent_mortgage_payment, AT_interest_transaction

conn = getconn()
cursor = conn.cursor()

transaction_tables = ['payments',  'transaction_details',  'transactions', 'inventory_transactions_detail', 
'inventory_transactions', 'Inventory',  'accountspayable',  'accountsreceivable',  'accountnotes',  'purchasesdetails',
'purchases','purchase_order_details', 'purchase_orders',  'SalesDetails', 'sales', 'employeedeductions', 'payroll'  ]


def createTransactionTables():
    for table_name in transaction_tables:
        if check_table_exists(conn, table_name):
           cursor.execute(f"drop table {table_name};")
           conn.commit()
    for table_name in reversed(transaction_tables):    
        ss = str_create_table[table_name.lower()] 
        cursor.execute(ss)
        conn.commit()
    cursor.execute("DELETE FROM counters;")
    conn.commit()



createTransactionTables()
ini_date_str = '2023-01-01'
ini_date = datetime.strptime(ini_date_str, '%Y-%m-%d')
for day in range(30): 
    date = (ini_date + timedelta(days=day))
    print('date ', date ) 
    n =random.randint(0,5)
    for _ in range(n):
        doc = get_purchase_order(date)
        total_amount = sum(quantity * price_at_order for _, quantity, price_at_order in doc['products'])
        #print('purchase_order: total_amount ', total_amount )
        purchase_order_id = AT_purchase_order(conn, doc)
        time_pass = random.randint(1, 5)
        date1 = (date + timedelta(days=time_pass)) 
        doc = get_invoice_reception(date1)
        time_pass = random.randint(1, 5)
        date1 = (date1 + timedelta(days=time_pass)) 
        doc = get_inventory_entry(date1, purchase_order_id)
        #print('get_inventory_entry ', doc, '  purchase_order_id ', purchase_order_id )
        inventory_transaction_id, accountspayable_id = AT_inventory_entry(conn, doc)
        time_pass = random.randint(1, 5)
        date1 = (date1 + timedelta(days=time_pass)) 
        doc = get_supplier_payment(date1, accountspayable_id)
        #print('get_supplier_payment ', doc, ' accountspayable_id ', accountspayable_id )
        AT_supplier_payment(conn,doc)

    n =random.randint(0,10)
    for _ in range(n):
        doc = get_sale_transaction(date)
        if  doc != {} : 
            sale_id, inventorytransaction_id, accountsreceivable_id, payment_id, transaction_id = AT_sale_transaction(conn,doc) 
            if accountsreceivable_id is not None:
              time_pass = random.randint(1, 5)
              date1 = (date + timedelta(days=time_pass)) 
              doc = get_customer_payment(date1, accountsreceivable_id)
              AT_customer_payment(conn, doc)        

            time_pass = random.randint(1, 5)
            date1 = (date1 + timedelta(days=time_pass)) 
            doc = get_return_and_refund(date1, sale_id )

    #Payroll process
    if  (day+1) % 30 == 0: 
        print('#Payroll process ')
        df_employees = read_sql_query("SELECT id, salary FROM employees", conn)
        for index, row in df_employees.iterrows():
            doc = get_payroll(date, row.id)
            payroll_id, accountspayable_id = AT_payroll_record(conn, doc) 
            date1 = (date + timedelta(days=3)) 
            doc = get_payroll_payment(date, payroll_id)
            AT_payroll_payment(conn, doc)

    #Loan obtention
    if  (day+1) % 20 == 0:
        print('#Loan obtention') 
        doc = get_loan_obtention(date)        
        AT_loan_obtention(conn, doc)
    
    doc = get_loan_payment(date)
    if doc != {}:
        AT_loan_payment(conn, doc)

# ==========================================================================================

