from faker import Faker
import json
from supabase import create_client, Client
import logging

logging.getLogger("httpx").setLevel(logging.WARNING)

fake = Faker()

file_path = "c:/data_vault/secrets.json"
# Read JSON file into dictionary
with open(file_path, "r") as json_file:
        keys = json.load(json_file)
url = keys["auditorai"]["SUPABASE_URL"]
key = keys["auditorai"]["SUPABASE_KEY"]
supabase: Client = create_client(url, key)
response = supabase.table('location').select("id, city, state, postal_code, countries(name)").execute()
data = response.data

types_persons = [['users', 'employees'], ['users'], ['users','salespersons'], 
                 ['users'], ['employees'],['salespersons'], ['suppliers'],['customers'],['landlord'],['service_provider'],
                 ['suppliers'],['customers'],['landlord'],['suppliers'],['customers'],['customers'],['customers'],['customers'],['customers'],
                 ['customers'],['customers'],['customers'],['customers'],['customers'],
                 ['suppliers', 'landlord'], ['suppliers','service_provider']     ]

types_companies = [ ['suppliers'],['customers'],['landlord'],
                 ['suppliers'],['customers'],['landlord'],['suppliers'],['customers'],['landlord'],['service_provider'],
                 ['suppliers', 'landlord'], ['suppliers','service_provider']      ]


parties_types = {}
parties_types['users'] = 1
parties_types['employees'] = 2
parties_types['suppliers'] = 3
parties_types['customers'] = 4
parties_types['salespersons'] = 5
parties_types['landlord'] = 6
parties_types['service_provider'] =7


def generate_company_names(count_persons=2000, count_companies=1000):
    id = 1
    with open('parties_inserts.sql', 'w') as file:
        for i in range(count_companies+count_persons): 
            if i% 100 == 0:
               print('i ', i)
            ii = fake.random_int(min=1, max=len(data)-1)
            row = data[ii]
            location_id = row['id']                   
            country = row['countries']['name']
            city = row['city']
            postal_code = row['postal_code']  
            state = row['state']
            state = state.replace("'","''")
            department_id = fake.random_int(min=1, max=20)
            address = fake.address()
            address = address.replace("'","''")     
            phone = fake.phone_number() 
            company_name = fake.company()
            contact_name = fake.name()
            contact_email = fake.ascii_email()
            contact_phone = fake.phone_number() 
            phone_number = fake.phone_number() 
            hire_date = fake.date_of_birth(minimum_age=1, maximum_age=9).isoformat()
            birth_date = fake.date_of_birth(minimum_age=18, maximum_age=90).isoformat()
            Salary = fake.random_int(min=1500, max=4000)            
            utility_type_id = fake.random_int(min=1, max=15)
            if i < count_companies:
               email = fake.ascii_company_email()
               name = company_name
               file.write(f"INSERT INTO parties (id, company_or_person, name, birth_date, location_id) VALUES ({id}, 'C', '{name}', NULL, {location_id});\n")               
               ii = fake.random_int(min=0, max=len(types_companies)-1)
               combination = types_companies[ii]
            else:
               email = fake.ascii_email()
               last_name = fake.last_name()
               first_name = fake.first_name()
               name = first_name.strip() + ' ' + last_name.strip()               
               file.write(f"INSERT INTO parties (id, company_or_person, name, birth_date, location_id) VALUES ({id}, 'P', '{name}', '{birth_date}', {location_id});\n")  
               ii = fake.random_int(min=0, max=len(types_companies)-1)
               combination = types_persons[ii]

            for tab in combination:
                #print(combination, ' ,  ',tab)
                if len(combination) > 1:
                   tt = 0

                partytype_id = parties_types[tab]
                file.write(f"INSERT INTO parties_types (party_id, partytype_id) VALUES ({id}, {partytype_id});\n") 
                if tab == "employees":
                   file.write(f"INSERT INTO employees(id, first_name, last_name, department_id, email, phone_number, hire_date, Salary) VALUES ({id}, '{first_name}', '{last_name}', {department_id}, '{email}', '{phone_number}', '{hire_date}', {Salary});\n")
                elif tab=="suppliers":
                   file.write(f"INSERT INTO suppliers(id, name, address_line, city, state, country, postal_code, location_id, contact_name, contact_email,contact_phone) VALUES({id}, '{name}', '{address}', '{city}','{state}' ,'{country}', '{postal_code}', '{location_id}', '{contact_name}', '{contact_email}','{contact_phone}');\n") 
                elif tab=="customers":
                   file.write(f"INSERT INTO customers(id, company_name, contact_name, contact_title, address, city, state, country, phone, email, location_id) VALUES({id}, '{company_name}', '{contact_name}', 'Supervisor', '{address}', '{city}', '{state}' ,'{country}', '{phone}', '{email}', {location_id});\n") 
                elif tab=="users":
                   file.write(f"INSERT INTO users (id, name) VALUES ({id}, '{name}');") 
                elif tab=="salespersons":              
                   file.write(f"INSERT INTO salespersons(id, first_name, last_name, email, phone, location_id) VALUES({id}, '{first_name}', '{last_name}', '{email}', '{phone}', {location_id});\n" ) 
                elif tab=="landlord":    
                   file.write(f"INSERT INTO landlord(id, name, contact_name, contact_email, contact_phone) VALUES({id}, '{name}', '{contact_name}', '{contact_email}', '{contact_phone}');\n" )
                else:
                   file.write(f"INSERT INTO service_provider(id, name, contact_name, contact_email, contact_phone, utility_type_id) VALUES({id}, '{name}', '{contact_name}', '{contact_email}', '{contact_phone}',{utility_type_id});\n" )     
            id = id + 1 
            file.write("\n")
generate_company_names(2000, 1000)

print("SQL insert statements generated successfully and saved to parties.sql")
