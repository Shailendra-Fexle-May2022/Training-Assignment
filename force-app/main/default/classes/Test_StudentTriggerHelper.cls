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
*	Purpose         :   Test Class for "StudentTriggerHelper" apex class
*
*	Created By      :   Shailendra Sharma
*
*	Created Date    :   16/10/2022
*
*	Current Version :   v1.0
*
*	Revision Log    :   V_1.0 Created - Shailendra Sharma - 16/10/2022
*	
*	Coverage      	:    100%
*/

@isTest(seeAllData = false)
private without sharing class Test_StudentTriggerHelper {
    
    // Test Setup Method to create students data
    @TestSetup
    static void testSetUpData(){
        List<Student__c> students = TestDataFactory.createListOfStudentsTestDataWithTriggerEnabled();
        System.assertEquals(5, students.size());
    }
    
    //Method to test NoOfStudents on school
    @isTest(seeAllData = false)
    private static void testNoOfStudentsDetails(){

        List<School__c> schools = [SELECT ID, No_of_Students__c FROM School__c];
        System.assertEquals(5, schools.size());
        
       //Perform the test
        Test.startTest();

        schools = [SELECT ID, No_of_Students__c FROM School__c WHERE No_of_Students__c = 5];
        System.assertEquals(1, schools.size());
        System.assertEquals(5, schools[0].No_of_Students__c);
       
        List<Student__c> student = [SELECT ID, School__c FROM Student__c WHERE School__c = :schools[0].Id];

        List<School__c> school = [SELECT ID, No_of_Students__c FROM School__c WHERE No_of_Students__c = 0];
        System.assertEquals(1, school.size());
        System.assertEquals(0, school[0].No_of_Students__c);
        
        //Move student from one school to another school
        student[0].School__c = school[0].Id;
        update student;

        //Query for school to get updated students details
        List<School__c> schoolUpdateResult = [SELECT ID, No_of_Students__c FROM School__c WHERE No_of_Students__c = 5];
        System.assertEquals(0, schoolUpdateResult.size());
      
        //Stop test here
		Test.stopTest();   
    }
    
    //Method to test NoOfStudents on class
    @isTest(seeAllData = false)
    private static void testToupdateStudentsCountOnClasses(){
        
        List<Class__c> classes = [SELECT ID, Number_of_Students__c FROM Class__c];
        System.assertEquals(5, classes.size());
        
        //Perform the test
        Test.startTest();
        
        classes = [SELECT ID, Number_of_Students__c FROM Class__c WHERE Number_of_Students__c = 2];
        System.assertEquals(2, classes.size());

        List<Student__c> student = [SELECT ID, Class__c FROM Student__c WHERE Class__c = :classes[0].Id];
        
        List<Class__c> classResult = [SELECT ID, Number_of_Students__c FROM Class__c WHERE Number_of_Students__c = 3];
        System.assertEquals(2, classResult.size());
        
        //Move student from one class to another class
        student[0].Class__c = classResult[0].Id;
        update student;
 
         //Query for class to get updated students details
        List<Class__c> classUpdateResult = [SELECT ID, Number_of_Students__c FROM Class__c WHERE Number_of_Students__c = 4];
        System.assertEquals(2, classUpdateResult.size());
		       
        //Stop test here
		Test.stopTest(); 
    }      
}