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
*	Purpose         :   Test Class for "SendStudentsAttendance" batch class
*
*	Created By      :   Shailendra Sharma
*
*	Created Date    :   29/11/2022
*
*	Current Version :   v1.0
*
*	Revision Log    :   V_1.0 Created - Shailendra Sharma - 29/11/2022
*	
*	Coverage      	:    100%
*/

@isTest(seeAllData = false)
private without sharing class Test_Batch_CreateWebServiceLogsViaSOAP {
	
     // Method to create students data
   /* @TestSetup
    static void testSetUpData(){
        
        List<Student__c> students = TestDataFactory.createListOfStudentsTestDataWithTriggerEnabled();
        System.assertEquals(5, students.size());
        
    }*/
    
    //Method to test Batch on student
   @isTest(seeAllData = false)
    private static void testExecutionOfBstch_CreateWebServiceLogsViaSOAP(){
        
        //List<School__c> schools = [SELECT Id FROM School__c];
        
        //Perform the test
        Test.startTest();
        
        Batch_CreateWebServiceLogsViaSOAP bc = new Batch_CreateWebServiceLogsViaSOAP();
        bc.query = 'SELECT Id, Name FROM School__c lImit 2';  
        //String cronID = System.scheduleBatch(bC,'WebServiveRecord', 2);
        String cronID = Database.executeBatch(bc);
        //Stpo test here
        Test.stopTest();
        
        /*System.assertEquals(1, Batch_CreateWebServiceLogsViaSOAP.emailLimits);
        AsyncApexJob aaj = [SELECT Id, Status
                    FROM AsyncApexJob WHERE ID = :cronID ];*/
        
        System.debug('AsyncApexJob' +cronID);
       // System.assertEquals('Completed', aaj.Status);
        
    }
}