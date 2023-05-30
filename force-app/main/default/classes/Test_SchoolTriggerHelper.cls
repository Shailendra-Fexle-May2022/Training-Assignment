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
*	Purpose         :   Test Class for "SchoolTriggerHelper" apex class
*
*	Created By      :   Shailendra Sharma
*
*	Created Date    :   15/10/2022
*
*	Current Version :   v1.0
*
*	Revision Log    :   V_1.0 Created - Shailendra Sharma - 15/10/2022
*	
*	Coverage      	:    100%
*/

@isTest(seeAllData = false)
private without sharing class Test_SchoolTriggerHelper {
	
    // Method to create the data
    @TestSetup
    static void testSetUpData(){
        
        List<Student__c> students = TestDataFactory.createListOfStudentsTestDataWithTriggerEnabled();
        
        List<User> users = TestDataFactory.createListOfUsersTestData();
        System.assertEquals(2, users.size());
        System.debug('users'+users);
    }

    //Method to test NoOfClasses on school
    @isTest(seeAllData = false)
    private static void testNoOfClassesDetails() {

        List<School__c> schools = [SELECT ID, No_of_Classes__c, No_of_Students__c FROM School__c];
        System.assertEquals(5, schools.size());
        
        schools = [SELECT ID, No_of_Classes__c FROM School__c WHERE No_of_Classes__c = 2];
        System.assertEquals(1, schools.size());
        
        //Start test from here
        Test.startTest();
        
        // Update no of Classes  on school
        schools[0].No_of_Classes__c = 4;
        update schools;
        
        //Stop test here
        Test.stopTest(); 
        
        schools = [SELECT ID, No_of_Classes__c FROM School__c WHERE No_of_Classes__c = 2];
        System.assertEquals(1, schools.size());
        System.assertEquals(2, schools[0].No_of_Classes__c);
        
       
    }
    
     //Method to test NoOfStudents on school
     @isTest(seeAllData = false)
    private static void testNoOfStudentsDetails() {

        List<School__c> schools = [SELECT ID, No_of_Classes__c, No_of_Students__c FROM School__c];
        System.assertEquals(5, schools.size());
        
        schools = [SELECT ID, No_of_Students__c FROM School__c WHERE No_of_Students__c = 5];
        System.assertEquals(1, schools.size());
        System.assertEquals(5, schools[0].No_of_Students__c);
   
        //Start test from here
        Test.startTest();
        
        // Update no of Students  on school
        schools[0].No_of_Students__c = 0;
        update schools;
        
        schools = [SELECT ID, No_of_Students__c FROM School__c WHERE No_of_Students__c = 5];
        System.assertEquals(1, schools.size());
        System.assertEquals(5, schools[0].No_of_Students__c);
        
        //Stop test here
        Test.stopTest();      
    }
    
   //Method to test Apex Sharing Rule Based on No of Teachers on school
    @isTest(seeAllData = false)
    private static void testOfApexSharingCalculations(){
      	
        //Start test from here
        Test.startTest(); 
        
        List<School__c> schools = [SELECT ID, No_of_Teachers__c FROM School__c];
        System.assertEquals(5, schools.size());
        
        // Update no of Tescher on school
       	schools[0].No_of_Teachers__c = 15;
        update schools;
        
        // Query job sharing records.
        List<School__Share> listOfEligibleSharedSchoolRecords = [SELECT Id, UserOrGroupId, AccessLevel, RowCause 
                                    FROM School__share 
                                    WHERE ParentId IN :schools
                                    AND RowCause = 'Apex_Sharing__c'];
        
        // Test for only one Apex Sharing on job.
       	System.assertEquals(1, listOfEligibleSharedSchoolRecords.size());
		
        // Update no of Tescher on school
        schools[0].No_of_Teachers__c = 7;
        schools[1].No_of_Teachers__c = null;
        update schools;
             
        // Query job sharing records.
        List<School__Share> listOfEligibleDeletedSharedSchoolRecords = [SELECT Id, UserOrGroupId, AccessLevel, RowCause 
                                    FROM School__share 
                                    WHERE ParentId IN :schools AND RowCause = 'Apex_Sharing__c'
                                   	];
        
        //Test for only one Apex Sharing on job.
       	System.assertEquals(0, listOfEligibleDeletedSharedSchoolRecords.size());
        
        //Stop test here
        Test.stopTest();   
    }
}