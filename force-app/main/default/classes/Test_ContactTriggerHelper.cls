/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */

 /**
  *    Description    :    This Test class check the numBber of Contact on Account.
  *  
  *    Created By     :    Shailendra Sharma
  *
  *    Created Date   :    22/09/2022
  *
  *    Version        :    V1.0
  *
  *    Revisison Log  :    V1.0 - Created
  *					   	
  *    Coverage       :    100%
**/

@isTest(seeAllData = false)
public class Test_ContactTriggerHelper {
    
	//Method for inserting contact and Account data for testing
	@istest
    static void testSetupData(){
		
        //Creating account list for inserting new account record
        Account accObj = new Account(Name = 'Count Testing', Type = 'Prospect', Rating = 'Hot');
        insert accObj; 
        System.debug(accObj);
        
        
        //Creating contact list for inserting new contact record
        List<Contact> contactList = new List<Contact>();
        
        contactList.add(new Contact(FirstName = 'Count', LastName = 'Demo-1', AccountId = accObj.Id));
        contactList.add(new Contact(FirstName = 'Count', LastName = 'Demo-2', AccountId = accObj.Id));
        contactList.add(new Contact(FirstName = 'Count', LastName = 'Demo-3', AccountId = accObj.Id));
   
        insert contactList;
        System.debug(contactList); 
        
   	 	Account acc = [SELECT Id, No_of_Contacts__c FROM Account WHERE Id =:accObj.Id];
        System.assertEquals(contactList.size(), acc.No_of_Contacts__c);
        
        Account accountObj = new Account(Name = 'Count Testing-1', Type = 'Other', Rating = 'Cold');
        insert accountObj;
     	
        List<Contact> conList = [SELECT Name FROM Contact];
        System.debug(conList);
        
        conList[0].AccountId = accountObj.Id;
        update conList;
        System.debug(conList);
   		
        //Query for inserted school Id
        Account acc1 = [SELECT Id, No_of_Contacts__c FROM Account WHERE Id =:accountObj.Id];
        
        //Check the result
        //
        System.assertEquals(1, acc1.No_of_Contacts__c);
            
    }
}