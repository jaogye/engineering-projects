from UtilDB import getconn, getBase, varColumns
import pandas as pd
from TableReaders import getSpec, getVariable, getProduct, getQuality, getSamplePoint, getSampleMatrix, getHolidays, getMap
from UtilSpec import getSampleMatrixVariables
db = getBase()

data = getSpec(db)
data.to_excel(r'C:\Users\jaaxx\Documents\Python\LIMS\test\CustomerList.xlsx', index = False)

data = getSpec(db, 'GEN')
data.to_excel(r'C:\Users\jaaxx\Documents\Python\LIMS\test\Spec.xlsx', index = False)

data = getVariable(db)
data.to_excel(r'C:\Users\jaaxx\Documents\Python\LIMS\test\Variable.xlsx', index = False)

data = getProduct(db)
data.to_excel(r'C:\Users\jaaxx\Documents\Python\LIMS\test\Product.xlsx', index = False)

data = getQuality(db)
data.to_excel(r'C:\Users\jaaxx\Documents\Python\LIMS\test\Quality.xlsx', index = False)

data = getMap(db)
data.to_excel(r'C:\Users\jaaxx\Documents\Python\LIMS\test\Map.xlsx', index = False)

data = getHolidays(db)
data.to_excel(r'C:\Users\jaaxx\Documents\Python\LIMS\test\Holidays.xlsx', index = False)

data = getSamplePoint(db) 
data.to_excel(r'C:\Users\jaaxx\Documents\Python\LIMS\test\SamplePoint.xlsx', index = False)

data = getSampleMatrix(db)
data.to_excel(r'C:\Users\jaaxx\Documents\Python\LIMS\test\SampleMatrix.xlsx', index = False)