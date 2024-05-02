import json
import os
import pandas as pd


"""
This program recursively read a manifest file from CDM (Common Data Models ) from https://github.com/microsoft/CDM  
and generate a json file (data.json) containing the tables/entities, columns/attributes and relations 
of the models included in the manifest. 
"""


def read_entity_attributes(entity_path):
    """
    Reads an entity JSON file and prints its attributes.
    """
    #print(f'entity_path {entity_path}' )
    table_info = {} 
    try:
        with open(entity_path, 'r', encoding='utf-8') as file:
            entity_data = json.load(file)                                
            if "definitions" in entity_data:                          
                table_info = {'name':'', 'description': '', 'columns': {}, 'dataTypeNames': {} }   

                #nlen = len(entity_data['definitions'])
                #print(f"\t\tAttributes of entity {os.path.basename(entity_path)}  Number of definitions:{nlen}")
                definition = entity_data["definitions"][ 0 ]
                if 'hasAttributes' in definition and 'entityName' in definition:
                    table_info = extractAttributes(definition) 

                if 'constantEntityName' in definition:
                    extractConstantAttributes(table_info, definition)    

                if 'dataTypeName' in definition:
                    table_info['dataTypeNames'][definition['dataTypeName']] = definition['extendsDataType']

                if 'displayName' in definition:                          
                    table_info['description'] =  definition['displayName']
                    #else:
                    #   raise Exception(f"No valid de in {entity_path}")
            else:
                raise Exception("\t\t\tNo definitions found.")
            
    except FileNotFoundError:
        raise Exception(f"\t\tError: Entity file {entity_path} not found.")

    return table_info



def extractAttributes(definition):
#dict_keys(['name', 'sourceName', 'sourceOrdering', 'description', 'displayName', 'isNullable', 'purpose', 'dataType', 'appliedTraits'])
#attr = definition["hasAttributes"][0]['attributeGroupReference']["members"][0] 
    entityName = definition["entityName"]
    extendsEntity = ''
    if "extendsEntity" in definition:
       extendsEntity = definition["extendsEntity"]
    #displayName = definition["displayName"]
    description = ''   
    if "description" in definition:   
       description = definition["description"]
    #sourceName = definition["sourceName"]    
    table_info = {'name':entityName, 'description': description, 'columns': {}, 'dataTypeNames': {} }    
    table_info['name'] = entityName
    table_info['description'] = description

    if "hasAttributes" in definition:
        for attr_grp in definition["hasAttributes"]:
            if 'attributeGroupReference' in attr_grp:
                if 'members' in attr_grp['attributeGroupReference']:
                    members = attr_grp['attributeGroupReference']['members']
                    for attr in members:
                        #print('attr=',attr) ; print()
                        extractMember(table_info, attr)
            elif len(definition["hasAttributes"])>1:                    
                extractMember(table_info, attr_grp)

    return table_info



def extractMember(table, attr):
    #console.append('attr ', attr )
    colFK = ""
    tableFK = ""
    if "entity" in attr:
        #console.append("attr['entity'] " , attr["entity"])
        if 'entityReference' in attr["entity"]:
            tableFK = attr["entity"]['entityReference']
                        
        if  'source' in attr["entity"]:
            if  type(attr["entity"]['source']) is str:   # It is FK
                tableFK = attr["entity"]['source']
                colFK = attr["entity"] ['operations'][0]['reference']
                                                                                          
            if  type(attr["entity"]['source']) is dict:
                tableFK = attr["entity"]['source']["entityReference"]["entityName"]
                #print('entityName ', entityName, ' attribute ', attr['name'], 'attr["entity"] ', attr["entity"])
                colFK = "Detailed table"
                if 'reference' in attr["entity"] ['operations'][0]:
                    colFK = attr["entity"] ['operations'][0]['reference']                    
                        
    if 'dataType' in attr: 
        col = extractAttributeInfo(attr, tableFK, colFK)
        table['columns'][col['name']] = {}
        table['columns'][col['name']]['description'] = col['description']
        table['columns'][col['name']]['data_type'] = col['dataType']
        table['columns'][col['name']]['isNullable'] = col['isNullable']
        table['columns'][col['name']]['listValues'] = col['listValues']
    elif 'entity' in attr:
        col_name = attr['name']
        if col_name[ : 13].lower() in [ 'relationship_' , 'backingtable_']:
           col_name = col_name[ 13 :]

        table['columns'][col_name] = {}
        table['columns'][col_name]['tableFK'] = attr['entity']['entityReference']  
        table['columns'][col_name]['data_type'] = 'int'
        table['columns'][col_name]['isNullable'] = True
        table['columns'][col_name]['listValues'] = ''

    

def extractAttributeInfo(attr, tableFK, colFK):
    col = {'name':attr['name']}  
    col['description']=''
    if 'description' in attr: 
       col['description'] = attr['description'] 

    if 'displayName' in attr and col['description']=='':
       col['description'] = attr['displayName']

    col['listValues'] = ''
    col['tableFK'] = tableFK
    col['colFK'] = colFK
    
    if type(attr['dataType']) is str:
        sdataType = attr['dataType'] 
        if 'maximumLength' in attr:
            ss = attr['maximumLength']
            if type(attr['maximumLength']) is int:
               ss = str(attr['maximumLength'])

            #print("attr['name'] ", attr['name'] ,"attr['dataType'] ", attr['dataType'] , "attr['maximumLength']) ", attr['maximumLength'] , type(attr['maximumLength']))  
            sdataType = sdataType + "("+ ss +")"

    if type(attr['dataType']) is dict:
        sdataType = attr['dataType']['dataTypeReference']
        
        #print("attr['dataType']constantValues ", attr['dataType']['appliedTraits'][0], type(attr['dataType']['appliedTraits'][0]), sdataType )
        
        if type(attr['dataType']['appliedTraits'][0]) is dict:
           if 'constantValues' in attr['dataType']['appliedTraits'][0]['arguments'][0]['entityReference']:
               Values = attr['dataType']['appliedTraits'][0]['arguments'][0]['entityReference']['constantValues']
               slistValues = ''  
               for value in Values:
                   slistValues = slistValues + value[1] + ","
               slistValues = slistValues[0:-1]
               col['listValues'] = slistValues
        
    col['isNullable']=''
    if 'isNullable' in attr:
        col['isNullable']=attr['isNullable'] 

    #col['purpose'] = attr['purpose'] 
    col['dataType']=sdataType
    if 'maximumLength' in attr:
        col['maximumLength'] = attr['maximumLength']
        #if  'appliedTraits' in attr:
            #     col['appliedTraits'] = attr['appliedTraits']
        #des_entity = f"Table(FK):{tableFK} Col(FK):{colFK}" 
        #print(f"\t\t\t- {attr['name']}: {attr.get('description', 'No description available')} {des_entity}")

    if col['name'][-4 :].lower() == 'date':
       col['dataType'] = 'date'

    return col


def extractConstantAttributes(table_info, definition):
    col ={'name': definition['constantEntityName'], 'dataType':definition['entityShape'],'description':definition['explanation']} 
    slistValues = ''                              
    Values = definition['constantValues'] 
    for value in Values:
        slistValues = slistValues + value[1] + ","
    slistValues = slistValues[0:-1]
    col['listValues'] = slistValues
    col['isNullable'] = True
    col['tableFK'] = ''
    #print('table ', table_info)
    table_info['columns'][col['name']] = col



def extract_manifest_data(manifest_path, manifest_data):    
    manifest = {}
    for entity in manifest_data['entities']:
        #entity_path = os.path.join(base_path, entity['entityPath'])                    
        #entity_path = base_path + '/' + entity['entityPath']
        ll = entity['entityPath'].split('/')
        entity_path =  '/'.join( manifest_path.split('/')[0:-1] ) + '/' + ll[0]
        #print('manifest_path ',manifest_path,'entity_path ', entity_path)
        table_info = read_entity_attributes(entity_path)
        if 'name' in table_info:
            table_name = table_info['name']
            manifest[table_name] = {}
            manifest[table_name]['columns'] = table_info['columns']
            manifest[table_name]['description'] = table_info['description']

    # Relationships
    if 'relationships' in manifest_data:
        for  relation in manifest_data['relationships']:                    
            ll = relation["fromEntity"].split('/')[1]
            table_name = ll[-1:][0]
            if type(ll) is str:
                table_name = ll                     
            # print('relation ', relation, 'table_name ', table_name)
            if table_name in manifest:
                if not 'foreign_keys' in manifest[table_name]:
                    manifest[table_name]['foreign_keys'] =  {}                    
                    colFk_name = relation["fromEntityAttribute"] 
                    colFk= {'tableFK':relation["toEntity"], 'id': relation["toEntityAttribute"] }
                    manifest[table_name]['foreign_keys'][colFk_name] = colFk

                ll = relation["toEntity"].split('/')[1]
                table_name = ll[-1:][0]
                if table_name in manifest:
                    if not 'back_foreign_keys' in manifest[table_name]:
                        manifest[table_name]['back_foreign_keys'] =  {}
                    colFk_name = relation["toEntityAttribute"]                            
                    colFk= {'tableFK':relation["fromEntity"], 'id': relation["fromEntityAttribute"] }
                    manifest[table_name]['back_foreign_keys'][colFk_name] = colFk                   

    return manifest                    


def read_manifest_entities(manifest_path, base_path):
    """
    Recursively reads a manifest file to extract and print entities.
    If the manifest contains sub-manifests, it recursively reads them as well.
    """    
    manifest = {}
    try:
        with open(manifest_path, 'r') as file:
            manifest_data = json.load(file)
            manifest_name = manifest_data.get('manifestName')
            #print(f"manifest_name: {manifest_name}")
                          
            # Direct entities in the manifest
            if 'entities' in manifest_data:
                #manifest[manifest_name] = extract_manifest_data(manifest_path, manifest_data)
                manifest = extract_manifest_data(manifest_path, manifest_data)

            # Sub-manifests
            if 'subManifests' in manifest_data:
                #print( f'manifest_path:{manifest_path} - base_path:{base_path}' )    
                base_path = base_path + '/' + manifest_name
                for sub_manifest in manifest_data['subManifests']:
                    #sub_manifest_path = os.path.join(base_path, sub_manifest['definition'])
                    sub_manifest_name = sub_manifest['manifestName']
                    definition = sub_manifest['definition']
                    sub_manifest_path = base_path + '/' + definition

                    print(f'manifest_path:{manifest_path} \nsub_manifest_name: {sub_manifest_name} \nsub_manifest_path:{sub_manifest_path} \n' )                                                            
                    tmp = read_manifest_entities(  sub_manifest_path, base_path)
                    manifest[sub_manifest_name] = tmp
                    ii = 0
                    
    except FileNotFoundError:
        raise Exception(f"Error: Manifest file {manifest_path} not found. Base path {base_path}")
    
    return manifest 
    



def genDoc(manifest):    
    dftab = pd.DataFrame(columns = ['table','column','isnullable','dataType','tableFK', 'ListPossibleValues', 'description'])
    with open('createdb.sql', 'w') as file:
        # First we create a pandas dataframe contining info of table and columns         
        ii= 0 
        for table in manifest:     
            stable = table['name']      
            file.write(f"# Table Description: {table['description']}\n")
            dcol = {'table':stable,'column':table['description']}
            dftab.loc[len(dftab.index)] = dcol
            print('Percentage: ', 100*ii/len(manifest))            
            ii = ii + 1
            for col in table['columns']:
                dcol = {'table':stable,'column':col['name'], 'isnullable':col['isNullable'],'description':col['description']}
                dcol['tableFK'] = col['tableFK']                 
                if  col['tableFK'] != '':   
                    dcol['column'] = col['colFK']   

                #sdataType = col['dataType']
                dcol['dataType'] = col['dataType']
                dcol['ListPossibleValues'] = col['listValues']
                dftab.loc[len(dftab.index)] = dcol
                
    return dftab



def genScriptDB(manifest):
    with open('dictionary.txt', 'w') as file:                
        for table in manifest:
            file.write(f"# Table Description: {table['description']}\n")
            ss = f"Create table {table['name']} (\n"
            for col in table['columns']:
                sdataType = col['dataType']
                if type(col['dataType']) is dict:
                    sdataType = col['dataType']['dataTypeReference'] + "("
                    #print(f"# Table Description: {table['description']}\n, ColName {col['name']}", col['dataType']['appliedTraits'][0])
                    Values = col['dataType']['appliedTraits'][0]['arguments'][0]['entityReference']['constantValues']
                    for value in Values:
                        sdataType = sdataType + value[1] + ","
                    sdataType = sdataType[0:-1]
                    sdataType = sdataType + ")"    

                if col['isNullable']:
                  ss = ss + f"{col['name']} {sdataType},\n"
                else:
                  ss = ss + f"{col['name']} {sdataType} not null,\n" 
            ss = ss[0:-2]
            ss = ss + ");\n\n\n"
            print(ss)      
            file.write(ss) 



def main():
    #main_manifest_path = r'C:/CDM/schemaDocuments/Retail/RetailModel.manifest.cdm.json'    
    #main_manifest_path = r'C:/CDM/schemaDocuments/FinancialServices/FinancialServices.manifest.cdm.json'
    #main_manifest_path = r'C:/CDM/schemaDocuments/core/core.manifest.cdm.json'

    #main_manifest_path = r'C:/CDM/schemaDocuments/core/operationsCommon/Entities/Finance/Finance.manifest.cdm.json'
    #main_manifest_path = r'C:/CDM/schemaDocuments/core/operationsCommon/Entities/SupplyChain/SupplyChain.manifest.cdm.json'  
    #main_manifest_path = r'C:/CDM/schemaDocuments/core/operationsCommon/Entities/System/System.manifest.cdm.json'  
    #main_manifest_path = r'C:/CDM/schemaDocuments/core/operationsCommon/Entities/Common/common.manifest.cdm.json'  
    #main_manifest_path = r'C:/CDM/schemaDocuments/core/operationsCommon/Entities/Commerce/Commerce.manifest.cdm.json'  
    #main_manifest_path = r'C:/CDM/schemaDocuments/core/operationsCommon/Entities/humanresources/humanresources.manifest.cdm.json'
    #main_manifest_path = r'C:/CDM/schemaDocuments/core/operationsCommon/Entities/professionalservices/professionalservices.manifest.cdm.json'
    main_manifest_path = r'C:/CDM/schemaDocuments/core/operationsCommon/Entities/Entities.manifest.cdm.json'
    main_manifest_path = r'C:/CDM/schemaDocuments/core/operationsCommon/Tables/Tables.manifest.cdm.json'
    base_path = '/'.join(main_manifest_path.split('/')[0:-2])
    manifest = read_manifest_entities(main_manifest_path, base_path)

    # File path to save JSON data
    file_path = "data.json"

    # Save dictionary to JSON file
    with open(file_path, 'w') as json_file:
       json.dump(manifest, json_file)

    print("Dictionary saved to JSON file successfully.")

    #dftab = genDoc()
    #dftab.to_excel('docDB.xlsx')

if __name__ == "__main__":
    main()
