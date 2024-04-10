import json 
import os
import json
from dotenv import load_dotenv
from supabase import create_client, Client
from faker import Faker
import faker_commerce

# Path to the file of keys
file_path = "c:/data_vault/secrets.json"

def add_entries_to_vendor_table(supabase, vendor_count):
    fake = Faker()
    foreign_key_list = []
    fake.add_provider(faker_commerce.Provider)
    main_list = []
    id = 0
    for i in range(vendor_count):
        value = {'vendor_id':id, 'vendor_name': fake.company(), 'total_employees': fake.random_int(40, 169),
                 'vendor_location': fake.country()}
        #data, count = supabase.table('vendor').insert(value).execute()     
        main_list.append(value)
        id = id + 1 
    #print(main_list)    
    data = supabase.table('vendor').insert(main_list).execute()

    #response = supabase.table('vendor').select("*").execute()
    #data = response.data
    
    data_json = json.loads(data.json())
    data_entries = data_json['data']
    for i in range(len(data_entries)):
        foreign_key_list.append(int(data_entries[i]['vendor_id']))
    return foreign_key_list


def add_entries_to_product_table(supabase, vendor_id):
    fake = Faker()
    fake.add_provider(faker_commerce.Provider)
    main_list = []
    iterator = fake.random_int(1, 15)
    for i in range(iterator):
        value = {'vendor_id': vendor_id, 'product_name': fake.ecommerce_name(),
                 'inventory_count': fake.random_int(1, 100), 'price': fake.random_int(45, 100)}
        main_list.append(value)
    data = supabase.table('product').insert(main_list).execute()


def main():
    vendor_count = 10
    load_dotenv()
    
    # Read JSON file into dictionary
    with open(file_path, "r") as json_file:
        keys = json.load(json_file)
    url = keys["auditorai"]["SUPABASE_URL"]
    key = keys["auditorai"]["SUPABASE_KEY"]

    supabase: Client = create_client(url, key)
    fk_list = add_entries_to_vendor_table(supabase, vendor_count)
    for i in range(len(fk_list)):
        add_entries_to_product_table(supabase, fk_list[i])


main()


