"""
This program contains functions to sample uniformly random rows from master tables
"""
import random
from utildb import read_sql_query, getconn, check_table_exists
from faker import Faker
import pandas as pd
from create_table_strings import str_create_table

parties_types = {}
parties_types['users'] = {}
parties_types['users']['typeparty_id'] = 1
parties_types['users']['%'] = 0.02
parties_types['users']['source'] = 'persons'
parties_types['employees'] = {}
parties_types['employees']['typeparty_id'] = 2
parties_types['employees']['%'] = 0.2
parties_types['employees']['source'] = 'persons'
parties_types['suppliers'] = {}
parties_types['suppliers']['typeparty_id'] = 3
parties_types['suppliers']['%'] = 0.2
parties_types['suppliers']['source'] = 'companies'
parties_types['customers'] = {}
parties_types['customers']['typeparty_id'] = 4
parties_types['customers']['%'] = 0.4
parties_types['customers']['source'] = 'persons' 
parties_types['salespersons'] = {}
parties_types['salespersons']['typeparty_id'] = 5
parties_types['salespersons']['%'] = 0.01
parties_types['salespersons']['source'] = 'persons'
parties_types['landlords'] = {}
parties_types['landlords']['typeparty_id'] = 6
parties_types['landlords']['%'] = 0.02
parties_types['landlords']['source'] = 'companies'
parties_types['service_providers'] = {}
parties_types['service_providers']['typeparty_id'] = 7
parties_types['service_providers']['%'] = 0.05
parties_types['service_providers']['source'] = 'companies'
parties_types['vendors'] = {}
parties_types['vendors']['typeparty_id'] = 7
parties_types['vendors']['%'] = 0.05
parties_types['vendors']['source'] = 'companies'
parties_types['banks'] = {}
parties_types['banks']['typeparty_id'] = 7
parties_types['banks']['%'] = 0.05
parties_types['banks']['source'] = 'companies'
parties_types['taxauthorities'] = {}
parties_types['taxauthorities']['typeparty_id'] = 7
parties_types['taxauthorities']['%'] = 0.05
parties_types['taxauthorities']['source'] = 'companies'


fake = Faker()
conn = getconn()
cursor = conn.cursor()
df_dic = {}

def getRandomServiceProvider():
    if 'service_providers' not in df_dic:
       df_dic['service_providers'] = read_sql_query("SELECT id FROM service_providers", conn)

    index = random.randint(1, len(df_dic['service_providers'])-1)
    return int( df_dic['service_providers']['id'][index] )


def getRandomPolicyType():
    if 'policy_types' not in df_dic:
       df_dic['policy_types'] = read_sql_query("SELECT id FROM policy_types", conn)       
    index = random.randint(1, len(df_dic['policy_types'])-1)
    return int( df_dic['policy_types']['id'][index] )


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


def getRandomPaymentSchedule(date):
    if  'PaymentSchedules' not in df_dic:
        sql = f"""SELECT id, loan_id, amount FROM PaymentSchedule 
        WHERE payment_status_id=1 and due_date < '{date}'"""
        df_dic['PaymentSchedules'] = read_sql_query(sql, conn)
    if len(df_dic['PaymentSchedules']) > 0 :    
       index = random.randint(1, len(df_dic['PaymentSchedules'])-1)
       id = int( df_dic['PaymentSchedules']['id'][index] )
       loan_id = int( df_dic['PaymentSchedules']['loan_id'][index] )
       amount = float( df_dic['PaymentSchedules']['amount'][index] )
    else:
       id, loan_id, amount = None, None, None    
    return id, loan_id, amount


def getRandomVendor():    
    if  'vendors' not in df_dic:
        df_dic['vendors'] = read_sql_query("SELECT id FROM vendors", conn)

    index = random.randint(0, len(df_dic['vendors'])-1)
    return int(df_dic['vendors']['id'][index])

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


def getRandomUtilityType():
    if  'utility_types' not in df_dic:
        df_dic['utility_types'] = read_sql_query("SELECT id FROM utility_types", conn)
    index = random.randint(0, len(df_dic['utility_types'])-1)
    return int(df_dic['utility_types']['id'][index])


def getRandomProductCategory():
    if  'product_categories' not in df_dic:
        df_dic['product_categories'] = read_sql_query("SELECT id FROM product_categories", conn)
    index = random.randint(0, len(df_dic['product_categories'])-1)
    return int(df_dic['product_categories']['id'][index])


def getRandomDeduction():
    if  'deductions' not in df_dic:
        df_dic['deductions'] = read_sql_query("SELECT id FROM deductions", conn)
    index = random.randint(0, len(df_dic['deductions'])-1)
    return int(df_dic['deductions']['id'][index])


def getRandomDepartment():
    if  'departments' not in df_dic:
        df_dic['departments'] = read_sql_query("SELECT id FROM departments", conn)
    index = random.randint(0, len(df_dic['departments'])-1)
    return int(df_dic['departments']['id'][index])


def getRandomUnitMeasure():
    if  'unit_measures' not in df_dic:
        df_dic['unit_measures'] = read_sql_query("SELECT id FROM unit_measures", conn)
    index = random.randint(0, len(df_dic['unit_measures'])-1)
    return int(df_dic['unit_measures']['id'][index])



def getRandomCustomerSegment():
    if  'customer_segments' not in df_dic:
        df_dic['customer_segments'] = read_sql_query("SELECT id FROM customer_segments", conn)
    index = random.randint(0, len(df_dic['customer_segments'])-1)
    return int(df_dic['customer_segments']['id'][index])


def getRandomLocation():
    if  'location' not in df_dic:
        df_dic['location'] = read_sql_query("""SELECT a.id, a.city, a.state, a.postal_code, a.country_id, 
        b.name country  FROM locations a, countries b WHERE a.country_id=b.id""", conn )
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
        df_dic['services'] = read_sql_query("SELECT id FROM services", conn)
    index = random.randint(0, len(df_dic['services'])-1)
    return int(df_dic['services']['id'][index])


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
        df_dic['products'] = read_sql_query("SELECT id, selling_price FROM products", conn)
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




def filling_parties(conn, count_persons=2000, count_companies=1000):
   cursor = conn.cursor()
   table_name = 'parties'    
   id = 1
   for i in range(count_companies+count_persons): 
      location_id = getRandomLocation()
      row = df_dic['location'].loc[df_dic['location']['id']== location_id  ] 
      country_id = row.country_id.to_list()[0] 
      city = row.city.to_list()[0] 
      postal_code = row.postal_code.to_list()[0] 
      state = row.state.to_list()[0] 
      department_id = getRandomDepartment()
      branch_id = getRandomBranch()
      address = fake.address()
      address = address.replace("'","''")     
      phone_number = fake.phone_number() 
      email = fake.ascii_email()
      customer_segment_id = getRandomCustomerSegment()
      if i < count_companies:         
         company_or_person = 'C'
         name = fake.company()
         contact_name = fake.name()                           
         utility_type_id = getRandomUtilityType()
         last_name = None
         first_name = None
         hire_date = None
         birth_date = None
         Salary = None
      else:
         company_or_person = 'P'         
         last_name = fake.last_name()
         first_name = fake.first_name()
         name = first_name.strip() + ' ' + last_name.strip()               
         contact_name = None
         utility_type_id = None
         hire_date = fake.date_of_birth(minimum_age=1, maximum_age=9).isoformat()
         birth_date = fake.date_of_birth(minimum_age=18, maximum_age=90).isoformat()
         Salary = fake.random_int(min=1500, max=4000)
         email = fake.ascii_company_email()
      cursor.execute(f"""INSERT INTO {table_name} (id, company_or_person, name, birth_date, location_id,
      first_name, last_name, department_id,  email, phone_number, hire_date, branch_id, Salary, address,
      city, country_id, contact_name, customer_segment_id, utility_type_id, postal_code, state )
      VALUES( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? )
      """, (id, company_or_person, name, birth_date, location_id, first_name, last_name, department_id,  
            email, phone_number, hire_date, branch_id, Salary, address, city, country_id, contact_name, 
            customer_segment_id, utility_type_id, postal_code, state  )) 
      conn.commit()
      id = id + 1 




def filling_subparties(conn):
   table_name = 'parties'
   df_parties = read_sql_query(f"""SELECT id, company_or_person, name, birth_date, location_id, first_name, last_name, department_id,  
            email, phone_number, hire_date, branch_id, Salary, address, city, country_id, contact_name, 
            customer_segment_id, utility_type_id, postal_code, state
                  FROM {table_name}""", conn)
   
   df_companies = read_sql_query(f"""SELECT id, company_or_person, name, birth_date, location_id, first_name, last_name, department_id,  
            email, phone_number, hire_date, branch_id, Salary, address, city, country_id, contact_name, 
            customer_segment_id, utility_type_id
                  FROM {table_name} WHERE company_or_person='C'""", conn)

   df_persons = read_sql_query(f"""SELECT id, company_or_person, name, birth_date, location_id, first_name, last_name, department_id,  
            email, phone_number, hire_date, branch_id, Salary, address, city, country_id, contact_name, 
            customer_segment_id, utility_type_id
            FROM {table_name} WHERE company_or_person='P'""", conn)


   cursor = conn.cursor()
   ids = {}
   ids['parties'] = df_parties['id'].to_list()
   ids['companies'] = df_companies['id'].to_list()
   ids['persons'] = df_persons['id'].to_list()

   for tab in parties_types:   
      
      source_name = parties_types[tab]['source']      
      partytype_id = parties_types[tab]['typeparty_id']
      ll = ids[source_name]
      size = int( len( ll ) * parties_types[tab]['%'] ) 
      print('inserting rows in ', tab, 'size ', size)      
      ii = 0
      sampled_perms = []
      while ii < size:
         index = random.randint(0, len( ll )-1 )  
         if not ll[index] in sampled_perms:
            sampled_perms.append( int(ll[index]) )
         ii = ii + 1

      for ii in range(len(sampled_perms)):
         id = sampled_perms[ii]
         #id = ll[index] 
         row = df_parties.loc[df_parties['id']== id  ] 
         country = 'US'
         id, company_or_person, name, birth_date, location_id, first_name, last_name, \
         department_id, email, phone_number, hire_date, branch_id, Salary, address, city, \
         country_id, contact_name,  customer_segment_id, utility_type_id, postal_code, state =  row.iloc[0].values
         id = int(id)
         location_id = int(location_id)
         if utility_type_id is not None:
            utility_type_id = int( utility_type_id )

         if country_id is not None:   
            country_id = int(country_id)

         if department_id is not None:   
            department_id = int( department_id )

         cursor.execute(f"INSERT INTO parties_types (party_id, partytype_id) VALUES ({id}, {partytype_id});\n") 
         if tab == "employees":
            cursor.execute(f"""INSERT INTO {tab}(id, first_name, last_name, department_id, email, phone_number, 
                           hire_date, Salary) VALUES (?,?,?,?,?,?,?,?)""", 
                           (id, first_name, last_name, department_id, email, phone_number, hire_date, Salary))
         elif tab=="suppliers":
            cursor.execute(f"""INSERT INTO {tab}(id, name, address_line, city, state, country, postal_code, 
                           location_id, contact_name, contact_email,contact_phone) 
                           VALUES(?,?,?,?,?,?,?,?,?,?,?)""",
                            (id, name, address, city, state, country, postal_code, 
                           location_id, contact_name, email, phone_number) )

         elif tab=="customers":
            cursor.execute(f"""INSERT INTO {tab}(id, name, contact_name,  address, city, 
                           state, country, phone, email, location_id) 
                           VALUES(?,?,?,?,?,?,?,?,?,?);""", 
                           (id, name, contact_name,  address, city, 
                           state, country, phone_number, email, location_id)) 

         elif tab=="users":
            cursor.execute(f"""INSERT INTO {tab} (id, name) VALUES (?,?)""", (id, name)) 

         elif tab=="salespersons":
            cursor.execute(f"""INSERT INTO {tab}(id, first_name, last_name, email, phone, location_id) 
                           VALUES(?,?,?,?,?,?)""",
                            (id, first_name, last_name, email, phone_number, location_id) ) 

         elif tab=="landlord":
            cursor.execute(f"""INSERT INTO {tab}(id, name, contact_name, contact_email, contact_phone) 
                           VALUES(?,?,?,?,?)""",
                            (id, name, contact_name, email, phone_number) )

         elif tab == "vendors":
            cursor.execute(f"""INSERT INTO {tab}(id, name, contact_name, contact_email, contact_phone) 
                           VALUES(?,?,?,?,?)""",
                            id, name, contact_name, email, phone_number )

         elif tab == "taxauthorities":
             cursor.execute(f"""INSERT INTO {tab}(id, name, contact_name, contact_email, contact_phone) 
                            VALUES(?,?,?,?,?)""",
                             (id, name, contact_name, email, phone_number) )

         elif tab == "banks":
             cursor.execute(f"""INSERT INTO {tab}(id, name, contact_name, contact_email, contact_phone) 
                            VALUES(?,?,?,?,?)""",
                             (id, name, contact_name, email, phone_number) )

         elif tab == "service_providers":
             cursor.execute(f"""INSERT INTO {tab}(id, name, contact_name, contact_email, contact_phone, 
                            utility_type_id) VALUES(?,?,?,?,?,?)""",
                             (id, name, contact_name, email, phone_number, utility_type_id) )

         conn.commit()   





def filling_catalogue_items(conn):
    df_products = pd.read_csv('products.csv') 
    cursor = conn.cursor()
    table_name = 'catalogue_items'    
    print('loading catalogue_items')
    id = 1

    for _, row in df_products.iterrows():       
      category_id = getRandomProductCategory()
      name = row.Product     
      name = name.replace("'","''")       
      description = fake.sentence()
      cost = round(random.uniform(1, 500), 2)
      code = str(id).zfill(5)            
      supplier_id = getRandomSupplier()
      unitmeasure_id = getRandomUnitMeasure()
      selling_price = round(cost * random.uniform(1.1, 1.5), 2)  # Selling price 10-50% higher than cost

      cursor.execute(f"""INSERT INTO catalogue_items (id, code, name, product_service, description) 
      VALUES(?,?,?,?,?)
      """, (id, code, name, 'P', description) )

      cursor.execute(f"""INSERT INTO products (id, code, name, supplier_id, selling_price, unitmeasure_id, cost, quantity_in_stock, reorder_level, category_id) 
      VALUES(?,?,?,?,?,?,0,0,0,?)
      """, (id, code, name, supplier_id, selling_price, unitmeasure_id, category_id) )

      id = id + 1 
      conn.commit()


    df_services = pd.read_csv('services.csv')     
    print('loading services')
    n = 1
    for _, row in df_services.iterrows():
      name = row['name']               
      name = name.replace("'","''")       
      description = row['description']
      code = 'V' + str(n).zfill(5)          
      n =n  + 1
      vendor_id = getRandomVendor()
      price_hour = round(cost * random.uniform(1.1, 1.5), 2)  # Selling price 10-50% higher than cost

      cursor.execute(f"""INSERT INTO catalogue_items (id, code, name, product_service, description) 
      VALUES(?,?,?,?,? )
      """, (id, code, name, 'S', description) )

      cursor.execute(f"""INSERT INTO services (id, code, name, vendor_id, price_hour) 
      VALUES(?,?,?,?,? )
      """, (id, code, name, vendor_id, price_hour) )

      id = id + 1 
      conn.commit()
