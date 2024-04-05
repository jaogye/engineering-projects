import pandas as pd
from UtilDB import checkFK, checkNotNull, checkValueList
from sqlalchemy import select, literal_column, text, bindparam

def get_pending_jobs(conn, sdate):
    cursor = conn.cursor()

    sql = "SELECT s.SampleNumber, s.loadingdate, m.variable, m.min, m.max " \
          "FROM measurement m, sample s " \
          "WHERE m.sample_id=s.id AND value=-1 AND SUBSTRING(s.loadingdate,1,10)=%s " \
          "ORDER BY s.SampleNumber;"
    cursor.execute(sql, (sdate,))
    detail = pd.DataFrame(cursor.fetchall(), columns=['SampleNumber', 'Date', 'Variable', 'Min', 'Max'])

    detail['SampleNumber'] = detail['SampleNumber'].str.strip()
    detail['Date'] = detail['Date'].str.strip()

    sql = "SELECT s.samplenumber, COUNT(*) AS tested " \
          "FROM sample s, measurement m " \
          "WHERE SUBSTRING(s.loadingdate,1,10)=%s AND m.sample_id=s.id AND m.value > -1 " \
          "GROUP BY s.samplenumber " \
          "UNION " \
          "SELECT s.samplenumber, 0 AS tested " \
          "FROM sample s " \
          "WHERE SUBSTRING(s.loadingdate,1,10)=%s AND NOT EXISTS " \
          "(SELECT * FROM measurement m WHERE m.sample_id=s.id AND m.value > -1);"
    cursor.execute(sql, (sdate, sdate))
    T1 = pd.DataFrame(cursor.fetchall(), columns=['SampleNumber', 'Tested'])

    sql = "SELECT s.typesample, s.samplenumber, sp.name AS samplepoint, CONCAT(s.loadingdate,' ', s.time) AS date, " \
          "s.customer, p.name AS product, " \
          "q.name AS quality, COUNT(*) AS total " \
          "FROM sample s LEFT OUTER JOIN samplepoint sp ON sp.id=s.samplepoint_id, " \
          "measurement m, product p, quality q " \
          "WHERE SUBSTRING(s.loadingdate,1,10)=%s AND m.sample_id=s.id AND s.product_id=p.id " \
          "AND s.quality_id=q.id " \
          "GROUP BY s.typesample, s.samplenumber, sp.name, s.loadingdate, s.time, s.customer, p.name, q.name;"
    cursor.execute(sql, (sdate,))
    T2 = pd.DataFrame(cursor.fetchall(), columns=['TypeSample', 'SampleNumber', 'SamplePoint', 'Date',
                                                   'Customer', 'Product', 'Quality', 'Total'])

    sql = "SELECT s.samplenumber, COUNT(*) AS notested " \
          "FROM sample s, measurement m " \
          "WHERE SUBSTRING(s.loadingdate,1,10)=%s AND m.sample_id=s.id AND m.value = -1 " \
          "GROUP BY s.samplenumber " \
          "UNION " \
          "SELECT s.samplenumber, 0 AS notested " \
          "FROM sample s " \
          "WHERE SUBSTRING(s.loadingdate,1,10)=%s AND NOT EXISTS " \
          "(SELECT * FROM measurement m WHERE m.sample_id=s.id AND m.value = -1);"
    cursor.execute(sql, (sdate, sdate))
    T3 = pd.DataFrame(cursor.fetchall(), columns=['SampleNumber', 'NotTested'])

    cursor.close()

    T4 = pd.merge(T1, T2, how='outer', on='SampleNumber')
    T = pd.merge(T4, T3, how='outer', on='SampleNumber')

    summary = pd.DataFrame({
        'TypeSample': T['typesample'],
        'SampleNumber': T['samplenumber'].str.strip(),
        'SamplePoint': T['samplepoint'].str.strip(),
        'SampleDate': T['date'],
        'Customer': T['customer'].str.strip(),
        'Product': T['product'].str.strip(),
        'Quality': T['quality'].str.strip(),
        'Vars.': T['total'],
        'Tested': T['tested'],
        'NotTested': T['notested']
    })

    summary = summary.sort_values(by='NotTested', ascending=False)

    return summary


"""
This function provide the data to fill the general information table and
Quality table of Input LabData option. 
"""
def getSampleMeasurement(conn, sdate):
    sql_sample = "SELECT  s.samplenumber SampleNumber, s.customer CustomerName, sp.name Tank, " + \
        "s.article_no ArticleCode, concat(s.loadingdate,' ', time)  SampleDate, testdate, " + \
        "p.name  Product, q.name Quality, cast( ordernumber_PVS as char)  ordernumber_PVS,  " + \
        "s.ordernumber_client, s.batchnumber, s.containernumber, s.remark Remark, " + \
        "s.COA, s.Day_COA, s.COC, s.opm, s.onedecimal " + \
        " FROM sample s left join samplepoint sp on s.samplepoint_id=sp.id, product p, quality q " + \
        " WHERE substring(s.loadingdate,1,10)='%s' and s.product_id=p.id and s.quality_id=q.id " + \
        " and s.samplematrix_id is null  " + \
        " UNION " + \
        "SELECT s.samplenumber SampleNumber, 'PVS' CustomerName, sp.name Tank, " + \
        "s.article_no ArticleCode, concat(s.loadingdate,' ', time)  SampleDate, " + \
        "testdate, p.name  Product, q.name Quality, " + \
        "cast( ordernumber_PVS as char)   ordernumber_PVS,  s.ordernumber_client, " + \
        "s.batchnumber, s.containernumber, s.remark Remark, s.COA, s.Day_COA, s.COC, " + \
        " s.opm, s.onedecimal  " + \
        " FROM sample s, product p, quality q, samplepoint sp  " + \
        " WHERE substring(s.loadingdate,1,10)='%s' and s.product_id=p.id and s.quality_id=q.id " + \
        " and s.samplepoint_id=sp.id and s.samplematrix_id is not null ;"
    
    sql_sample = sql_sample % (sdate, sdate)
    sample = select(conn, sql_sample)
    
    sample['Remark'] = sample['Remark'].str.strip()
    sample['SampleNumber'] = sample['SampleNumber'].str.strip()
    sample['CustomerName'] = sample['CustomerName'].str.strip()
    sample['Tank'] = sample['Tank'].str.strip()
    sample['Product'] = sample['Product'].str.strip()
    sample['Quality'] = sample['Quality'].str.strip()
    sample['containernumber'] = sample['containernumber'].str.strip()
    sample['SampleDate'] = sample['SampleDate'].str.strip()
    sample['ordernumber_client'] = sample['ordernumber_client'].str.strip()
    sample['COA'] = sample['COA'].str.strip()
    sample['Day_COA'] = sample['Day_COA'].str.strip()
    sample['COC'] = sample['COC'].str.strip()
    sample['opm'] = sample['opm'].str.strip()
    
    sql_measurement = "SELECT s.samplenumber SampleNumber, m.*,  '' str_value, v.typevar, 0 modified " + \
        " FROM sample s, measurement m, variable v " + \
        " WHERE m.variable_id=v.id and m.sample_id=s.id  and substring(s.loadingdate,1,10)='%s'" + \
        " ORDER BY s.samplenumber, v.ord ;"
    
    sql_measurement = sql_measurement % sdate
    measurement = select(conn, sql_measurement)
    
    measurement['SampleNumber'] = measurement['SampleNumber'].str.strip()
    measurement['str_value'] = measurement['str_value'].str.strip()
    
    for i in range(len(measurement)):
        measurement.at[i, 'str_value'] = str(measurement.at[i, 'value'])
        if measurement.at[i, 'less']:
            measurement.at[i, 'str_value'] = "<" + str(measurement.at[i, 'value'])
        if measurement.at[i, 'value'] == -1 or pd.isna(measurement.at[i, 'value']):
            measurement.at[i, 'str_value'] = ""
        if str(measurement.at[i, 'min']).strip() == "NULL":
            measurement.at[i, 'min'] = ''
        if str(measurement.at[i, 'max']).strip() == "NULL":
            measurement.at[i, 'max'] = ''
    
    return sample, measurement


def get_sample(conn, sdate, typesample):
    cursor = conn.cursor()

    if typesample:
        sql = "SELECT samplenumber AS SampleNumber, p.name AS Product, q.name AS Quality, sp.name AS SamplePoint, " \
              "loadingdate AS SampleDate, time AS SampleTime, remark AS Remark, createdby_id, samplepoint_id, " \
              "s.product_id, s.id, s.COA, s.Day_COA, s.COC " \
              "FROM sample s LEFT JOIN samplepoint sp ON s.samplepoint_id=sp.id, " \
              "product p, quality q " \
              "WHERE s.product_id=p.id AND s.quality_id=q.id " \
              "AND s.loadingdate = %s AND s.typesample = %s;"
        cursor.execute(sql, (sdate, typesample))
    else:
        sql = "SELECT samplenumber AS SampleNumber, p.name AS Product, q.name AS Quality, sp.name AS SamplePoint, " \
              "loadingdate AS SampleDate, time AS SampleTime, remark AS Remark, createdby_id, samplepoint_id, s.id, " \
              "s.product_id, s.COA, s.Day_COA, s.COC " \
              "FROM sample s LEFT JOIN samplepoint sp ON s.samplepoint_id=sp.id, product p, quality q " \
              "WHERE s.product_id=p.id AND s.quality_id=q.id " \
              "AND s.loadingdate = %s;"
        cursor.execute(sql, (sdate,))

    T = pd.DataFrame(cursor.fetchall(), columns=['SampleNumber', 'Product', 'Quality', 'SamplePoint',
                                                  'SampleDate', 'SampleTime', 'Remark', 'COA', 'Day_COA',
                                                  'COC', 'id'])

    cursor.close()

    if not T.empty:
        T['SampleNumber'] = T['SampleNumber'].str.strip()
        T['Product'] = T['Product'].str.strip()
        T['Quality'] = T['Quality'].str.strip()
        T['SamplePoint'] = T['SamplePoint'].str.strip()
        T['SampleDate'] = T['SampleDate'].str.strip()
        T['SampleTime'] = T['SampleTime'].str.strip()
        T['Remark'] = T['Remark'].str.strip()

    return T


def get_COA_data(conn, samplenumber):
    cursor = conn.cursor()

    sql_sample = "SELECT p.name_coa AS Grade, q.longname AS TechnicalGrade, s.customer AS Customer, " \
                 "s.ordernumber_PVS, s.ordernumber_client, SUBSTRING(s.loadingDate,1,10) AS SampleDate, " \
                 "p.bruto AS Bruto, SUBSTRING(s.TestDate,1,10) AS TestDate, s.BatchNumber, s.ContainerNumber, " \
                 "s.onedecimal " \
                 "FROM sample s, product p, quality q " \
                 "WHERE samplenumber=%s AND s.product_id=p.id AND s.quality_id=q.id;"
    cursor.execute(sql_sample, (samplenumber,))

    sample = pd.DataFrame(cursor.fetchall(), columns=['Grade', 'TechnicalGrade', 'Customer', 'Ordernumber_PVS',
                                                      'Ordernumber_Client', 'SampleDate', 'Bruto', 'TestDate',
                                                      'BatchNumber', 'ContainerNumber', 'Onedecimal'])

    sql_measurement = "SELECT v.Test, v.Element, m.value AS TestResults, " \
                      "IFNULL(m.min, '') AS Min, IFNULL(m.max, '') AS Max, " \
                      "v.unit, m.less, v.typevar, m.listvalue " \
                      "FROM sample s, measurement m, variable v " \
                      "WHERE m.sample_id=s.id AND m.variable_id=v.id AND samplenumber=%s " \
                      "ORDER BY v.ord;"
    cursor.execute(sql_measurement, (samplenumber,))
    measurement = pd.DataFrame(cursor.fetchall(), columns=['Test', 'Element', 'TestResults', 'Min', 'Max',
                                                            'Unit', 'Less', 'Typevar', 'Listvalue'])

    cursor.close()

    return sample, measurement


"""
This function gets the values of listvalue tests involved in a given
SampleNumber entered by the user
"""
def getDataListValues(conn, SampleNumber):
    cursor = conn.cursor()

    sql = "SELECT l.id, v.shortname, l.variable_id, l.description " \
          "FROM variable v, listvalue l, measurement m, sample s " \
          "WHERE l.variable_id = v.id AND m.sample_id=s.id AND v.typevar='L' " \
          "AND m.variable_id=l.variable_id AND s.samplenumber = ? ORDER BY v.id;"
    cursor.execute(sql, (SampleNumber,))
    data = cursor.fetchall()
    columns = ['id', 'shortname', 'variable_id', 'description']
    list_values = pd.DataFrame(data, columns=columns)
    cursor.close()
    ngrp = list_values['variable_id'].nunique()

    listValues = []
    index = 0
    while index < len(list_values):
        variable_id = list_values.at[index, 'variable_id']
        if ngrp > 1:
            shortname = list_values.at[index, 'shortname'].strip()
            listValues.append((-1, '-----' + shortname))
        while index < len(list_values) and variable_id == list_values.at[index, 'variable_id']:
            id_val = list_values.at[index, 'id']
            description = list_values.at[index, 'description'].strip()
            listValues.append((id_val, description))
            index += 1

    return listValues


