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
  *    Created Date   :    09/20/2022
  *
  *    Version        :    V1.0
  *
  *    Revisison Log  :    V1.0 - Created
  *
  *    Coverage       :    100%
**/
@isTest(seeAllData = false)
private class Test_CalculateCaseOrigin {
    //Method for inserting Account and Case data for testing
    @testSetup
    static void testSetupData(){
        
        //Creating account list for inserting new account record
        List<Account> accList = new List<Account>();
        for(Integer i = 1;i<=3; i++){
            accList.add(new Account(Name = 'Test' + i));
        }
        if(!accList.isEmpty())	
        	insert accList;
        
        //Creating Case list for inserting new Case record
        List<Case> caseList = new List<Case>();
        for(Account acc: accList){
            for(Integer i = 1;i<=2;i++){
                caseList.add(new Case(Status = 'New', Origin = 'Phone', AccountId = acc.Id));
                caseList.add(new Case(Status = 'New', Origin = 'Web', AccountId = acc.Id));
                caseList.add(new Case(Status = 'New', Origin = 'Email', AccountId = acc.Id));
            }
        }
        
        if(!caseList.isEmpty())
        insert caseList;
	}
    //TestMethod
    @isTest
    static void claculateCases(){
        
        //Query to get Id of inserted record
        List<Account> accList = [SELECT Id FROM Account];
        List<Id> accIds = new List<Id>();
        for(Account acc : accList){
            accIds.add(acc.Id);
        }
        
        //Perform the test
        Test.startTest();
        CalculateCaseOrigin.countBasedOnOrigin(accIds);
        Test.stopTest();  
        
        //Query for insertrd data for result
        List<Account> accountList = [SELECT Cases_Through_Email__c,Cases_Through_Phone__c, Cases_Through_Web__c
                                       FROM Account WHERE Id IN :accIds];
        //Check the result
        System.assertEquals(2, accountList[0].Cases_Through_Email__c);
    }
}