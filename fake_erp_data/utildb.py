import pandas as pd
import json
import pyodbc
from sqlalchemy import create_engine
from topological_sort import Graph
from create_table_strings import str_create_table

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


def read_sql_query(sql2, conn):
    sql = sql2.upper()
    columns = []
    collist = sql2[sql.find("SELECT")+6:sql.find("FROM")].split(',') 
    for col in collist:
        col = col.strip()
        ll1 = col.split(' ')
        if len(ll1) == 1:
            ll2 = col.split('.')
            if len(ll2) == 1:
               columns.append(ll2[0].strip())
            else:       
               columns.append(ll2[1].strip()) 
        else:        
            columns.append(ll1[1].strip()) 
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
       cursor.execute("SELECT max(id) FROM " + table)
       nn = cursor.fetchone()[0]
       if nn is None:
          nn = 0 
       cursor.execute("INSERT INTO counters(table_name, count_number) VALUES(?,?)", (table,nn+1))
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



def check_table_exists(db_conn, table_name):
    """
    Check if a table exists in the SQL Server database.
    
    Args:
    - db_conn: A pyodbc connection object to the database.
    - table_name: The name of the table to check for.
    
    Returns:
    - True if the table exists, False otherwise.
    """
    cursor = db_conn.cursor()
    cursor.execute("""
        SELECT COUNT(*)
        FROM information_schema.tables
        WHERE lower(table_name) = ?
    """, (table_name.lower(),))
    if cursor.fetchone()[0] == 1:
        return True
    return False


def getTableNames(conn):
    cursor = conn.cursor()
    cursor.execute(""" SELECT table_name FROM information_schema.tables""")
    data = cursor.fetchall()
    ll = []
    for cc in data:
        ll.append(cc[0])
    return ll 


# Function to print foreign key relations
def print_foreign_key_relations(conn):
    cursor = conn.cursor()
    cursor.execute("""
        SELECT
            OBJECT_NAME(f.parent_object_id) AS parent_table,
            c1.name AS parent_column,
            OBJECT_NAME(f.referenced_object_id) AS referenced_table,
            c2.name AS referenced_column
        FROM 
            sys.foreign_keys AS f
        INNER JOIN 
            sys.foreign_key_columns AS fc ON f.object_id = fc.constraint_object_id
        INNER JOIN 
            sys.columns AS c1 ON fc.parent_column_id = c1.column_id AND fc.parent_object_id = c1.object_id
        INNER JOIN 
            sys.columns AS c2 ON fc.referenced_column_id = c2.column_id AND fc.referenced_object_id = c2.object_id
    """)
    rows = cursor.fetchall()
    cursor.close()

    with open('Foreign_Keys.txt', 'w') as file: 
        for row in rows:
           file.write(f"Foreign Key: {row.parent_table}.{row.parent_column} -> {row.referenced_table}.{row.referenced_column}\n")



# Function to print foreign key relations
def tableTopologicalOrder(conn):
    cursor = conn.cursor()
    g = Graph( )
    cursor.execute("""
        SELECT
            OBJECT_NAME(f.parent_object_id) AS parent_table,
            c1.name AS parent_column,
            OBJECT_NAME(f.referenced_object_id) AS referenced_table,
            c2.name AS referenced_column
        FROM 
            sys.foreign_keys AS f
        INNER JOIN 
            sys.foreign_key_columns AS fc ON f.object_id = fc.constraint_object_id
        INNER JOIN 
            sys.columns AS c1 ON fc.parent_column_id = c1.column_id AND fc.parent_object_id = c1.object_id
        INNER JOIN 
            sys.columns AS c2 ON fc.referenced_column_id = c2.column_id AND fc.referenced_object_id = c2.object_id
    """)
    rows = cursor.fetchall()
    cursor.close()    
    for row in rows:
        g.addEdge(row.parent_table, row.referenced_table)
    return g.topologicalSort()




def create_table(conn, table_name):
    cursor = conn.cursor()
    if check_table_exists(conn, table_name):
      cursor.execute(f"drop table {table_name};")
      conn.commit()

    ss = str_create_table[table_name.lower()] 
    cursor.execute(ss)
    conn.commit()

