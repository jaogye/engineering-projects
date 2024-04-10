from utildb import getconn

# Establish a connection to the database
conn = getconn()

# Function to print foreign key relations
def print_foreign_key_relations():
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
           file.write(f"Foreign Key: {row.parent_table}.{row.parent_column} -> {row.referenced_table}.{row.referenced_column}")

# Call the function to print foreign key relations
print_foreign_key_relations()

# Close the connection
conn.close()
