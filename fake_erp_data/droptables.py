import pyodbc
from utildb import getconn

# Establish a connection to the database
conn = getconn()

# Function to perform DFS and topological sorting
def dfs_topological_sort(table_name, visited, stack):
    if table_name in visited:
        return
    
    visited.add(table_name)
    for child_table in get_child_tables(table_name):
        dfs_topological_sort(child_table, visited, stack)
    
    stack.append(table_name)

# Function to get child tables for a given parent table
def get_child_tables(parent_table):
    cursor = conn.cursor()
    cursor.execute(f"SELECT OBJECT_NAME(referenced_object_id) FROM sys.foreign_keys WHERE OBJECT_NAME(parent_object_id) = '{parent_table}'")
    child_tables = [row[0] for row in cursor]
    cursor.close()
    return child_tables

# Function to perform topological sorting of tables
def topological_sort_tables():
    all_tables = set()
    cursor = conn.cursor()
    cursor.execute("SELECT OBJECT_NAME(object_id) FROM sys.tables")
    for row in cursor:
        all_tables.add(row[0])
    cursor.close()
    
    visited = set()
    stack = []
    for table_name in all_tables:
        dfs_topological_sort(table_name, visited, stack)
    
    return stack[::-1]

# Perform topological sorting and print the result
sorted_tables = topological_sort_tables()
for table_name in sorted_tables:
    print(table_name)

# Close the connection
conn.close()
