import pandas as pd
import json
from sqlalchemy import create_engine
from sqlalchemy import select, literal_column, text, bindparam
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
import pymssql
import math

def getBase():    
    engine = getEngine()
    base = automap_base()
    base.prepare(autoload_with=engine)
    return base, engine

def getEngine():
    # Path to the file of keys
    file_path = "c:/data_vault/tttt.json"
    # Read JSON file into dictionary
    with open(file_path, "r") as json_file:
        keys = json.load(json_file)

    server = keys["lims_db"]["server"]
    database = keys["lims_db"]["database"]
    user = keys["lims_db"]["user"]
    password = keys["lims_db"]["password"]
    # Connection string to SQL SERVER
    conn_str = f"mssql+pymssql://{user}:{password}@{server}:1433/{database}"
    conn_str = f"mssql+pyodbc://{user}:{password}@{server}/{database}?driver=ODBC+Driver+17+for+SQL+Server"    
    # Create SQLAlchemy engine
    conn = create_engine(conn_str)        
    return conn

def getconn():
    # Path to the file of keys
    file_path = "c:/data_vault/tttt.json"
    # Read JSON file into dictionary
    with open(file_path, "r") as json_file:
        keys = json.load(json_file)

    server = keys["lims_db"]["server"]
    database = keys["lims_db"]["database"]
    user = keys["lims_db"]["user"]
    password = keys["lims_db"]["password"]
    conn = pymssql.connect(server, user, password, database)
    return conn


# This function extracts the variable columns corresponding of input excel sheets  
def varColumns(db):
    #cursor = conn.cursor()       
    #cursor.execute()
    #vars = pd.DataFrame(cursor.fetchall(), columns=['name', 'typevar'])
    sql = text("SELECT shortname AS name, typevar FROM test ORDER BY ord")
    vars = pd.read_sql(sql, db[1])
    colvars = list(vars.name)
    return colvars          

# This function extracts the column's name of input excel sheets  
def getColumns(db, table):
    switcher = {
        'customerlist': ["Action", "Customer", "Product", "Quality", "Status",
                     "Certificaat", "Opm", "COA", "Day_COA", "COC", "Visual", "OneDecimal"],
        'spec': ["Action", "TDS", "Product", "Quality", "Visual", "Variable1", "Variable2", "Variable3"],
        'samplematrix': ["Action", "Product", "Quality", "SamplePoint", "Frequency", "Visual"],
        'product': ["Action", "Name", "Bruto", "Name_coa", "id"],
        'quality': ["Action", "Name", "LongName", "id"],
        'map': ["Action", "ArticleCode", "Product", "LogisticInfo", "Quality", "id"],
        'holidays': ["Action", "Date", "Description"],
        'test': ["Action", "Shortname", "Test", "Element", "Unit", "Ord", "TypeVar", "listvalue", "id"]
    }    
    labels = switcher.get(table, [])
    cols = [] 
    if table == 'spec':
        cols = ["' ' Action", "s.TDS", "p.name Product", "q.name Quality", "s.Visual",
                     "v1.shortname Variable1", "v2.shortname Variable2", "v3.shortname Variable3"]        
    elif table == 'customerlist':
        cols = ["' ' Action", "s.Customer", "p.name Product", "q.name Quality", "s.Status",
                     "s.Certificaat", "s.Opm", "s.COA", "s.Day_COA", "s.COC", "s.Visual", "s.OneDecimal"]                
    elif table == 'samplematrix':
        cols = ["' ' Action", "p.name Product", "q.name Quality", "sp.name SamplePoint",
                     "s.Frequency", "iif(s.has_visual=1, 'X', ' ')  Visual"]
    len_inicols = len(cols)
    colvars = []    
    if table in ['spec', 'customerlist', 'samplematrix']:
        colvars = varColumns(db)
        if table == 'samplematrix':
            for i in range(len(colvars)):
                colvars[i] = 'has_' + colvars[i]
        else: 
            for i in range(len(colvars)):
                colvars[i] = 'interval_' + colvars[i]

    cols.extend(colvars)
    cols.append("s.id")    
    if len(colvars) > 1 :
       labels.extend(colvars)
       labels.append("id")
    return cols, labels, len_inicols





# Define the function to check foreign key constraint
def checkFK0(db, query, parameters):
    #cursor = conn.cursor()
    #cursor.execute(query, params = args)
    #T = pd.DataFrame(cursor.fetchone(), columns=['id'] )    
    # Execute SQL query and load data into DataFrame    
    T = pd.read_sql(text(query), db[1], params= parameters)
    if len(T)>0:
        return int(T.id[0])
    else:
        return 0

# Define the function to check foreign key constraint
def checkFK(db, query, **kwargs):
    #cursor = conn.cursor()
    #cursor.execute(query, params = args)
    #T = pd.DataFrame(cursor.fetchone(), columns=['id'] )    
    # Execute SQL query and load data into DataFrame
    #print('kwargs ', kwargs)
    T = pd.read_sql(text(query), db[1], params= kwargs)
    if len(T)>0:
        return int(T.id[0])
    else:
        return 0

# This function checks if a table.column exists in the database 
def existsColumn(db, table, column):    
    ok = False
    sql = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = :table AND COLUMN_NAME = :column"        
    # Execute SQL query and load data into DataFrame
    T = pd.read_sql( text(sql), db[1], table=table, column=column ) 
    if len(T) > 0:
        ok = True
    return ok

# Define the function to check if a value is in a list of valid values
def checkValueList(value, valid_values):
    return value in valid_values


# This function validates if a row a table has dependencies (children)
def checkChildren(db, table, id):
    msgerror = []
    id = str(id)
    switcher = {
        'product': [
            ("SELECT id FROM sample WHERE product_id = :id", "Sample"),
            ("SELECT id FROM spec WHERE typespec = 'GEN' AND product_id = :id", "Spec"),
            ("SELECT id FROM spec WHERE typespec = 'CLI' AND product_id = :id", "ClientList"),
            ("SELECT id FROM samplematrix WHERE product_id = :id", "SampleMatrix"),
            ("SELECT id FROM Map WHERE product_id = :id", "Map")
        ],
        'samplepoint': [
            ("SELECT id FROM sample WHERE samplepoint_id = :id", "Sample"),
            ("SELECT id FROM samplematrix WHERE samplepoint_id = :id", "SampleMatrix")
        ],
        'quality': [
            ("SELECT id FROM sample WHERE quality_id = :id", "Sample"),
            ("SELECT id FROM spec WHERE typespec = 'GEN' AND quality_id = :id", "Spec"),
            ("SELECT id FROM spec WHERE typespec = 'CLI' AND quality_id = :id", "ClientList"),
            ("SELECT id FROM samplematrix WHERE quality_id = :id", "SampleMatrix"),
            ("SELECT id FROM Map WHERE quality_id = :id", "Map")
        ],
        'samplematrix': [
            ("SELECT id FROM sample WHERE samplematrix_id = :id", "Sample")
        ],
        'spec': [
            ("SELECT product_id FROM sample WHERE spec_id = :id", "Sample"),
            ("SELECT product_id FROM samplematrix WHERE spec_id = :id", "SampleMatrix"),
        ],
        'customerlist': [
            ("SELECT product_id FROM sample WHERE spec_id = :id", "Sample"),
            ("SELECT product_id FROM samplematrix WHERE spec_id = :id", "SampleMatrix"),
        ],        
        'Variable': [
            ("SELECT variable_id id FROM dspec WHERE variable_id = :id", "dSpec"),
            ("SELECT id FROM listvalue WHERE variable_id = :id", "listvalue")
        ],
        'listvalue': [
            ("SELECT id FROM measurement WHERE listvalue_id = :id", "measurement")
        ]
    }

    queries = switcher.get(table, [])
    for query, dependent_table in queries:
        result = checkFK(db, query, id=id)
        if result > 0:
            msgerror.append(f"Action D. The id={id} of table {table} has dependencies in table {dependent_table}.")
            return msgerror

    return msgerror


def isNull(value):
    if value is None:
       return True
    # Check if the value is exactly an empty string
    if isinstance(value, str) and value.strip() == "":
        return True
    # Check if the value is a number and is NaN
    elif isinstance(value, (int, float)) and math.isnan(float(value)):
        return True
    # In all other cases, return False
    return False