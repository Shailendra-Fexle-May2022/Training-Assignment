/**
*
*  Purpose          :   Controller class for "CreateUpdateCustomMetadataType" VF page
*
*  Created Date     :   11/16/2022
*
*  Created By       :   Abhinav Sharma
*
*  Revision Logs    :   V_1.0 - Created
*
**/
public with sharing class CreateUpdateCustomMetadataTypeController 
{
    public HTTPCalloutConfiguration__mdt httpCalloutConfigRecord {get; set;}
    public String DeployId {get; set;}    
    public String DeployResult {get; set;}
    
    public PageReference init() 
    {
        
        List<HTTPCalloutConfiguration__mdt> httpCalloutConfigRecords = [SELECT Id, DeveloperName, Label, Body__c, CertificateName__c, Endpoint__c,
                                                                        HeaderParameters__c, Method__c, URLParameters__c
                                                                        FROM HTTPCalloutConfiguration__mdt
                                                                        where DeveloperName =: Constants.HTTP_CALLOUT_NAME_TEST_METADATA];
        if(httpCalloutConfigRecords.size() > 0) 
        {
            httpCalloutConfigRecord = httpCalloutConfigRecords[0];
        }    
        return null;
    }
    
   public PageReference save() 
    {
        DeployId = 
            CustomMetadata.Operations
            .callback
            (
                MetadataDeployment__e.getSObjectType(),
                MetadataDeployment__e.DeploymentId__c, 
                MetadataDeployment__e.Result__c
            )
            .enqueueUpsertRecords
            (
                new List<SObject> { httpCalloutConfigRecord }
            )
            .deployId;
        
        return null;
    }
    
    public PageReference saveHandler() 
    {
		DeployId = null;                
        CustomMetadata.SaveRecordResult result = (CustomMetadata.SaveRecordResult) JSON.deserialize(DeployResult, CustomMetadata.SaveRecordResult.class);
        if(!result.success) 
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, result.message));            
        }            
        return null;
    }
}