from sqlalchemy import select, literal_column, text, bindparam
from utildb import getconn, getBase, varColumns, checkFK
import pandas as pd
from tablesavers import saveProduct, saveQuality, saveHolidays, saveMap, saveSamplePoint, saveSampleMatrix, saveCustomerList, saveSpec, buildQuery,  getCustomerList

db = getBase()
#data = getCustomerList(db)
#data.to_excel(r'C:\Users\jaaxx\Documents\Python\LIMS\CustomerList.xlsx', index = False)

excel_file_path = 'CustomerList.xlsx'
# Load the Excel file into a DataFrame
data = pd.read_excel(excel_file_path)

newdata, msgerror, stat, pendingdata = saveCustomerList(db,data)
print(msgerror)

