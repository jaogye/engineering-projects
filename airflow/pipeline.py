from airflow.decorators import task, dag
import pandas as pd
import zipfile
import json
import sqlite3
import requests
from datetime import datetime, timedelta
import pendulum
import os

"""
This program runs a pipeline that reads ndjson files from a Google Drive folder  of air quality data on cities 
and computes hourly  and rolling averages of these data  and stores them in SQLite database which is created 
in the current working directory.

To run standalone, install the above python modules and run in an empty folder
To run in Airflow scheduler, uncomment the airflow decorators at the end of this file and copy in the  folder of dags 
"""

# Global variables 
#=========================================================================================================
# Define the URL to the Google Drive zip file
main_folder = os.getcwd() 
ndjson_folder = 'input-datasets'
input_folder = main_folder + "/input-datasets"
zip_file_path = main_folder + "/input-datasets.zip" 
db_file = os.getcwd() + "/airquality.db"

pm25_AQI = {
    "category": [
        "Good",
        "Moderate",
        "Unhealthy for Sensitive Groups",
        "Unhealthy",
        "Very Unhealthy",
        "Hazardous",
        "Hazardous",
        "Hazardous",        
    ],
    "AQI_low":    [0.0  , 51.0  , 101.0 , 151.0 , 201.0 , 301.0 , 401.0 , 501.0],
    "AQI_high":   [50.0 , 100.0 , 150.0 , 200.0 , 300.0 , 400.0 , 500.0 , 999.0],
    "break_low":  [0.0  , 12.1  , 35.5  , 55.5  , 150.5 , 250.5 , 350.5 , 500.5 ],
    "break_high": [12.0 , 35.4  , 55.5  , 150.5 , 250.4 , 350.4 , 500.4 , 99999.9   ],    
}
dfpm25 = pd.DataFrame(pm25_AQI)

pm10_AQI = {
    "category": [
        "Good",
        "Moderate",
        "Unhealthy for Sensitive Groups",
        "Unhealthy",
        "Very Unhealthy",
        "Hazardous",
        "Hazardous",
        "Hazardous",        
    ],   
    "AQI_low":    [0.0  , 51.0  , 101.0 , 151.0 , 201.0 , 301.0 , 401.0  , 501.0],
    "AQI_high":   [50.0 , 100.0 , 150.0 , 200.0 , 300.0 , 400.0 , 500.0  , 999.0],
    "break_low":  [0.0  , 55.0  , 155.0 , 255.0 , 355.0 , 425.0 , 505.0  , 604.0 ],
    "break_high": [54.0 , 154.0 , 254.0 , 354.0 , 424.0 , 504.0 , 604.0  , 99999.9   ],    
}
dfpm10 = pd.DataFrame(pm10_AQI)
AQI = {}
AQI['pm25'] = dfpm25
AQI['pm10'] = dfpm10


# Supporting functions 
# =====================================================================================================

#This function computes the AQ Index
def get_AQI( parameter, value):
    d = -1 
    for index, row in AQI[parameter].iterrows():
        if row['break_low'] <= value and  value <= row['break_high']:
           d = (row['AQI_high'] - row['AQI_low'] )*(value - row['break_low'])/(row['break_high'] - row['break_low']) + row['AQI_low']
           return d
    if d == -1 :
       raise Exception("Interval not found")     
    return d 

def get_dfAQI(parameter, data):
    df = pd.DataFrame()
    
    df['datehour'] = data[parameter]['datehour']
    df['value'] = 0 
    for index, row in data[parameter].iterrows():
         data[parameter].loc[index , 1] = get_AQI(parameter, row['value24'] )
    return df 


def set_rollingAverage(df):
    iniWindow, endWindow, accValue, cnt = 0, 0, 0,0
    while endWindow < len(df):
       # Computation of rolliwng averages
       date = df['datehour'][endWindow] + ":00" 
       date0 = ( datetime.fromisoformat(date) - timedelta(days=1) ).isoformat()[0:13]
       while df['datehour'][iniWindow] <= date0 and iniWindow < len(df):
            accValue = accValue - df['value'][iniWindow]
            cnt = cnt - 1 
            iniWindow = iniWindow  + 1    
       
       accValue = accValue + df['value'][endWindow]
       cnt = cnt + 1 
       df['value24'] = accValue / cnt
       endWindow = endWindow + 1 



# Function to insert data into the database
def insert_data(cursor, country, city, date, parameter, value):
        
    cursor.execute(f'''
        INSERT INTO obs_air(country, city, date , parameter , value)
        VALUES (?, ?, ?,?,?)
    ''', (country, city, date, parameter, value))
    

# Function to insert data into the "indicators" table
def insert_indicators(cursor, country, city, data, AQIdfpm25, AQIdfpm10):

    for parameter in data: 
       for index, row in data[parameter].iterrows():
           datehour = row['datehour']
           value = row['value']
           value24 = row['value24']
           select_sql = """
           SELECT id, country, city, datehour
           FROM indicators WHERE country=? and city=? and datehour=?
           """
           tt = cursor.execute(select_sql, (country, city, datehour))
           dd = tt.fetchall() 
           if len(dd) == 0:           
             if parameter != 'pm10' and parameter != 'pm25' : 
                insert_query = "INSERT INTO indicators (country, city, datehour,  h_"+parameter+", h24_"+parameter+ ") VALUES (?,?,?, ?, ?);"  
                cursor.execute(insert_query, (country, city, datehour, value, value24))

             if parameter == 'pm10' : 
                insert_query = "INSERT INTO indicators (country, city, datehour,  h_pm10, h24_pm10, AQI_pm10 )  VALUES (?,?,?, ?,?,?);" 
                cursor.execute(insert_query, (country, city, datehour, value, value24, AQIdfpm10['value'][index]  )  )

             if parameter == 'pm25' : 
                insert_query = "INSERT INTO indicators (country, city, datehour,  h_pm25, h24_pm25, AQI_pm25 )  VALUES (?,?,?, ?, ?, ?);" 
                cursor.execute(insert_query, (country, city, datehour, value, value24, AQIdfpm25['value'][index]  )  )

           else: 
              id, country, city, datehour = dd[0]
              if parameter != 'pm10' and parameter != 'pm25' : 
                 update_query = "UPDATE indicators set h_"+parameter+"=? , h24_"+parameter+"=?  WHERE id = ?;"
                 cursor.execute(update_query, (value, value24, id )  )

              if parameter == 'pm10' : 
                 update_query = "UPDATE indicators set h_pm10=?, h24_pm10=?, AQI_pm10=?  WHERE id = ?;"
                 cursor.execute(update_query, (value, value24, AQIdfpm10['value'][index], id )  )

              if parameter == 'pm25' : 
                 update_query = "UPDATE indicators set h_pm25=?, h24_pm25=?, AQI_pm25=?  WHERE id = ?;"
                 cursor.execute(update_query, (value, value24, AQIdfpm25['value'][index], id )  )

def createdb():
   # Define the database file name
   db_file = "airquality.db"

   # Create a connection to the database (or create it if it doesn't exist)
   conn = sqlite3.connect(db_file)

   # Create a cursor object to execute SQL commands
   cursor = conn.cursor()

   # Define the SQL command to create the "indicators" table
   create_table_query = """
   CREATE TABLE IF NOT EXISTS indicators (
   id INTEGER PRIMARY KEY AUTOINCREMENT, 
   country char(2) ,
    city CHAR(40),
    datehour CHAR(13),
    h_pm25 DECIMAL(12, 4),
    h_pm10 DECIMAL(12, 4), 
    h_O3 DECIMAL(12, 4),
    h_NO2 DECIMAL(12, 4),
    h_CO DECIMAL(12, 4),        
    h24_pm25 DECIMAL(12, 4),
    h24_pm10 DECIMAL(12, 4), 
    h24_O3 DECIMAL(12, 4),
    h24_NO2 DECIMAL(12, 4),
    h24_CO DECIMAL(12, 4),        
    AQI_pm25 DECIMAL(12, 4),
    AQI_pm10 DECIMAL(12, 4)
   );
    """

   # Execute the SQL command to create the table
   cursor.execute(create_table_query)
   create_index = " create index idx_indicators on indicators(country, city, datehour) ;"
   # Execute the SQL command to create the table

   try:
      cursor.execute(create_index)
   except :
       print("")

   # Define the SQL command to create the "indicators" table
   create_table_query = """
   CREATE TABLE IF NOT EXISTS  obs_air (
   country char(2) ,
    city CHAR(40),
    date CHAR(30),
    parameter  CHAR(10),
    value DECIMAL(12, 4)
   );
   """
  # Execute the SQL command to create the table
   cursor.execute(create_table_query)

   # Commit the changes and close the database connection
   conn.commit()
   conn.close()

   print("create_db | Database 'airquality' with tables 'indicators' and 'obs_air' created successfully.")

# This function read the zip file from google drive and unzip in a local folder   
def extractfiles():

     try:
        os.mkdir(ndjson_folder)  
     except :
       print("")
     
     print("extract_files | Extracting files from https://drive.google.com/file/d/1bH6BM7hrVI9ufuJ5GVGE7QPEwIJAM1xX/view?usp=sharing")
     file_id = "1bH6BM7hrVI9ufuJ5GVGE7QPEwIJAM1xX"
     file_url = f"https://drive.google.com/uc?id={file_id}"

     # Download the zip file
     response = requests.get(file_url)
     # Save the downloaded zip file
     with open(zip_file_path, "wb") as zip_file:
        zip_file.write(response.content)

     # Unzip the file and save its contents to the extraction folder
     with zipfile.ZipFile(zip_file_path, "r") as zip_ref:
         zip_ref.extractall(main_folder)

     # Clean up: Remove the downloaded zip file
     os.remove(zip_file_path)

 # This function read the JSON files from the input directory
# This function get data from the ndjson files and store in the  table  obs_air sorted by date 
def getdata(): 
    conn = sqlite3.connect(db_file)
    countries = pd.read_csv(input_folder + '/countries.csv')
    countries_list = list( countries.country_code  )  
  
    parameter_list = ['pm10', 'pm25', 'o3', 'no2', 'co']
    cursor1 = conn.cursor()
    cursor1.execute("DELETE FROM obs_air;" )
    # Iterate through NDJSON files in the input folder
    for filename in os.listdir(input_folder):
       if filename.endswith(".ndjson"):
          file_path = os.path.join(input_folder, filename)
          print("get data | File:" + file_path)
          with open(file_path, "r", encoding="utf-8") as ndjson_file:
              # Read each line as a JSON object
              for line in ndjson_file:
                  json_data = json.loads(line)
                  country = json_data["country"]
                  if country in countries_list:
                     city = json_data["city"]
                     date = json_data["date"]["local"]
                     parameter = json_data["parameter"] 
                     value = json_data["value"] 
                     if value > 0 and parameter in parameter_list:
                        # Insert data into the "indicators" table
                        insert_data(cursor1, country,city, date, parameter, value)
                        conn.commit()
    
    conn.commit()
    conn.close()
    print("Data from NDJSON files inserted into the 'obs_air' table.")


def processdata():     
    # Connect to the SQLite database
    conn = sqlite3.connect(db_file)  
    cursor = conn.cursor()
    cursor1 = conn.cursor()

     # Execute the SQL query to select all rows from the table
    cursor.execute("SELECT country, city, parameter, date, value FROM obs_air ORDER BY country, city, parameter, date;")

     # Fetch one row at a time and process it
    row = cursor.fetchone() 
    while True:      
       if row is None:
          break  # No more rows to fetch, exit the loop
    
       country = row[0] ;  city = row[1] 
       # You can perform any action you want with the values here
       print(f"process_data | Country: {country}, City: {city}")
       data = {}
       while not row is None and country == row[0] and  city == row[1] : 
           parameter = row[2]
           c1, c2 =  [] ,[] 
           while not row is None and country == row[0] and  city == row[1] and parameter == row[2] : 
               datehour = row[3][0:13]
               n_value =0 ;  t_value = 0
               c1.append( datehour )
               while not row is None and country == row[0] and  city == row[1] and parameter == row[2] and datehour == row[3][0:13] : 
                   n_value = n_value + 1 
                   t_value = t_value + row[4]
                   row = cursor.fetchone() 
               
               c2.append( t_value / n_value )

           df = pd.DataFrame()
           df['datehour'] = c1  ; df['value'] = c2 
           data[parameter] = df
 
       # Computation of rolling averages 
       for parameter in data:
           set_rollingAverage(data[parameter]) 
 
       # Computation of pm25 and pm10
       if 'pm25' in data:
         dfAQIpm25 = get_dfAQI('pm25', data)

       if 'pm10' in data:
          dfAQIpm10 = get_dfAQI('pm10', data)

       insert_indicators(cursor1, country, city, data, dfAQIpm25, dfAQIpm10)

    # Close the database connection
    conn.commit()
    conn.close()

# Dag defintions 
# ===========================================================================================================================
"""""
@dag(
    schedule=None,
    start_date=pendulum.datetime(2023, 1, 1, tz="UTC"),
    catchup=False,
    tags=["example"],
    schedule_interval=None,  # Set the schedule interval as needed
)
"""""

def air_quality_api():
  # @task
  def create_db():
     createdb() 
  
  # @task
  def extract_files():
     extractfiles()

  # @task  
  def get_data(): 
      getdata()

  #@task  
  def process_data():     
    processdata()

  create_db() 
  extract_files()
  get_data()
  process_data()

air_quality_api()