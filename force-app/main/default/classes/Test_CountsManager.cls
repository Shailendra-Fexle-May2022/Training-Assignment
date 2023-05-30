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
  *    Created Date   :    10/09/2022
  *
  *    Version        :    V1.0
  *
  *    Revisison Log  :    V1.0 - Created
  *					   	
  *    Coverage       :    100%
**/

@isTest(seeAllData = false)
private class Test_CountsManager {
    //Method for inserting school, classes and students data for testing
	@testSetup
    static void testSetupData(){
        
        List<Student__c> students = TestDataFactory.createListOfStudentsTestData();
        System.assertEquals(5, students.size());
        System.debug('@@@school' +students);
    }
    
    //testMethod to test No of students counton School   
    @isTest(seeAllData = false)
	private static void testCountsOfStudents(){
   		
        //Query for inserted school Id
        List<School__c> school = [SELECT Id,Name, No_of_Students__c,No_of_Classes__c FROM School__c];
        System.debug('@@@school' +school);
        
        //Perform the test
       	Test.startTest();
        school[0].Name = 'KCZ';
        update school;

        CountsManager1.updateNoOfStudentsDetails('KCZ');
        
        //Query of insertrd data for result
        List<School__c> listOfSchool = [SELECT Id, No_of_Students__c, No_of_Classes__c FROM School__c /*WHERE No_of_Classes__c = 2*/];
        System.debug('@@@listOfSchool' +listOfSchool);
        
       // Check the result
       	System.assertEquals(5, listOfSchool[0].No_of_Students__c);
        
        //Stop test here
        Test.stopTest();
    }
    
    //testMethod to test No of students counton School     
    @isTest(seeAllData = false)
	private static void testCountsOfClasses(){
   		
        //Query for inserted school Id
        List<School__c> school = [SELECT Id,Name, No_of_Students__c,No_of_Classes__c FROM School__c];
        System.debug('@@@school' +school);
        
        //Perform the test
       	Test.startTest();

      	CountsManager1.updateNoOfClassesDetails(school[0].Id);
        
        //Query of insertrd data for result
        List<School__c> listOfSchool = [SELECT Id, No_of_Students__c, No_of_Classes__c FROM School__c /*WHERE No_of_Classes__c = 2*/];
        System.debug('@@@listOfSchool' +listOfSchool);
        
       // Check the result
        System.assertEquals(2, listOfSchool[0].No_of_Classes__c);
        
        //Stop test here
        Test.stopTest();
    }
}