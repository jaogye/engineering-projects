import pandas as pd
from UtilDB import checkFK, varColumns
from datetime import datetime, timedelta

"""
This function loads data from logisticdata to the table sample and measuremnts adding in measurement table the limits for each  measurement (variable)
according to specfications of the product and client 
"""
def loadCustomerSample(conn, sdate, iduser):
    cursor = conn.cursor()
    # First, eliminate sample rows whose ordernumber_PVS and loadingdate are not in logisticdata table
    cursor.execute(conn, "DELETE FROM sample WHERE typesample='CLI' AND NOT EXISTS(SELECT * FROM logisticdata l WHERE sample.loadingdate=CONVERT(VARCHAR, l.date, 20) AND sample.ordernumber_PVS=l.ordernumber_PVS)")

    sdate = str(sdate)
    msgerror = ['*********Error Messages from Customer Loadings******']

    sql = "SELECT date, time, name_client, ordernumber_PVS, article_no"+\
    "ordernumber_client, description, loading_ton FROM logisticdata WHERE date IS NULL"    
    cursor.execute(sql)
    pendingdata = pd.DataFrame(cursor.fetchall(), columns=['date', 'time', 'name_client',
    'ordernumber_PVS', 'article_no', 'ordernumber_client',  'description',  'loading_ton'] )

    # Query definitions 
    s1 = "SELECT 'U' typerow, s.id id, l.date loadingdate, l.time, l.name_client, " + \
    " l.ordernumber_PVS, l.article_no, l.ordernumber_client, l.Description, l.loading_ton,  " + \
    " s.testdate, p.name product, q.name quality, s.customer, s.product_id, s.quality_id,  " + \
    " s.articlecode, s.createdby_id, CONVERT(VARCHAR, l.date, 20) date2, sp.COA,  " + \
    " sp.certificaat, sp.COC, sp.Day_COA, sp.opm, sp.onedecimal FROM sample s,  " + \
    " product p, quality q, logisticdata l, spec sp WHERE s.spec_id=sp.id AND  " + \
    " s.loadingdate='%s' AND s.product_id=p.id AND s.quality_id=q.id AND s.typesample='CLI'  " + \
    " AND s.ordernumber_PVS=l.ordernumber_PVS AND s.loadingdate=CONVERT(VARCHAR, l.date, 20) "

    s2 =  " SELECT 'E1' typerow, 0 id, l.date loadingdate, l.time, l.name_client, " + \
    "l.ordernumber_PVS, l.article_no, l.ordernumber_client, l.Description, l.loading_ton, "+ \
    " '' testdate, ' ' product, ' ' quality, ' ' customer, 0 product_id, 0 quality_id, 0 articlecode, "+\
    " 0 createdby_id, ' ' date2, ' ' COA, ' ' certificaat, ' ' COC, ' ' Day_COA, "  + \
    " ' ' opm, ' ' onedecimal FROM logisticdata l WHERE CONVERT(VARCHAR, l.date, 20) ='%s' " + \
    " AND NOT EXISTS(SELECT * FROM map m WHERE l.article_no = m.articlecode) "

    s3=  "SELECT 'E2' typerow, 0 id, l.date loadingdate, l.time, l.name_client, l.ordernumber_PVS,"+ \
    "l.article_no, l.ordernumber_client, l.Description, l.loading_ton, '' testdate, p.name product,"+ \
    "q.name quality, ' ' customer, m.product_id, m.quality_id, m.articlecode, 0 createdby_id,"+ \
    "' ' date2, ' ' COA, ' ' certificaat, ' ' COC, ' ' Day_COA, ' ' opm, ' ' onedecimal"+ \
    " FROM logisticdata l, map m, product p, quality q WHERE CONVERT(VARCHAR, l.date, 20) ='%s'"+ \
    " AND m.product_id=p.id AND m.quality_id=q.id AND l.article_no = m.articlecode AND " + \
    " NOT EXISTS(SELECT * FROM spec s WHERE s.product_id=m.product_id AND s.quality_id=m.quality_id"+\
    " AND s.customer=l.name_client)" 

    s4 = "SELECT 'N' typerow, 0 id, l.date loadingdate, l.time, l.name_client, l.ordernumber_PVS,"+ \
    " l.article_no, l.ordernumber_client, l.Description, l.loading_ton, '' testdate, p.name product"+\
    ", q.name quality, s.customer, m.product_id, m.quality_id, m.articlecode, %d createdby_id," +\
    " CONVERT(VARCHAR, l.date, 20) date2, s.COA, s.certificaat, s.COC, s.Day_COA, s.opm," + \
    " s.onedecimal FROM logisticdata l, map m, product p, quality q, spec s "+\
    " WHERE CONVERT(VARCHAR, l.date, 20) = '%s' AND l.article_no = m.articlecode AND "+\
    " s.product_id=m.product_id AND s.quality_id=m.quality_id AND s.customer=l.name_client "+ \
    " AND m.product_id=p.id AND m.quality_id=q.id AND NOT EXISTS(SELECT * FROM sample s WHERE "+\
    " s.ordernumber_PVS = l.ordernumber_PVS AND s.loadingdate=CONVERT(VARCHAR, l.date, 20)))"
    
    sql = s1 + " UNION " + s2 + " UNION " + s3 + " UNION " + s4
    parameters = (sdate, sdate, sdate, sdate, iduser, sdate)
    nerror = 0
    cursor.execute(sql, params=parameters)
    data = pd.DataFrame(cursor.fetchall(), columns=['typerow', 'id', 'loadingdate', 'time', 
    'name_client', 'ordernumber_PVS', 'article_no', 'ordernumber_client', 'Description', 
    'loading_ton', 'testdate', 'product', 'quality', 'customer', 'product_id', 'quality_id', 
     'articlecode', 'createdby_id', 'date2', 'COA', 'certificaat', 'COC', 'Day_COA', 'opm', 'onedecimal'] )

    for i in range(1, len(data) + 1):
        row = [data.loadingdate[i], data.time[i], data.name_client[i], data.ordernumber_PVS[i], data.article_no[i], data.ordernumber_client[i], data.Description[i], data.loading_ton[i]]

        if data.typerow[i] == 'E1':
            nerror += 1
            msgerror.append("Row {}. It is impossible to find ArticleCode {} in table Map".format(str(nerror), str(data.article_no[i])))
            pendingdata.append(row)
            continue

        Product = data.product[i].strip()
        Quality = data.quality[i].strip()
        idproduct = str(data.product_id[i])
        idquality = str(data.quality_id[i])
        COA = str(data.COA[i]).strip()
        certificaat = str(data.certificaat[i]).strip()
        COC = str(data.COC[i]).strip()
        Day_COA = str(data.Day_COA[i]).strip()
        opm = str(data.opm[i]).strip()
        onedecimal = str(data.onedecimal[i]).strip()

        if data.typerow[i] == 'E2':
            nerror += 1
            name_client = str(data.name_client[i]).strip()
            product = str(data.product[i]).strip()
            quality = str(data.quality[i]).strip()
            articlecode = data.articlecode[i]
            msgerror.append("Row {}, It is impossible to find the combination (Customer, Product, Quality): ({}, {}, {}) in table CustomerList when articlecode = {}".format(str(nerror), name_client, product, quality, articlecode))
            pendingdata.append(row)
            continue

        customer = str(data.customer[i]).strip()

        idspec, _ = getSpecId(conn, idproduct, idquality, customer)
        sql = "SELECT v.shortname variable, variable_id, min, max FROM dspec d, variable v WHERE d.variable_id=v.id AND d.spec_id=%s"
        parameters =( str(idspec) )

        if len(idspec) == 1 and idspec > 0:
            cursor.execute(sql, params=parameters ) 
            limits = pd.DataFrame(cursor.fetchall(), columns = ['variable', 'variable_id', 'min', 'max'] )
            samplenumber = getSampleNumber(conn, sdate, 'CLI')

            if data.typerow[i] == 'N':
                msgerror2 = insertsample(conn, data, i, idspec, iduser, samplenumber, limits)
                msgerror += msgerror2

            if data.typerow[i] == 'U':
                ddate = str(data.loadingdate[i]).strip()
                sql = "UPDATE sample SET samplenumber='?', COA='?', certificaat='?', COC='?', " +\
                "Day_COA='?', opm='?', onedecimal='?' WHERE loadingdate='?' AND ordernumber_PVS=?"
                cursor.execute(sql, (samplenumber, COA, certificaat, COC, Day_COA, opm, onedecimal, ddate, data.ordernumber_PVS[i]))

            if data.typerow[i] == 'U':
                updatesample(conn, data, i, limits)
        elif len(idspec) > 1:
            nerror += 1
            ss = "Row {}. The specification for the combination of: (Product, Quality, Customer)=({}, {}, {}) is duplicated.".format(str(nerror), Product, Quality, customer)
            msgerror.append(ss)
        elif idspec == 0:
            nerror += 1
            ss = "Row {}. It is impossible to find a specification for the combination of: (Product, Quality, Customer)=({}, {}, {}) in table CustomerList.".format(str(nerror), Product, Quality, customer)
            msgerror.append(ss)

    if len(msgerror) == 1:
        msgerror = []

    return msgerror, pendingdata

def updatesample(conn, data, i, limits):
    cursor = conn.cursor()
    idsample = data.id[i]
    for j in range(1, len(limits) + 1):
        variable = limits.variable[j]
        variable_id = limits.variable_id[j]
        min_val = limits.min[j]
        if pd.isna(min_val) or float(min_val) < 0:
            min_val = "NULL"
        max_val = limits.max[j]
        if pd.isna(max_val) or float(max_val) < 0:
            max_val = "NULL"
        sql = "SELECT sample_id FROM measurement WHERE sample_id=? AND variable_id=?" 
        parameters = (idsample, variable_id)
        cursor.execute(sql, params=parameters ) 
        T = pd.DataFrame(cursor.fetchall(), columns = ['sample_id'] )
        if len(T) == 0:
            sql2 = "INSERT INTO measurement(sample_id, variable_id, variable, min, max, value) VALUES (?, ?, '?', '?', '?', -1)"
            values = (str(idsample), str(variable_id), variable, min_val, max_val)
            cursor.execute( sql2, values)
        else:
            sql2 = ""
            if min_val != "NULL" and max_val != "NULL":
                sql2 = "UPDATE Measurement SET min='?', max='?' WHERE sample_id=? AND variable_id=?"  
                values = (str(min_val).strip(), str(max_val).strip(), idsample, variable_id)
            if min_val != "NULL" and max_val == "NULL":
                sql2 = "UPDATE Measurement SET min='?' WHERE sample_id=? AND variable_id=?"  
                values = (str(min_val).strip(), idsample, variable_id)
            if min_val == "NULL" and max_val != "NULL":
                sql2 = "UPDATE Measurement SET max='?' WHERE sample_id=? AND variable_id=?"  
                values = (str(max_val).strip(), idsample, variable_id)
            cursor.execute(sql2, values)
    conn.commit()


def insertsample(conn, data, i, idspec, iduser, samplenumber, limits):
    cursor = conn.cursor()
    msgerror = []
    idproduct = data.product_id[i]
    idquality = data.quality_id[i]
    articlecode = data.articlecode[i]
    customer = data.customer[i]
    Description = str(data.Description[i]).strip()
    loadingdate = str(data.date2[i]).strip()
    stime = str(data.time[i]).strip()
    sdt = str(datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
    loading_ton = data.loading_ton[i]
    ordernumberPVS = str(data.ordernumber_PVS[i]).strip()
    article_no = str(data.article_no[i]).strip()
    ordernumber_client = str(data.ordernumber_client[i]).strip()
    Remark = ""
    BatchNumber = ""
    ContainerNumber = ""
    certificaat = str(data.certificaat[i]).strip()
    COA = str(data.COA[i]).strip()
    COC = str(data.COC[i]).strip()
    Day_COA = str(data.Day_COA[i]).strip()
    opm = str(data.opm[i]).strip()
    onedecimal = str(data.onedecimal[i]).strip()

    insert = "INSERT INTO Sample(typesample, spec_id, product_id, quality_id, articlecode, "+\
    "customer, createdby_id, creationdate, loadingdate, time, ordernumber_PVS, article_no, "+\
    "ordernumber_client, Description, loading_ton, samplenumber,  Remark, BatchNumber, "+\
    "ContainerNumber, certificaat, COA, COC, Day_COA, opm, onedecimal)" + \
    "VALUES('CLI', ?, ?, ?, ?, '?', ?, '?', '?', '?', '?', '?', '?', '?', '?', '?', ?, '?'," + \
    "'?', '?', '?', '?', '?', '?', '?', '?')"
    values = (idspec, idproduct, idquality, articlecode, customer, iduser, sdt, loadingdate, 
              stime, ordernumberPVS, article_no, ordernumber_client, Description, loading_ton, 
              samplenumber, Remark, BatchNumber, ContainerNumber, certificaat, COA, COC, Day_COA, 
              opm, onedecimal)
    
    cursor.execute(insert, values)

    cursor.execute("SELECT SCOPE_IDENTITY();" ) 
    T = pd.DataFrame(cursor.fetchone(), columns = ['new_id'] )
    idsample = T.new_id[0]
    if COA == "X" or Day_COA == "X":
        insertmeasurement(conn, idsample, limits)
    conn.commit()
    return msgerror



def loadProductionSample(conn, sdate, iduser):
    typesample = "PRO"
    date0 = datetime.strptime(sdate, '%Y-%m-%d')
    msgerror = ['*********Error Messages of Production SampleMatrix******']
    Owner = "PVS"

    inidate = getFirstday(conn, date0, '1/2 year')
    if inidate == sdate:
        msgerror2 = loadProductionSampleFrequency(conn, sdate, '1/2 year', iduser, "1/2 year sample", Owner, typesample)
        msgerror += msgerror2

    inidate = getFirstday(conn, date0, 'Week')
    if inidate == sdate:
        msgerror2 = loadProductionSampleFrequency(conn, sdate, 'Week', iduser, "Weekly sample", Owner, typesample)
        msgerror += msgerror2

    inidate = getFirstday(conn, date0, 'Month')
    if inidate == sdate:
        msgerror2 = loadProductionSampleFrequency(conn, sdate, 'Month', iduser, "Montly sample", Owner, typesample)
        msgerror += msgerror2

    inidate = getFirstday(conn, date0, 'Quarter')
    if inidate == sdate:
        msgerror2 = loadProductionSampleFrequency(conn, sdate, 'Quarter', iduser, "Quarterly sample", Owner, typesample)
        msgerror += msgerror2

    msgerror2 = loadProductionSampleFrequency(conn, sdate, 'Day', iduser, "Daily sample", Owner, typesample)
    msgerror += msgerror2

    if len(msgerror) == 1:
        msgerror = []

    return msgerror


def loadProductionSampleFrequency(conn, sdate, Frequency, iduser, Description, Owner, typesample):
    msgerror = []
    cursor = conn.cursor()
    colvars = varColumns(conn, "d")
    sql = "SELECT x.*, p.name Product, q.name Quality, sp.name SamplePoint " + \
        "FROM Samplematrix x, product p, quality q, samplepoint sp " + \
        "WHERE Frequency='?' and x.product_id=p.id and x.quality_id=q.id and " + \
        "x.samplepoint_id=sp.id and " + \
        "not exists(SELECT * FROM sample s where typesample='?' and s.loadingdate='?' and x.product_id=s.product_id);"
    
    cursor.execute( sql, params=(Frequency, typesample, sdate) )
    T = pd.DataFrame(cursor.fetchall, columns=[])

    dd = datetime.strptime('06:00', '%H:%M')
    for i in range(1, len(T) + 1):
        dd += timedelta(minutes=1)
        stime = dd.strftime('%H:%M')
        msgerror2 = insertsample(conn, T, i, iduser, sdate, Description, Owner, typesample, stime)
        msgerror += msgerror2

    conn.commit()
    return msgerror

def insertsample(conn, T, i, iduser, sdate, Description, Owner, typesample, stime):
    cursor = conn.cursor()
    idproduct = str(T.product_id[i])
    idquality = str(T.quality_id[i])
    Product = str(T.Product[i]).strip()
    Quality = str(T.Quality[i]).strip()
    Frequency = str(T.Frequency[i]).strip()
    SamplePoint = str(T.SamplePoint[i]).strip()
    idSampleMatrix = str(T.id[i])
    idSamplePoint = str(T.SamplePoint_id[i])
    msgerror = []

    dt = datetime.now()
    sdt = dt.strftime('%Y-%m-%d %H:%M:%S')
    SampleNumber = getSampleNumber(conn, sdate, 'PRO')

    idold = checkFK(conn, "SELECT id FROM sample WHERE typesample='?' and samplematrix_id=? " + \
        "and loadingdate='?' and time='?';", (typesample, idSampleMatrix, sdate, stime) )

    if idold > 0:
        return

    idspec, _ = getSpecId(conn, idproduct, idquality, '')
    if idspec == 0:
        ss = "There is no specification for (Product,Quality):({}, {})".format(Product, Quality)
        msgerror.append(ss)
        return

    sql = "SELECT v.shortname variable, d.variable_id, null min, null max " + \
        "FROM dsamplematrix d, variable v " + \
        "WHERE d.variable_id=v.id and d.samplematrix_id=? " + \
        "and not exists(SELECT * FROM dspec d2, samplematrix sm, spec sp " + \
        "WHERE sm.product_id=sp.product_id and sm.quality_id=sp.quality_id and sp.typeSpec='GEN' " + \
        "and d.variable_id = d2.variable_id) " + \
        "UNION " + \
        "SELECT v.shortname variable, d.variable_id, min, max " + \
        "FROM dsamplematrix d, variable v, dspec d2, samplematrix sm, spec sp " + \
        "WHERE d.variable_id=v.id and d.samplematrix_id=? and sp.typeSpec='GEN' " + \
        "and d.samplematrix_id=sm.id and d2.spec_id=sp.id " + \
        "and sm.product_id=sp.product_id and sm.quality_id=sp.quality_id " + \
        "and d.variable_id = d2.variable_id;"

    limits = pd.read_sql( sql, conn , params=(idSampleMatrix, idSampleMatrix))

    if len(limits) == 0:
        ss = "The variables for (Product, Quality, SamplePoint, Date, Time):({}, {}, {}, {}, {}) are not in table Spec.".format(Product, Quality, SamplePoint, sdate, stime)
        msgerror.append(ss)
        return

    insert = "INSERT INTO Sample(typesample, spec_id, customer, samplematrix_id, " + \
        "product_id, quality_id, createdby_id, creationdate, " + \
        "loadingdate, time, Description, SampleNumber, SamplePoint_id, article_no) " + \
        "VALUES( '?', ?, '?', ?, ?, ?, ?, '?', '?', '?', '?', '?', ?, 0);"
    values = (typesample, idspec, Owner, idSampleMatrix, idproduct, idquality, iduser,
              sdt, sdate, stime, Description, SampleNumber, idSamplePoint)
    
    cursor.execute(conn, insert, values)
    T = pd.read_sql( 'SELECT SCOPE_IDENTITY();', conn)
    idsample = T.x[0]

    insertmeasurement(conn, idsample, limits)
    conn.commit()


def insertmeasurement(conn, idsample, limits):
    cursor = conn.cursor()
    for j in range(1, len(limits) + 1):
        variable = str(limits.variable[j])
        variable_id = limits.variable_id[j]
        min_val = str(limits.min[j]).strip()
        if min_val == '' or float(min_val) < 0:
            min_val = "NULL"
        max_val = str(limits.max[j]).strip()
        if max_val == '' or float(max_val) < 0:
            max_val = "NULL"
        sInsert = "INSERT INTO Measurement(sample_id, variable_id, variable, min, max, value)"+ \
        " VALUES (?, ?, '?', '?', '?', -1)"
        cursor.execute(conn, sInsert, (idsample, variable_id, variable, min_val, max_val))




def getFirstday(conn, date0, Frequency):
    inidate = date0
    if Frequency == '1/2 year':
        q = (date0.month - 1) // 6 + 1
        if q == 1:
            date1 = datetime(date0.year, 1, 1)
        elif q == 2:
            date1 = datetime(date0.year, 7, 1)
        inidate = firstNonHolidays(conn, date1)

    elif Frequency == 'Month':
        date1 = datetime(date0.year, date0.month, 1)
        inidate = firstNonHolidays(conn, date1)

    elif Frequency == 'Quarter':
        q = (date0.month - 1) // 3 + 1
        if q == 1:
            date1 = datetime(date0.year, 1, 1)
        elif q == 2:
            date1 = datetime(date0.year, 4, 1)
        elif q == 3:
            date1 = datetime(date0.year, 7, 1)
        elif q == 4:
            date1 = datetime(date0.year, 10, 1)
        inidate = firstNonHolidays(conn, date1)

    elif Frequency == 'Week':
        date1 = date0 - timedelta(days=(date0.weekday() - 1))
        inidate = firstNonHolidays(conn, date1)
    return inidate


def firstNonHolidays(conn, inidate):
    offset = 0
    sql = "SELECT * FROM Holidays WHERE date='?';"
    inidate_str = inidate.strftime('%Y-%m-%d')
    T = pd.read_sql(sql, conn, params=(inidate_str) )

    while len(T) != 0:
        inidate += timedelta(days=1)
        inidate_str = inidate.strftime('%Y-%m-%d')
        T = pd.read_sql(sql, conn, params=(inidate_str) )
        offset += 1

    inidate2 = inidate.strftime('%Y-%m-%d')
    return inidate2


# This function updates the lab input into the database
def updateLabSample(conn, tsample, tmeasurement, iduser):
    ok = 1
    cursor = conn.cursor()    
    for i in range(len(tsample)):
        samplenumber = tsample['SampleNumber'][i].strip()
        SamplePoint = tsample['Tank'][i].strip()
        idSamplePoint = checkFK(conn, "SELECT id FROM samplepoint WHERE name='?'", (SamplePoint) )
        Remark = tsample['Remark'][i].strip()
        BatchNumber = tsample['batchnumber'][i].strip()
        ContainerNumber = tsample['containernumber'][i].strip()
        n = len(Remark)
        Remark = Remark[:n + 1]
        stestdate = tsample['testdate'][i]
        
        if pd.isnull(stestdate) or stestdate == "":
            stestdate = ""
        
        if idSamplePoint == 0:
            sql = "UPDATE sample SET remark='?', batchnumber='?', " + \
                "containernumber='?', testdate='?' WHERE samplenumber='?' ;"
            values = (Remark, BatchNumber, ContainerNumber, stestdate, samplenumber)
        else:
            sql = "UPDATE sample SET SamplePoint_id=?, remark='?', batchnumber='?', " + \
                "containernumber='?' , testdate='?' WHERE samplenumber='?' ;"
            values = (idSamplePoint, Remark, BatchNumber, ContainerNumber, stestdate, samplenumber)
        
        cursor.execute(conn, sql, values)
        conn.commit()
    
    updateM = "UPDATE measurement SET value=?, testedby_id=?, testdate='?', less=?, " + \
        "listvalue='?', listvalue_id=? WHERE sample_id=? and variable_id=?  ;"
    
    for j in range(len(tmeasurement)):
        variable_id = tmeasurement['variable_id'][j]
        value = str(tmeasurement['value'][j])
        idsample = tmeasurement['sample_id'][j]
        listvalue = str(tmeasurement['listvalue'][j])
        listvalue_id = tmeasurement['listvalue_id'][j]
        testdate = tmeasurement['testdate'][j]
        less = 0 if not tmeasurement['less'][j] else 1
        
        if listvalue_id < 0:
            listvalue_id = "NULL"
        else:
            listvalue_id = str(listvalue_id)
        
        parameters = (value, iduser, testdate, less, listvalue, listvalue_id, idsample, variable_id)
        cursor.execute(updateM, parameters)
    
    return ok


"""
This function gets the id from spec satisfying idproduct and idquality and customer 
"""
def getSpecId(conn, idproduct, idquality, customer):
    cursor = conn.cursor()
    certificaat = "9999"
    idspec = 0
    idproduct = str(idproduct)
    idquality = str(idquality)
    sql = "SELECT id FROM spec WHERE typespec='CLI' AND product_id=? AND quality_id=? AND customer=?;"
    T = pd.read_sql( sql, conn, params=(idproduct, idquality, customer))
    if not T.empty:
        idspec = T.at[0, 'id']
        certificaat = str(T.at[0, 'certificaat']).strip()
    else:
        sql = "SELECT id FROM spec WHERE typespec='GEN' AND product_id=? AND quality_id=?;"
        T = pd.read_sql( sql, conn, params=(idproduct, idquality))
        if not T.empty:
            idspec = T.at[0, 'id']
    cursor.close()
    return idspec, certificaat


# This function computes the next sample number for any type of sample (CLI, PRO, MAN)
def getSampleNumber(conn, sdate, typesample):
    cursor = conn.cursor()
    sql = "SELECT COUNT(*) AS cnt FROM Sample WHERE typesample=? AND SUBSTRING(loadingdate,1,10)=?;"
    cursor.execute(sql, (typesample, sdate))
    T = cursor.fetchone()
    if T[0] > 0:
        sql2 = "SELECT MAX(SUBSTRING(samplenumber, 11, 3)) AS lastsample FROM sample " \
               "WHERE typesample=? AND SUBSTRING(loadingdate,1,10)=?;"
        cursor.execute(sql2, (typesample, sdate))
        T2 = cursor.fetchone()
        x = int(T2[0]) + 1
    else:
        x = 1

    ss = typesample[:2]
    newSampleNumber = ss + datetime.strftime(sdate, '%d%m%Y') + "_" + str(x).zfill(3)

    cursor.close()
    return newSampleNumber
