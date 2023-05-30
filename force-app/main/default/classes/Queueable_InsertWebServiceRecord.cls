/**
*
*  Purpose          :   Chaining Queueable Job Class for inserting Web Service Record.
*
*  Created Date     :   15/11/2022
*
*  Created By       :   Shailendra Sharma
*
*  Revision Logs    :   V_1.0 - Created
*
**/
public without sharing class Queueable_InsertWebServiceRecord implements Queueable, Database.AllowsCallouts {
    
    public String response;
    
    public Queueable_InsertWebServiceRecord(String res){
        this.response = res;
    }
    
    public void execute(QueueableContext context){
        
        //Empty List to fill WebServiceLog record
        /*List<Web_Service_Log__c> listOfWebServiceLogtoBeInserted = new List<Web_Service_Log__c>();
        
        Web_Service_Log__c webServiceLog = new Web_Service_Log__c(); 
        
        webServiceLog.Response__c = response;
        webServiceLog.Status_Code__c = Constants.HTTP_CALLOUT_SUCCESS_CODE;
        webServiceLog.End_Point__c = System.Label.ENDPOINT_HEROKU_APP;
        
        // Add field values to empty list to insert record. 
        listOfWebServiceLogtoBeInserted.add(webServiceLog);
        
        if(!listOfWebServiceLogtoBeInserted.isEmpty())
            
            Utilities.BypassAllTriggers = true;
            insert listOfWebServiceLogtoBeInserted;
            Utilities.BypassAllTriggers = false;*/
    }
}