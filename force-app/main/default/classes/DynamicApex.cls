/*
 *  Purpose          :    Dynamic Apex class is showing different use caeses. 
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    30/11/2022
 *  Revision Logs    :    V_1.0 - Created 
 */
public without sharing class DynamicApex {

    //Method to get All Object API Names With Their Labels
    public static void getSobjectAPINameToLable(){  
        
        // * Initializing Map
        Map<String, String> objectAPINameToLabelMap = new Map<String, String>();
        
        // * Getting all objects metadata
        Map<String, Schema.SObjectType> globalDescribeMap = Schema.getGlobalDescribe();
        
        // * Processing each sObject one by one
        for(String globalDescribeKey : globalDescribeMap.keySet()) {
            
            // * Getting the current sObject type
            Schema.SObjectType currentSObjectType = globalDescribeMap.get(globalDescribeKey);
            
            // * Getting the current sObject description result from sObject Type
            Schema.DescribeSObjectResult currentSObjectResult = currentSObjectType.getDescribe();
            
            // * Getting the API name and value of current sObject and adding it to the map
            objectAPINameToLabelMap.put(currentSObjectResult.getName(), currentSObjectResult.getLabel());
        }
        
        // * Processing each entry of the map one by one and displaying sObject API Name and Label
        for(String objectAPIName : objectAPINameToLabelMap.keySet()) 
            System.debug(objectAPIName + ' --> ' + objectAPINameToLabelMap.get(objectAPIName));
    } 
    
    // /Method to get All The Fields For An Given Object
    public static void getSobjectFiledName(){
        
        // * Initializing set of field names
        Set<String> accountFieldNames = new Set<String>();
        
        // * Getting the account sObject Type object
        Schema.SObjectType accountObjectType = Class__c.getSObjectType();
        
        // * Getting the sObject describe result for account object (metadata)
        Schema.DescribeSObjectResult accountSObjectResult = accountObjectType.getDescribe();
        
        // * Getting the map of account fields
        Map<String, Schema.SObjectField> accountFieldsMap = accountSObjectResult.fields.getMap();
        
        // * Processing each account field one by one
        for(String accountFieldKey : accountFieldsMap.keySet()) {
            
            // * Getting the current sobject field
            Schema.SObjectField accountField = accountFieldsMap.get(accountFieldKey);
            
            // * Getting the current sobject field description (field metadata) from sobject field
            Schema.DescribeFieldResult accountFieldResult = accountField.getDescribe();
            
            // * Extracting the api name of the field from field description and adding it to the account field names set
            accountFieldNames.add(accountFieldResult.getName());
        }
        
        // * Processing each entry of the account field names one by one and displaying them
        for(String accountFieldName : accountFieldNames) {
            System.debug(accountFieldName);
        }
    }
    
    //This method is used to return all accessible fields for an sObject
    public static void getSObjectFields(String sObjectName){
        
        // * Initializing fieldNames set
        Set<String> fieldNames = new Set<String>();
        
        // * Getting metadata of all sObjects
        Map<String, Schema.SObjectType> sObjectMap = Schema.getGlobalDescribe();
        
        // * Getting the reference to current sObject
        Schema.SObjectType sObjectTypeInstance = sObjectMap.get(sObjectName);
        
        if(sObjectTypeInstance!=null) {
            
            // * Getting Fields for current sObject
            Map<String, Schema.SObjectField> fieldMap = sObjectTypeInstance.getDescribe().fields.getMap();
            
            // * Checking each field one by one, if it's accessible, adding it's name to fieldNames set
            for(Schema.SObjectField field: fieldMap.values()) {
                
                Schema.DescribeFieldResult fieldResult = field.getDescribe();
                
                if(fieldResult.isAccessible()) 
                    
                    fieldNames.add(fieldResult.getName());             
            }
            
            for(String fieldName : fieldNames) {
                System.debug(fieldName);
            }
        }
        
        if(fieldNames.size()> 0)
            ApexUtil.getSOQL(fieldNames);
        
    }
    
    //This method is used to return SOQL query consisting of
    //all fields for an object that are accessible by the current user
    public static void  getSOQL(Set<String> fieldNames){
        
        // * Getting the field names using the object name
        Set<String> setOfFields = fieldNames;
        
        // * Forming the SOQL query
        String query = 'SELECT ';
        for(String fieldName : fieldNames) {
            
            query += fieldName + ', ';
        }
        
        // * Removing last , from the SOQL query string
        query = query.substring(0, query.lastIndexOf(','));
        
        // * Adding the object name to the SOQL
        query += ' FROM ' + ' School__c ';
        System.debug(query);
    }
    
    //This method is going to return the picklist field values and the associated label 
    //for an object and a field which are passed in as parameters
    
    public static void getPicklistValuesMap(String objectAPIName, String fieldAPIName){
        
        // * Initializing picklist field map to story value and label of picklist entries
        Map<String, String> picklistFieldMap = new Map<String, String>();
        
        // * Getting the field result for the current field
        Schema.DescribeFieldResult fieldResult = Schema.getGlobalDescribe().get(objectAPIName).getDescribe().fields.getMap().get(fieldAPIName).getDescribe();
        
        // * Checking if the field type is a picklist
        if(fieldResult.getType() == Schema.DisplayType.PICKLIST){
            
            // * Getting all picklist entries
            List<Schema.PicklistEntry> picklistEntries = fieldResult.getPickListValues();
            
            // * Looping over all picklist entries one by one
            for(Schema.PicklistEntry picklistEntry : picklistEntries) {
                
                // * If the picklist entry is active, getting the label and value and putting those in map
                if(picklistEntry.isActive())
                    
                    picklistFieldMap.put(picklistEntry.getValue(), picklistEntry.getLabel());  
                
                System.debug('picklistFieldMap' +picklistFieldMap.values());
            } 
        }
    }
    
    // Description: This method is going to return a map of record type name with it's id
    public static void getRecordTypeIdsByName(String objectAPIName){
        
        // * Initializing map
        Map<String, Id> recordTypesMap = new Map<String, Id>();
        
        // * Getting the object result
        Schema.DescribeSObjectResult objectResult = Schema.getGlobalDescribe().get(objectAPIName).getDescribe();
        
        if(objectResult != null){
            
            // * Getting the record type infos list
            List<Schema.RecordTypeInfo> recordTypeInfos = objectResult.getRecordTypeInfos();
            
            // * Processing each record type one by one
            for(Schema.RecordTypeInfo recordTypeInfo : recordTypeInfos) {
                
                // * If the current record type is active and avaialable to the logged in user, adding it's name and id to the map
                if(recordTypeInfo.isActive() && recordTypeInfo.isAvailable())
                    
                    recordTypesMap.put(recordTypeInfo.getName(), recordTypeInfo.getRecordTypeId()); 
                
                System.debug( recordTypesMap.keySet() + ' ----> ' + recordTypesMap.values());
                System.debug('Developer Name :' + recordTypeInfo.getDeveloperName());
                
            }  
        }
    }
}