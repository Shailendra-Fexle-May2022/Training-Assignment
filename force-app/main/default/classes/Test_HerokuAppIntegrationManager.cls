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
*	Purpose         :   Test Class for "HerokuAppIntegrationManager" apex class
*
*	Created By      :   Shailendra Sharma
*
*	Created Date    :   09/11/2022
*
*	Current Version :   v1.0
*
*	Revision Log    :   V_1.0 Created - Shailendra Sharma - 09/11/2022
*	
*	Coverage      	:    100%
*/
@isTest(seeAllData = false)
public without sharing class Test_HerokuAppIntegrationManager {
	
    // Method to create the data
    @TestSetup
    static void testSetUpData(){
        
        List<Student__c> students = TestDataFactory.createListOfStudentsTestDataWithTriggerEnabled();
    }
    
	//Method to test Apex Sharing Rule Based on No of Teachers on school
    @isTest(seeAllData = false)
    private static void testOfUpadateHerokuAppDataOnUser(){
      	
        List<School__c> schools = [SELECT ID, No_of_Teachers__c FROM School__c];
        System.assertEquals(5, schools.size());
        
       	schools[0].No_of_Teachers__c = 15;
        schools[1].No_of_Teachers__c = 5;
        update schools;
        
        Set<Id> schoolIds = new Set<Id>{schools[0].Id};
        // Query job sharing records.
        List<School__Share> listOfEligibleSharedSchoolRecords = [SELECT Id, UserOrGroupId, AccessLevel, RowCause 
                                    FROM School__share 
                                    WHERE ParentId IN :schools
                                    AND RowCause = 'Apex_Sharing__c'];
        
        // Test for only one manual share on job.
       	System.assertEquals(1, listOfEligibleSharedSchoolRecords.size());
         
        
        Test.startTest();
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new Mock_HerokuAppIntegrationManager());
        
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        HerokuAppIntegrationManager.makeCalloutToHerokuAndUpdateUsers(schoolIds);
        
        Test.stopTest();
        
    	WebServiceLogsWrapper wrap = new WebServiceLogsWrapper();
        System.Assert(wrap != null);
        
        HttpRequest req = new HttpRequest();
        Mock_HerokuAppIntegrationManager mock = new Mock_HerokuAppIntegrationManager();
        HttpResponse response = mock.respond(req);
       
        // Verify that the response received contains fake values
        String contentType = response.getHeader('Content-Type');
        System.assert(contentType == 'application/json');
        
        String actualValue = response.getBody();
        System.debug(response.getBody());
        
        String expectedValue = '{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}';
        System.assertEquals(expectedValue, actualValue);
        System.assertEquals(200, response.getStatusCode()); 
    }
}