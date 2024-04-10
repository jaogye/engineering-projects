from faker import Faker
import random
import pandas as pd
from supabase import create_client, Client
import logging
import json

logging.getLogger("httpx").setLevel(logging.WARNING)
fake = Faker()

create_product = """
CREATE TABLE product_services (
    id int PRIMARY KEY,
    code varchar(20) not null, 
    name VARCHAR(100) NOT NULL,
    product_service varchar(1),
    description TEXT,
    cost DECIMAL(15, 2) NOT NULL,
    supplier_id INTEGER,
    unitmeasure_id INTEGER,
    selling_price DECIMAL(10, 2),
    quantity_in_stock INT,
    ReorderLevel INTEGER NOT NULL,
    category_id INTEGER,
    FOREIGN KEY (unitmeasure_id) REFERENCES unit_measures(id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id),
    FOREIGN KEY (category_id) REFERENCES ProductCategories(id)
);

"""

df_products = pd.read_csv('Products.csv') 
file_path = "c:/data_vault/secrets.json"
# Read JSON file into dictionary
with open(file_path, "r") as json_file:
        keys = json.load(json_file)
        
url = keys["auditorai"]["SUPABASE_URL"]
key = keys["auditorai"]["SUPABASE_KEY"]
supabase: Client = create_client(url, key)

response = supabase.table('productcategories').select("id, name").execute()
data = response.data
df_categories = pd.DataFrame(data)
df_products['category_id'] = 0
ll = []
for i in range(len(df_products)):
    category_name = df_products['category_name'][i]
    row = df_categories.loc[df_categories.name == category_name] 
    category_id = row['id'][row.index[0]]
    ll.append( category_id )

df_products['category_id'] = ll

response = supabase.table('suppliers').select("id").execute()
df_suppliers = pd.DataFrame(response.data)

response = supabase.table('unit_measures').select("id").execute()
df_unit_measures = pd.DataFrame(response.data)


def write_products_to_file(filename='products_inserts.sql'):
    with open(filename, 'w') as file:
        id = 1
        file.write(create_product)     
        for _, row in df_products.iterrows():
            category_id = row['category_id']
            name = row['Product']     
            name = name.replace("'","''")       
            description = fake.sentence()
            cost = round(random.uniform(1, 500), 2)
            code = str(id).zfill(5)
            ii = random.randint(1, len(df_suppliers)-1)
            supplier_id = df_suppliers['id'][ii]
            ii = random.randint(1, len(df_unit_measures)-1)
            unitmeasure_id = df_unit_measures['id'][ii]
            selling_price = round(cost * random.uniform(1.1, 1.5), 2)  # Selling price 10-50% higher than cost
            quantity_in_stock = random.randint(0, 1000)
            reorder_level = random.randint(10, 100)            
            insert_statement = f"""INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES ({id},'{code}','{name}', 'P', '{description}', {cost}, {supplier_id}, {unitmeasure_id}, 
            {selling_price}, {quantity_in_stock}, {reorder_level}, {category_id});\n"""
            file.write(insert_statement)
            id = id + 1 

write_products_to_file()
print("Product insert statements have been generated and saved to products_inserts.sql.")

