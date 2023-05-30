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
*	Purpose         :   Test Class for RecalculatingSharingRulesOnSchool batch class
*
*	Created By      :   Shailendra Sharma
*
*	Created Date    :   7/11/2022
*
*	Current Version :   v1.0
*
*	Revision Log    :   V_1.0 Created - Shailendra Sharma - 7/11/2022
*	
*	Coverage      	:    100%
*/

@isTest(seeAllData = false)
private without sharing class Test_Batch_RecalculatingSharingRules {
    
    // Method to create the data
    @TestSetup
    static void testSetUpData(){
        
        List<Student__c> students = TestDataFactory.createListOfStudentsTestDataWithTriggerEnabled();
        
        List<User> users = TestDataFactory.createListOfUsersTestData();
        System.assertEquals(2, users.size());
        System.debug('users'+users);
    }
    
    //Method to test Apex Sharing Rule Based on No of Teachers on school
    @isTest(seeAllData = false)
    private static void testOfApexSharingCalculations(){
        
        //Start test from here
        List<School__c> schools = [SELECT ID, No_of_Students__c FROM School__c];
        System.assertEquals(5, schools.size());
        
        schools[0].No_of_Teachers__c = 15;
        schools[1].No_of_Teachers__c = null;
        update schools;

        //Start test from here
        Test.startTest();
        
        Batch_RecalculatingSharingRulesOnSchool batchRecalculate = new Batch_RecalculatingSharingRulesOnSchool();
        String jobId = Database.executeBatch(batchRecalculate);
        
        //Stop test here
        Test.stopTest();
        
        // Get the Apex job and verify there are no errors.
        AsyncApexJob aaj = [Select JobType, TotalJobItems, JobItemsProcessed, Status, 
                            CompletedDate, CreatedDate, NumberOfErrors 
                            from AsyncApexJob where Id = :jobId];
        System.assertEquals(0, aaj.NumberOfErrors);
        
        // This query returns jobs and related sharing records that were inserted       
        // by the batch job's execute method.     
        List<School__Share> schooljobs = [SELECT Id, ParentId, UserOrGroupId, AccessLevel, RowCause FROM School__Share 
                                          WHERE RowCause = :Schema.School__Share.rowCause.Apex_Sharing__c]; 
        
        // One Apex managed sharing records should exist for each job
        System.assert(schooljobs.size() == 1);
        System.assertEquals(schooljobs[0].AccessLevel,'Read');
        System.assertEquals(1, Batch_RecalculatingSharingRulesOnSchool.emailLimits);
    }
}