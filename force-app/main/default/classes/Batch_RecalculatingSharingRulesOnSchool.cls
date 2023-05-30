public without sharing class Batch_RecalculatingSharingRulesOnSchool implements Database.Batchable<Sobject>{
    
    public String query;
    public String log;
    @TestVisible static Integer emailLimits;
    
    public Batch_RecalculatingSharingRulesOnSchool(){
        query = 'SELECT ID FROM School__c';
        log = '';
    }
    
    //Start Method
    public Database.QueryLocator start(Database.BatchableContext bc){
        
        return Database.getQueryLocator(query);
    }
    
    // The executeBatch method is called for each chunk of records returned from start.
    public void execute(Database.BatchableContext bc, List<School__c> listOfSchools){
        
        System.debug('listOfSchools' + listOfSchools);	
         log = utilities.getErrorLogMessageForRecords(listOfSchools);
    }
    
    // The finish method is called at the end of a sharing recalculation.
    public void finish(Database.BatchableContext bc){
          
        	// Send an email to the Apex job's submitter notifying of job completion.
            List<Messaging.Email> emailList = new List<Messaging.Email>();
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            
            mail.setToAddresses(new List<String> {'shailendra.sharma@fexle.com'});
            mail.setSubject('Apex Sharing Recalculation Completed.');
            mail.setPlainTextBody('The Apex sharing recalculation finished processing');
            emailList.add(mail);
            Messaging.sendEmail(emailList);
            Batch_RecalculatingSharingRulesOnSchool.emailLimits =  Limits.getEmailInvocations();
    }
}