import pandas as pd
import re
import numpy as np
#from TableReaders import getVariable
from utildb import checkFK, checkFK0, checkValueList,  existsColumn, checkChildren, isNull
from sqlalchemy import text
#from utilspec import getLimits, getDataVariables, countSpec, getInsertSpec, getupdatespec, updatedSpec, updatedSampleMatrix

# This function updates the detail of specification in dspec table based on
# the intervals saved in spec for a given id (idspec)
def updatedSpec(db, idspec, limits, tests):
    conn = db[1].connect() 
    sql = "DELETE FROM dspec WHERE spec_id=:id"     
    conn.begin()
    conn.execute(text(sql), {'id':idspec} )
    conn.commit()
    for i in range(len(tests)):
        min_val = limits[i][0]
        max_val = limits[i][1]
        idtest = tests.loc[i, 'id']    
        if isinstance(min_val, str) and isinstance(max_val, str):
            if pd.isnull(min_val):
                min_val = ""
            if pd.isnull(max_val):
                max_val = ""
                
            if min_val != "" or max_val != "":
                if min_val == "Y" or min_val == "X":
                    min_val = ""
                    
                sql = "INSERT INTO dSpec(spec_id, variable_id, min, max) VALUES( :p1, :p2, :p3, :p4) ; "
                sql = sql % (str(idspec), str(), min_val, max_val)
                conn.execute(text(sql), {'p1':idspec, 'p2':idtest, 'p3':min_val, 'p4':max_val}    )
    conn.commit()

def updatedSampleMatrix(db, idsamplematrix, flags, tests):
    conn = db[1].connect()
    sql = text("DELETE FROM dsamplematrix WHERE samplematrix_id=:id")
    
    conn.begin()
    conn.execute(sql, {'id':idsamplematrix} )
    for i in range(len(flags)):
        if flags[i] and tests[i][0] > 0:
            sql = "INSERT dSampleMatrix(samplematrix_id, variable_id, ord) VALUES( :p1,:p2, :p3) ; "
            conn.execute(text(sql), {'p1':idsamplematrix, 'p2':tests[i][0] , 'p3': flags[i] })

    conn.commit()


#\d*-\d*|
# Validates the format of the interval for tests in CustomerList and GenSpec
def check_interval(label, ss):

    #print('label ', label, 'ss ', ss, 'type(ss) ', type(ss) )
    # Pattern to match the specified formats
    pattern = r'^(\d*\.?\d*-\d*\.?\d*|-\d*\.\d*|\d*\.\d*-)$' 
    global msg
    msg = ""
    if ss is None or (type(ss) is str and len(ss.strip()) == 0 ):
        return msg
    # Using re.match to check if the string matches the pattern
    if not re.match(pattern, ss):
        msg = f"Column {label}. Interval {ss} of has no correct format"
        return msg    
    ll = ss.split('-') 
    if len(ll[0])>0 and len(ll[1])>0 and float(ll[0] ) > float(ll[1]):
        msg = f"Column {label}. The lower limit {ll[0]} is higher than the upper one {ll[1]}"
        return msg
    return msg 

def check_customerparam(ss, row):    
    coa = row['coa']    
    coc = row['coc']
    onedecimal = row['onedecimal']
    msg = ""
        # Testing the condition: isNull(COA) ==> COA == "X" or COA == "N" is not held
    if not isNull(coa) and not (coa == "X" or coa == "N"):
       msg = "The COA must be X, N or null."
       return msg

    # Testing the condition: isNull(OneDecimal) ==> OneDecimal == "Y" or OneDecimal == "" is not held
    if not isNull(onedecimal) and not (onedecimal in ["Y", ""]):
       mgs = "The OneDecimal must be Y or blank."
       return msg
    
    # Testing the condition: isNull(COC) ==> COC == "X" or COC == "N" is not held
    if not isNull(coc) and not (coc in [ "X" , "N"]):
       msg = "The COC must be X or null." 
       return mgs


view = {}
view['product'] = {'table':'product', 'order': 'id'}
view['product']['cols'] = {}
view['product']['cols']['name'] = {'p':(str, False)} # {'p':(datatype, IsNull, FKColum, FKTable), 'label':label}
view['product']['cols']['bruto'] = {'p':(str, False)}
view['product']['cols']['name_coa'] = {'p':(str, False) }

view['quality'] = {'table':'quality', 'order':'id'}
view['quality']['cols'] = {}
view['quality']['cols']['name'] = {'p':(str, False)}  # {'p':(datatype, IsNull, FKColum, FKTable), 'label':label}
view['quality']['cols']['longname'] = {'p':(str, False) }

view['samplepoint'] = {'table':'samplepoint', 'order':'name'}
view['samplepoint']['cols'] = {}
view['samplepoint']['cols']['name'] = {'p':(str, False)}  # {'p':(datatype, IsNull, FKColum, FKTable), 'label':label}

view['map'] = {'table':'map', 'order':'product.name, quality.name'}
view['map']['cols'] = {}
view['map']['cols']['articlecode'] = {'p':(int, False)}  # {'p':(datatype, IsNull, FKColum, FKTable), 'label':label}
view['map']['cols']['product'] = {'p':(str, False), 'fk': 'product', 'column':'product_id' } 
view['map']['cols']['logisticinfo'] = {'p':(str, True) }
view['map']['cols']['quality'] = {'p':(str, False), 'fk': 'quality', 'column': 'quality_id' }
view['map']['keys'] = [ ('product', 'quality', 'logisticinfo') ] # Unique keys 

view['holidays'] = {'table':'holidays', 'order':'date'}
view['holidays']['cols'] = {}
view['holidays']['cols']['Date'] = {'p':(str, False) }  # (datatype, IsNull, FKColum, FKTable)
view['holidays']['cols']['Description'] = {'p':(str, False) }

view['samplematrix'] = {'table':'samplematrix',  
                        'order':'product.name, quality.name, samplepoint.name',
                        'after': None }
view['samplematrix']['dnorm'] = {}
view['samplematrix']['dnorm']['test'] = {
    'query':"SELECT 'str' datatype, 'True' nnull, shortname name, concat('has_', trim(shortname) ) col, '[''X'',''Y'']' lv, '' validator, ord FROM test WHERE typevar='I' UNION " + \
    "SELECT 'str' datatype, 'True' nnull, shortname name, trim(shortname) col, '[''X'',''Y'']' lv, '' validator, ord FROM test WHERE typevar='L' " + \
    "ORDER BY ord "
}
view['samplematrix']['cols'] = {}
view['samplematrix']['cols']["product"] = {'p':(str, False), 'fk':'product', 'column':'product_id'}  # (datatype, IsNull, FKColum, FKTable)
view['samplematrix']['cols']["quality"] = {'p':(str, False), 'fk':'quality', 'column':'quality_id'} 
view['samplematrix']['cols']["samplepoint"] = {'p':(str, False), 'fk':'samplepoint', 'column':'samplepoint_id' }
view['samplematrix']['cols']["frequency"] = {'p':(str, False), 'lv':['1/2 year','Batch', 'Batch - loading','Day','Delivery','Month','Quarter','Week','Day - loading']  }
view['samplematrix']['cols']["visual"] = {'p':(float, True)  }
view['samplematrix']['dcols'] = {}   # Derivated columns 
view['samplematrix']['dcols']["spec_id"] = {'q': "select id from spec where typespec='GEN' " + \
                                            " and product_id=:product_id and quality_id=:quality_id",
                                            'p':('product_id','quality_id')    }
view['samplematrix']['keys'] = [ ('product', 'quality', 'samplepoint','frequency') ] # Unique keys 

view['genspec'] = {'table':'spec', 
                   'after': updatedSpec,
                    'order': 'product.name, quality.name' }
view['genspec']['dnorm'] = {}
view['genspec']['dnorm']['test'] = {
    'query':"SELECT 'str' datatype, 'True' nnull, shortname name, concat('interval_', trim(shortname) ) col, '' lv, 'check_interval' validator, ord FROM test WHERE typevar='I' UNION " + \
    "SELECT 'str' datatype, 'True' nnull, shortname name, trim(shortname) col, '[''X'',''Y'']' lv, '' validator, ord FROM test WHERE typevar='L' " + \
    "ORDER BY ord "
}
view['genspec']['filter'] = {'typespec':'GEN'}
view['genspec']['cols'] = {}
view['genspec']['cols']["tds"] = {'p':(str, True) }
view['genspec']['cols']["product"] = {'p':(str, False), 'fk':'product' , 'column':'product_id' }
view['genspec']['cols']["quality"] = {'p':(str, False), 'fk':'quality', 'column':'quality_id' }
view['genspec']['cols']["has_Visual"] = {'p':(str, True) }
view['genspec']['cols']["variable1"] = {'p':(str, True), 'fk':'test', 'column':'variable1_id' }
view['genspec']['cols']["variable2"] = {'p':(str, True), 'fk':'test', 'column':'variable2_id' }
view['genspec']['cols']["variable3"] = {'p':(str, True), 'fk':'test', 'column':'variable3_id' }

view['customerlist'] = {'table':'spec', 
                        'order':'Customer, product.name, quality.name', 
                        'after': updatedSpec}
view['customerlist']['dnorm'] = {}
view['customerlist']['dnorm']['test'] = {
    'query':"SELECT 'str' datatype, 'True' nnull, shortname name, concat('interval_', trim(shortname) ) col, '' lv, 'check_interval' validator, ord FROM test WHERE typevar='I' UNION " + \
    "SELECT 'str' datatype, 'True' nnull, shortname name, trim(shortname) col, '[''X'',''Y'']' lv, '' validator, ord FROM test WHERE typevar='L' " + \
    "ORDER BY ord "
}
view['customerlist']['filter'] = {'typespec':'CLI'}
view['customerlist']['cols'] = {}
view['customerlist']['cols']["customer"] = {'p':(str, False) } # {'p':(datatype, IsNull, FKColum, FKTable), 'label':label}
view['customerlist']['cols']["product"] = {'p':(str, False), 'fk':'product', 'column':'product_id'} 
view['customerlist']['cols']["quality"] = {'p':(str, False), 'fk':'quality' , 'column':'quality_id' }
view['customerlist']['cols']["status"] = {'p':(str, True) }
view['customerlist']['cols']["certificaat"] = {'p':(str, True), 'lv':["Y", "N", "M", "Q"] } 
view['customerlist']['cols']["opm"] = {'p':(str, True) }
view['customerlist']['cols']["coa"] = {'p':(str, True), 'lv':['X', 'N']} 
view['customerlist']['cols']["day_coa"] = {'p':(str, True), 'lv':['X', 'N'] }
view['customerlist']['cols']["coc"] = {'p':(str, True), 'lv':['X', 'N'] }
view['customerlist']['cols']["visual"] = {'p':(str, True), 'lv':['X', 'N'], 'c':'' }
view['customerlist']['cols']["onedecimal"] = {'p':(str, True), 'lv':['X', 'Y'] }
view['customerlist']['keys'] = [ ( 'customer','product', 'quality') ] # Unique keys 

# This function build the query of the view_name based on the view definitions
def buildQuery(view_name):
    query = "SELECT ' ' Action "
    From = view[view_name]['table'] 
    where = ""
    if 'filter' in view[view_name]:
       for col, value in view[view_name]['filter'].items():            
            if type(value) is str:
               value = "'" + value + "'"
            where = where + col + "=" + value + " AND "
       
    for label, value in view[view_name]['cols'].items():
        column = label
        if 'column' in value:
            column = value['column']
        if 'fk' in value: # if the column is FK
            table = value['fk']
            colFk = value['column']
            From =  From + "," + table
            column = table + ".name " 
            where = where + view[view_name]['table'] + "." + colFk + " = " + table + ".id AND "  

        if label.lower() in ['as', 'in']: # If label crashes with a reserved word in sql 
           label = label + '1' 
        query = query + ", " + column + " " + label 
    if where != "":
       where = where[0:-4]
    query = query + ", "+ view[view_name]['table'] + ".id "
    query = query + " FROM " + From  
    if where != "":
       query = query + " WHERE " + where    
    return query


# This function validates the order of the columns from the excel table sheets
def preProcData(db, data, view_name): 
    colNames = ['action']
    for col, value in view[view_name]['cols'].items():
        if 'label' in value:
          colNames.append( value['label'] )  
        else:    
          colNames.append( col )

    # Addition of denormalized columns 
    addDnormColumns(db, view_name)
    data.columns = list ( map( str.lower, list(data.columns) ) )  
    data.action = data.action.str.upper()
    #print(list(data.columns))
    msgerror = []
    # Validation of the column names    
    ok, msg = checkDataCols(data, colNames)
    if not ok:
        msgerror.append(msg)
        return msgerror, data
        
    # Validation of Action column
    idx = ~(data['action'].isin(["I", "D", "U"])) & ~(data['action'].isna()) & ~(data['action'].str.strip() == '')
    dd = data[idx]
    if len(dd) > 0:
        msgerror.append(f"There are {len(dd)} rows with wrong values in column Action")
        return msgerror, data

    data.action = data.action.str.upper()
    idx = data.action.isin(["I", "D", "U"])
    data = data[idx].copy()

    # Set nan values to zero for all columns
    for col in data.columns:
        df = data[ data[col].isna() ]
        if col in view[view_name]['cols']:
           if view[view_name]['cols'][col]['p'][0] == str:
              data[col] = data[col].astype(str)        
              for index, row in df.iterrows():
                 data.loc[index, col] = None

           if type(data[col][0]) is float:
              for index, row in df.iterrows():
                 data.loc[index, col] = None

    df = data[ data['id'].isna() ]
    for index, row in df.iterrows():
        data.loc[index, col] = 0
    data.id = data.id.astype(int)
    
    return msgerror, data

# This function validates the column names of data table
def checkDataCols(data, cols):
    ok = 1
    msg = ""    
    for i in range(len(cols)):
        col1 = str(data.columns[i])
        col2 = str(cols[i])
        if col1.lower() != col2.lower():
            msg = f"Incorrect order of columns. Expected column: {cols[i]}, but received: {data.columns[i]}"
            ok = 0
            return ok, msg
    return ok, msg


# Addition of the denormalized columns to view
def addDnormColumns(db, view_name):
    if 'dnorm' in view[view_name]:
       for _, value in view[view_name]['dnorm'].items():
           query = value['query']
           vars = pd.read_sql( text(query) , db[1]) 
           for i in range(len(vars)):
               label = vars.name[i].strip() 
               column = vars.col[i].strip().lower()            
               exec( "p=" + vars.datatype[i], None, locals() ) 
               datatype = locals()['p']
               exec( "p=" + vars.nnull[i] , None, locals() )
               null = locals()['p']
               lv_description = vars.lv[i].strip()
               view[view_name]['cols'][ label ] = {'p':(datatype, null), 'column': column} 
               if len(lv_description) >0 :
                  exec( "p ="+ vars.lv[i] , None, locals()  )
                  lv = locals()['p']
                  if len(lv) > 0: 
                     view[view_name]['cols'][ label ] = {'p':(datatype, null), 'lv':lv ,'column': column} 
               
               validator_name = vars.validator[i].strip()
               if len(validator_name)>0:
                  view[view_name]['cols'][ label ]['validator'] = validator_name ; 



def saveProduct(db,data):
    return saveView('product', db, data)

def saveQuality(db,data):
    return saveView('quality', db, data)

def saveMap(db,data):
    return saveView('map', db, data)

def saveSamplePoint(db,data):
    return saveView('samplepoint', db, data)

def saveHolidays(db,data):
    return saveView('holidays', db, data)

def saveSampleMatrix(db,data):
    return saveView('samplematrix', db, data)

def saveSpec(db,data):
    return saveView('genspec', db, data)

def saveCustomerList(db,data):
    return saveView('customerlist', db, data)


def getHolidays(db): 
    query = buildQuery('holidays')
    return pd.read_sql(query, db[1])
    
def getMap(db):
    query = buildQuery('map')
    return pd.read_sql(query, db[1])

def getProduct(db):
    query = buildQuery('product')
    return pd.read_sql(query, db[1])

def getQuality(db): 
    query = buildQuery('quality')
    return pd.read_sql(query, db[1])

def getSampleMatrix(db):
    query = buildQuery('samplematrix')
    return pd.read_sql(query, db[1])

def getSamplePoint(db): 
    query = buildQuery('samplepoint')
    return pd.read_sql(query, db[1])

def getGenSpec(db): 
    query = buildQuery('genspec')
    return pd.read_sql(query, db[1])

def getCustomerList(db):
    addDnormColumns(db, 'customerlist')
    query = buildQuery('customerlist')
    return pd.read_sql(query, db[1])

def getVariable(db):    
    return None
def saveView(view_name, db, data):
    conn = db[1].connect()
    pendingdata = pd.DataFrame()
    ndeleted = 0
    nupdated = 0
    ninserted = 0
    stat = pd.DataFrame({'ndeleted': [ndeleted], 'nupdated': [nupdated], 'ninserted': [ninserted]}) 

    msgerror, data = preProcData(db, data, view_name)
    query = buildQuery(view_name)
    if msgerror:        
        newdata = pd.read_sql(text(query), db[1])
        return newdata, msgerror, stat, pendingdata

    for i, row in data.iterrows():        
        Action = row['action']
        id = int( row['id'] )        
        if Action == "D":
            if not pd.isna(row['id']):
                sql = text("DELETE FROM " + view[view_name]['table'] +"  WHERE id = :id")
                conn.begin()
                conn.execute(sql, {'id': int(row['id']) }) 
                conn.commit()
                ndeleted += 1
            else:
                msgerror.append(f"Action={Action}, row {i}, id:{id}.  The row can not be deleted.")
                data.loc[i,'action'] =  "*" + Action

        elif Action == "U":
            row2, msgerror2 = validateView(view_name, i, db, row)
            if not msgerror2:
                id = checkFK(db, f"SELECT id FROM " + view[view_name]['table'] +" WHERE id=:id", id = id )
                if id > 0:
                    update = buildUpdateSimple(view_name )  
                    row2 = setAdditionalParameters(db, view_name, row2)
                    #print('update ', update, 'row2 ', list(row2.keys() ))
                    conn.execute(text(update),row2 )
                    conn.commit()
                    nupdated += 1
                else:
                    msgerror2.append(f"Action {Action}, row {i}, Invalid id. Upload this file with the latest version. The row is not updated.")
                    data.loc[i,'action'] =  "*" + Action
            else:
                msgerror.extend(msgerror2)
                data.loc[i,'action'] =  "*" + Action

        elif Action == "I":
            row2, msgerror2 = validateView(view_name, i, db, row)
            if msgerror2:
                msgerror.extend(msgerror2)
                data.loc[i,'action'] =  "*" + Action
            else:
                insert = buildInsertSimple(view_name) 
                row2 = setAdditionalParameters(db, view_name, row2)
                # print('insert ' , insert, 'row2 ', row2 )
                conn.execute(text(insert), row2)
                ninserted += 1
                conn.commit()

    for i in range(len(msgerror)):
        msgerror[i] = str(i + 1) + ")" + msgerror[i]

    stat = pd.DataFrame({'ndeleted': [ndeleted], 'nupdated': [nupdated], 'ninserted': [ninserted]})
    newdata = pd.read_sql(text(query), db[1])

    idx = (data['action'] == "*I") | (data['action'] == "*D") | (data['action'] == "*U")
    pendingdata = data[idx]

    return newdata, msgerror, stat, pendingdata


# This function sets parameters of derivated columns and filters of the view_name
def setAdditionalParameters(db, view_name, row2):
    if 'dcols' in view[view_name]:
        for col, value in view[view_name]['dcols'].items():
            sql = value['q']
            params = {}
            for p in value['p']:
               params[p] = row2[p]

            dd = pd.read_sql(text(sql), db[1], params=params)
            row2[col]=int(dd.id[0] )

    if 'filter' in view[view_name]:
        for col, value in view[view_name]['filter'].items():
                row2[col] = value

    return row2


# This function computes the sql udpate for a simple view
def buildUpdateSimple( view_name ):
    update = "UPDATE " + view[view_name]['table'] + " SET "
    for label, value in view[view_name]['cols'].items():
        label = label.lower()
        if label in ['as','in']:
           label = label + '1' 
        column = label
        if 'column' in value:
            column = value['column']
        
        if 'fk' in value:
           colFk = value['column']
           update = update + colFk + "=:" + colFk + "," 
        else:   
           update = update + column + "=:"+label+"," 

    if 'dcols' in view[view_name]:
        for col, value in view[view_name]['dcols'].items():
            update = update + col + "=:"+col+"," 

    if 'filter' in view[view_name]:
        for col, value in view[view_name]['filter'].items():
            update = update + col + "=:"+col+"," 

    update = update[0:-1] + " WHERE id=:id"
    return update

# This function computes the sql insert for a simple view
def buildInsertSimple( view_name ):
    insert = "INSERT into " + view[view_name]['table'] + "("
    for label, value in view[view_name]['cols'].items():
        label = label.strip().lower()
        if label in ['as','in']:
           label = label + '1'
        column = label
        if 'column' in value:
           column = value['column']   

        if 'fk' in value:
            colFk = value['column']
            insert = insert + colFk + ","  
        else:
            insert = insert + column + ","    

    if 'dcols' in view[view_name]:
        for col, value in view[view_name]['dcols'].items():
            insert = insert + col + ","

    if 'filter' in view[view_name]:
        for col, value in view[view_name]['filter'].items():
            insert = insert + col + ","

    insert = insert[0:-1] + ") VALUES( "
    for label, value in view[view_name]['cols'].items():
        label = label.strip().lower()
        if label in ['as','in']:
           label = label + '1'
        
        if 'fk' in value:
            colFk = value['column']
            insert = insert + ":" + colFk + ","
        else:            
            insert = insert + ":" + label + "," 

    if 'dcols' in view[view_name]:
        for col, value in view[view_name]['dcols'].items():
            insert = insert + ":" + col + ","

    if 'filter' in view[view_name]:
        for col, value in view[view_name]['filter'].items():
            insert = insert + ":" + col + ","

    insert = insert[0:-1] + ")"    
    return insert


def validateView(view_name, i, db, row):
    
    msgerror = []
    id = int(row['id'] )
    Action = row['action'].strip()
    id2 = 0
    row2={}
    if Action == "U" and id ==0:
       msgerror.append(f"Action={Action}, id {id} row {i}. id must be not null")
       return row2, id2, msgerror
    
    if Action == "U" and not type(id) is int:
        msgerror.append(f"Action={Action}, id {id} row {i}. id must be Integer.")
        return row2, id2, msgerror

    # First we validate for not null column, FK and Enum
    for col, value in view[view_name]['cols'].items():
        colinfo = value['p']
        label = col.lower() 
        if label in ['as', 'in']: # If label crashes with a reserved word in sql 
           label = label + '1' 
        #print( 'label ', label, 'type(label) ' , type(label), 'row ', row, '\n'  )
        if colinfo[0] == str and row[label] is not None:
            if isNull(row[label]):
               row[label] = '' 
            #print('label ', label, 'colinfo ', colinfo, 'row[label] ', row[label]  )
            row[label] = row[label].strip()

        if  not colinfo[1]: # if the column is not null
            if isNull(row[label]):       
              msgerror.append(f"Action={Action}, row {i}. {label} must not be null.")
              return row2, msgerror

        if 'validator' in value:
            validator = value['validator']
            if validator != "":
               #print('validator    ', "msg = " + validator + "(label, row)", 'label ', label, 'row ', row )  
               ss = row[label]
               exec( "msg = " + validator + "(label, ss)" ,  globals(), locals() )
               msg = globals()['msg']
               if msg:
                  msgerror.append(msg)
                  return row2, msgerror
            row2[label] = row[label]               
            if type(row[label]) is str:   
               row2[label] = row[label].lower().strip()

        if 'lv' in value:
            lv = value['lv']            
            if not isNull(row[label]) and  not row[label] in lv: 
                msgerror.append(f"Action={Action}. Value {row[label]}  and {label} must be {lv}.")
                return row2, msgerror
            
            row2[label] = row[label]
            if type(row[label]) is str:
               row2[label] = row[label].lower().strip()
        elif 'fk' in value:
            table =  value['fk']
            colFk = value['column']
            row2[colFk] = checkFK(db, "Select id From "+ table +" Where name=:p1", p1=row[label])
            if row2[colFk] == 0: # If the FK value does not exist
                msgerror.append(f"Action={Action}, row {i}, id:{id}. {col}:{row[label]} does not exist.")
                return row2, msgerror         
        else:
            row2[label] = row[label]
            if type(row[label]) is str:
               row2[label] = row[label].lower().strip()

    # Checking uniqueness of keys   
    if 'keys' in view[view_name] and Action =='I':
        for key in view[view_name]['keys']:
            sql = "SELECT id FROM "+ view[view_name]['table'] +" WHERE "
            if 'filter' in view[view_name]:
                  for col, value in view[view_name]['filter'].items():            
                      if type(value) is str:
                         value = "'" + value + "'"
                      sql = sql + col + "=" + value + " AND "

            parameters = {}
            index = 0
            for col in key:                
                colinfo = view[view_name]['cols'][col]['p']
                if 'fk' in view[view_name]['cols'][col]:
                    column = view[view_name]['cols'][col]['column']
                else:
                    column = col

                sql = sql + column + "=:p" + str(index) + " AND "
                parameters["p"+str(index)] = row2[column] 
                index = index + 1            
        sql = sql[0:-4]
        id2 = checkFK0(db, sql, parameters )
        if  id2 > 0:
            msg =f"Action {Action}, row {i}, The combination " 
            for col in key:
                msg = msg + col  + ","
            msg = msg[0:-1] + ":("
            for col in key:
                msg = msg + row[col] + ","

            msg = msg[0:-1] + ")  already exists."
            msgerror.append(msg)
            return row2, msgerror 

    if Action == "U":
       row2['id']=id

        
    return row2, msgerror 


"""
% This function saves the content of the excel sheet of tests (variables) entered by the user 
% to the database (table variable)
% Since SPEC and SAMPLEMATRIX are denormalized tables that contain all
% variables defined in Variable table, this function Insert,Rename or
% delete columns associated with variables(tests) if the variables are
% inserted, modified its name or deleted.
"""
def saveTest(db, data):
    # % This function checks the validity and updates sample matrix (sample points)
    conn = db[1].connect()
    pendingdata = pd.DataFrame()
    ndeleted = 0
    nupdated = 0
    ninserted = 0
    
    data.action = data.action.str.upper()
    # Set nan values to zero
    df = data[ data.id.isna() ]
    for index, row in df.iterrows():
        data.loc[index, 'id'] =0
    stat = pd.DataFrame({'ndeleted': [ndeleted], 'nupdated': [nupdated], 'ninserted': [ninserted]})    
    msgerror, data = preProcData(db, data, 'test')

    if msgerror:
        newdata = getVariable(db)
        return newdata, msgerror, stat, pendingdata

    for i, row in data.iterrows():
        Shortname = row['Shortname'].strip()
        Test = row['Test'].strip()
        Element = row['Element'].strip()
        Unit = row['Unit'].strip()
        Order = str(row['Ord']).strip()
        TypeVar = str(row['TypeVar']).strip()
        listvalue = str(row['listvalue']).strip()
        Action = row['action']

        if Action == "D":
            msgerror2 = checkChildren(db, 'Variable', row['id'])
            if not msgerror2:
                sql = text("DELETE FROM Variable WHERE id=:id" )
                conn.execute(sql, {'id':row['id']})
                if TypeVar == "I":
                    if existsColumn(db, 'spec', f"min_{Shortname}"):
                        conn.execute( text(f"UPDATE spec SET min_{Shortname} = NULL") )
                        conn.execute( text(f"ALTER TABLE spec DROP COLUMN min_{Shortname}") )
                    if existsColumn(db, 'spec', f"max_{Shortname}"):
                        conn.execute( text(f"UPDATE spec SET max_{Shortname} = NULL;"))
                        conn.execute( text(f"ALTER TABLE spec DROP COLUMN max_{Shortname}") )
                else:
                    if existsColumn(db, 'spec', Shortname):
                        conn.execute( text(f"UPDATE spec SET {Shortname} = NULL") )
                        conn.execute( text(f"ALTER TABLE spec DROP COLUMN {Shortname}") )
                conn.commit()
                ndeleted += 1
            else:
                msgerror += msgerror2
                data.loc[i,'action'] =  "*" + Action

        if Action == "U":
            msgerror = validateTest(i, db, row)
            if msgerror:
                continue
            id = row['id']
            T = pd.read_sql(text("SELECT shortname old_name FROM variable WHERE id=:id"), db[1], id=id)
            if not T.empty:                
                msgerror = updateListValue(db, id, listvalue, data, i, msgerror)
                if msgerror:
                    msgerror[-1] = f"Action U id={id}. {msgerror[-1]}"

                cmd = text( "UPDATE variable SET Shortname=:p1, Test=:p2, Element=:p3, Unit=:p4, ord=:p5 WHERE id = :p6" )
                conn.execute(cmd,{'p1':Shortname,'p2':Test,'p3':Element,'p4':Unit,'p5':Order,'p6':id})
                if TypeVar == "I":
                    conn.execute(text( f"EXEC sp_rename 'spec.min_{T['old_name'][0]}', 'min_{Shortname}', 'COLUMN' ") )
                    conn.execute(text( f"EXEC sp_rename 'spec.max_{T['old_name'][0]}', 'max_{Shortname}', 'COLUMN' ") )
                else:
                    conn.execute(text( f"EXEC sp_rename 'spec.{T['old_name'][0]}', '{Shortname}', 'COLUMN'") )
                conn.execute( text("EXEC sp_rename 'samplematrix.has_{T['old_name'][0]}', 'has_{Shortname}', 'COLUMN'") )
                nupdated += 1
                conn.commit()
            else:
                msgerror.append( text( f"Action={Action}, row {i}. The id={id} value is not valid.") )
                data.loc[i,'action'] =  "*" + Action

        if Action == "I":
            msgerror = validateTest(i, db, row)
            if msgerror:
                continue
            sql = text( f"INSERT INTO variable(shortname, test, element, unit, typevar, ord) VALUES (:p1, :p2, :p3, :p4, :p5, :p6)" )
            conn.execute(sql, {'p1':Shortname, 'p2':Test, 'p3':Element, 'p4':Unit, 'p5':TypeVar,'p6':Order})
            T = pd.read_sql( "SELECT SCOPE_IDENTITY();", db[1])
            id = T['x'][0]
            updateListValue(db, id, listvalue, data, i, msgerror)
            dml_spec = "ALTER TABLE SPEC ADD "
            if TypeVar == "I":
                dml_spec += f"min_{Shortname} char(15) max_{Shortname} Numeric(12,6) "
            else:
                dml_spec += f"{Shortname} char(1) "
            dml_samplematrix = f"ALTER TABLE samplematrix ADD has_{Shortname} tinyint "
            conn.execute( text(dml_spec) )
            conn.execute( text(dml_samplematrix) )
            ninserted += 1
            conn.commit()

    for i in range(len(msgerror)):
        msgerror[i] = f"{i + 1}) {msgerror[i]}"

    stat = pd.DataFrame({'ndeleted': [ndeleted], 'nupdated': [nupdated], 'ninserted': [ninserted]})
    newdata = getVariable(db)
    idx = (data['action'] == "*I") | (data['action'] == "*D") | (data['action'] == "*U")
    pendingdata = data[idx]

    return newdata, msgerror, stat, pendingdata


def validateTest(i, db, row):
    msgerror = []
    Shortname = row['Shortname'].strip()
    Order = str(row['Ord']).strip()
    TypeVar = str(row['TypeVar']).strip()
    listvalue = str(row['listvalue']).strip()
    Action = row['Action']
    
    if isNull(Order):
        msgerror.append(f"Action={Action}, row {i}, id:{row['id']}: Order column must be not null.")        
        return msgerror

    if Action == "I":
        nid = checkFK(db, f"SELECT id FROM variable WHERE shortname=:name", name = Shortname)
        if nid > 0:
            msgerror.append(f"Action={Action}, row {i}, id:{row['id']}. column:{Shortname} Repetitive variable:'  ")            
            return msgerror

    if isNull(TypeVar):
        msgerror.append(f"Action={Action}, row {i}, id:{row['id']}. column:TypeVar must be not null.")
        return msgerror

    ok = checkValueList(TypeVar, "L,I")
    if not ok:
        msgerror.append(f"Action={Action}, row {i}, id:{row['id']}. column:TypeVar must be '(L)ist' or (I)nterval")
        return msgerror

    if TypeVar == "L":
        if isNull(listvalue):
            msgerror.append(f"Action={Action}, row {i}, Shortname:{Shortname}: listvalue column must be not null.")
            
    return msgerror


def updateListValue(conn, id, listvalue, data, index, msgerror):
    cursor = conn.cursor()
    tt = [x.strip() for x in listvalue.split(',')]
    id = str(id)
    for description in tt:
        description = description.strip()
        sql2 = text( f"SELECT id, description FROM listvalue WHERE variable_id=:id AND description=:description" )
        T = pd.read_sql(sql2, conn, {'id':id, 'description':description})
        if T.empty:
            cmd = "INSERT INTO listvalue(variable_id, description) VALUES(:id, :description)"
            cursor.execute(cmd, {'id':id, 'description':description} )

    Action = data.loc[index, 'Action']
    if Action == "U":
        T = pd.read_sql( text(f"SELECT id, description FROM listvalue WHERE variable_id=:id") , conn, {'id':id})
        for i in range(len(T)):
            des = T.description[i].strip()
            idx_value = str(T.id[i])
            idx = -1
            for j in range(len(tt)):
                if tt[j] == des:
                    idx = j
                    break
            if idx == -1:
                msgerror2 = checkChildren(conn, 'Listvalue', idx_value)
                if not msgerror2:
                    cursor.execute( text("DELETE FROM listvalue WHERE id=:id"), {'id':idx_value})
                else:
                    msgerror += msgerror2
                    data.loc[index, 'Action'] = "*" + Action

    return msgerror
