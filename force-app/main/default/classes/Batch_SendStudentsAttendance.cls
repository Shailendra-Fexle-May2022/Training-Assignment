/**
*
*  Purpose          :   Batch class to send email alert of those students parents whose attedance is less than 75%.
*
*  Created Date     :   19/10/2022
*
*  Created By       :   Shailendra Sharma
*
*  Revision Logs    :   V_1.0 - Created
*
**/
public without sharing class Batch_SendStudentsAttendance implements Database.Batchable<Sobject>,Database.Stateful{
	
    public List<String> status = new List<String>();
    public String query;
    @TestVisible static Integer emailLimits;
    
    //Start Method
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator(query);
    }
    
    //Execute Method
    public void execute(Database.BatchableContext bc, List<Student__c> listOfStudents){
        
       //Empty list of student for updating Email Sent field.
        List<Student__c> updatedListOfStudents = new List<Student__c>();
        
        for(Student__c stu: listOfStudents){
            stu.Email_Sent__c = True; 
            System.debug(stu.get('Attendance__c'));
            System.debug(stu.Name);
            status.add(String.valueOf(stu.get('Attendance__c')) +' ' + 'Student Name =>'+'  '+ stu.Name);
            updatedListOfStudents.add(stu);
        }
        
        update updatedListOfStudents;
    } 
    
    //Finish Method
    public void finish(Database.BatchableContext bc){
        
       // Send an email to the principal notifying of students attendance. 
       	List<Messaging.Email> emailList = new List<Messaging.Email>();
		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

	    mail.setToAddresses(new List<String> {'shailendra.sharma@fexle.com'});
		mail.setReplyTo('shailendra859@gmail.com');
		mail.setSenderDisplayName('Class Teacher');
		mail.setSubject('Total attendance of your Child up to this month.');
		mail.setPlainTextBody('Total attendance in percentage:' +status);
		emailList.add(mail);
		Messaging.sendEmail(emailList);
        Batch_SendStudentsAttendance.emailLimits =  Limits.getEmailInvocations();
    }
}