import pandas as pd
import json
import pyodbc
from sqlalchemy import create_engine

def getconn():
    # Path to the file of keys
    file_path = "c:/data_vault/secrets.json"
    # Read JSON file into dictionary
    with open(file_path, "r") as json_file:
        keys = json.load(json_file)

    server = keys["erp"]["server"]
    database = keys["erp"]["database"]
    user = keys["erp"]["user"]
    password = keys["erp"]["password"]
    connection_string = "Driver={SQL Server};"
    connection_string = connection_string + f"""
    SERVER={server};
    DATABASE={database};
    UID={user};
    PWD={password};
    """    
    # Establish a connection
    conn = pyodbc.connect(connection_string)
    return conn


def getengine():
    # Path to the file of keys
    file_path = "c:/data_vault/secrets.json"
    # Read JSON file into dictionary
    with open(file_path, "r") as json_file:
        keys = json.load(json_file)

    server = keys["erp"]["server"]
    database = keys["erp"]["database"]
    user = keys["erp"]["user"]
    password = keys["erp"]["password"]
    driver = 'ODBC Driver 17 for SQL Server'
    connection_string = f"mssql+pyodbc://{user}:{password}@{server}/{database}?driver={driver}"
 
    # Crear el motor de conexión
    engine = create_engine(connection_string)
    return engine


def read_sql_query(sql, conn, columns):
    cursor = conn.cursor()
    cursor.execute(sql)
    df = pd.DataFrame(columns=columns)
    rows = cursor.fetchall()    
    for row in rows:
        d = {}
        for k in range(len(row)):
            d[columns[k]] = row[k]
        df.loc[len(df.index)] = d
    return df
        
def newid(conn, table):
    cursor = conn.cursor()
    cursor.execute("SELECT count_number FROM counters WHERE table_name=?", (table,))
    response = cursor.fetchone()
    if response is None:
       cursor.execute("INSERT INTO counters(table_name, count_number) VALUES(?,1)", (table,))
       id = 0
    else:
       id = response[0]    
       cursor.execute("UPDATE counters SET count_number=count_number+1 WHERE table_name=?", (table,))

    conn.commit() 
    return int(id) 


def newnumbertransaction(conn, transaction_type_id):
    cursor = conn.cursor()
    cursor.execute("SELECT count_number FROM transaction_types WHERE id=?", (transaction_type_id,))
    number = cursor.fetchone()[0]
    cursor.execute("UPDATE transaction_types set count_number=count_number+1 WHERE id=?", (transaction_type_id,))
    conn.commit()
    return number
