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
  *    Description    :    This Test class check the number of students and numner of classes on School.
  *  
  *    Created By     :    Shailendra Sharma
  *
  *    Created Date   :    09/19/2022
  *
  *    Version        :    V1.0
  *
  *    Revisison Log  :    V1.0 - Created
  *
  *    Coverage       :    100%
**/
@isTest(seeAllData = false)
private class Test_ContactCalculator {
    //Method for inserting Account and Contact data for testing
	@testSetup
    static void testSetupData(){
        
        //Creating account list for inserting new account record
        List<Account> newAccountList = new List<Account>();
        for(Integer i = 1; i<=2; i++){
            newAccountList.add(new Account(Name = 'Test' + i, AccountNumber = '5255754754'));
        }
        insert newAccountList;
        
        //Creating contact list for inserting new contact record
        List<Contact> newContactList =new List<Contact>();
        
        for(Account  acc : newAccountList){
            newContactList.add(new Contact(FirstName = 'Test', LastName = acc.Name, AccountId = acc.Id)); 
        }
        insert newContactList;
    }
    //TestMethod 
    @isTest
    static void contactCountMethod(){
        
        //Query to get Id of inserted record
        List<Account> accList = [SELECT Id, Name FROM Account WHERE Name LIKE 'Test%'];
        List<Id> accIds = new List<Id>(); 
        
        for(Account acc : accList){
            accIds.add(acc.Id);
        }
       
        //Perform the test
        Test.startTest(); 
        ContactCalulator.countContact(accIds);                               
        Test.stopTest();  
        
        //Query for insertrd data for result
       	List<Account> accountList = [SELECT Id, No_of_Contacts__c FROM Account];
        
        //Check the result
        System.assertEquals(1,accountList[0].No_of_Contacts__c);                        
    }
}