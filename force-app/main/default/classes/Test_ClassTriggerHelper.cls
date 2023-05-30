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
*	Purpose         :   Test Class for "ClassTriggerHelper" apex class
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
public without sharing class Test_ClassTriggerHelper {
    
    // Method to create students data
    @TestSetup
    static void testSetUpData(){
        
        List<Student__c> students = TestDataFactory.createListOfStudentsTestDataWithTriggerEnabled();
        System.assertEquals(5, students.size());
        
    }
    
    //Method to test updted NoOfClasses on school
    @isTest(seeAllData = false)
    private static void testNoOfClassesDetails() {
        
        List<School__c> schools = [SELECT ID, No_of_Classes__c FROM School__c];
        System.assertEquals(5, schools.size());
        
        //Perform the test
        Test.startTest();
        
        schools = [SELECT ID, No_of_Classes__c FROM School__c WHERE No_of_Classes__c = 2];
        System.assertEquals(1, schools.size());
        System.assertEquals(2, schools[0].No_of_Classes__c);
        
        List<Class__c> classes = [SELECT ID, School__c FROM Class__c WHERE School__c = :schools[0].Id];
        
        List<School__c> schoolResult = [SELECT ID, No_of_Classes__c FROM School__c WHERE No_of_Classes__c = 3];
        System.assertEquals(1, schoolResult.size());
        System.assertEquals(3, schoolResult[0].No_of_Classes__c);
        
        //Move student from one school to another school
        classes[0].School__c = schoolResult[0].Id;
        update classes;
        
        List<School__c> school = [SELECT ID, No_of_Classes__c FROM School__c WHERE No_of_Classes__c = 2];
        System.assertEquals(0, school.size());

        
        //Query for school to get updated classes details
        List<School__c> schoolUpdateResult = [SELECT ID, No_of_Classes__c FROM School__c WHERE No_of_Classes__c = 4];
        System.assertEquals(1, schoolUpdateResult.size());
        System.assertEquals(4, schoolUpdateResult[0].No_of_Classes__c); 
                
        //Stop test here
        Test.stopTest();
    }  
    
    //Method to test updated school on student
    @isTest(seeAllData = false)
    private static void testUpdatedSchoolOnStudents(){
        
        List<School__c> schools = [SELECT ID, No_of_Classes__c, No_of_Students__c FROM School__c];
        System.assertEquals(5, schools.size());
        
        //Perform the test
        Test.startTest();
        
        schools = [SELECT ID, No_of_Classes__c, No_of_Students__c FROM School__c WHERE No_of_Classes__c = 2];
        System.assertEquals(1, schools.size());
        System.assertEquals(2, schools[0].No_of_Classes__c);
        System.assertEquals(5, schools[0].No_of_Students__c);
        
        List<Class__c> classes = [SELECT ID, Number_of_Students__c, School__c FROM Class__c WHERE School__c = :schools[0].Id];
        System.assertEquals(2, classes[0].Number_of_Students__c);
        System.debug('CLASS'+classes);
        
        List<School__c> schoolResult = [SELECT ID, No_of_Classes__c, No_of_Students__c FROM School__c WHERE No_of_Classes__c = 3];
        System.assertEquals(1, schoolResult.size());
        System.assertEquals(3, schoolResult[0].No_of_Classes__c);
        System.assertEquals(0, schoolResult[0].No_of_Students__c);
        
        //Move class from one school to another school
        classes[0].School__c = schoolResult[0].Id;
        update classes;
        
        List<School__c> school = [SELECT ID, No_of_Classes__c FROM School__c WHERE No_of_Classes__c = 2];
        System.assertEquals(0, school.size());
        
        //Query for school to get updated classes details
        List<School__c> schoolUpdateResult = [SELECT ID, No_of_Classes__c, No_of_Students__c FROM School__c WHERE No_of_Classes__c = 4];
        System.assertEquals(1, schoolUpdateResult.size());
        System.assertEquals(4, schoolUpdateResult[0].No_of_Classes__c);
        System.assertEquals(2, schoolUpdateResult[0].No_of_Students__c); 
        
        //Stop test here
        Test.stopTest();
    }
}