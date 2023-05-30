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
*	Created Date    :   19/10/2022
*
*	Current Version :   v1.0
*
*	Revision Log    :   V_1.0 Created - Shailendra Sharma - 19/10/2022
*	
*	Coverage      	:    100%
*/

@isTest(seeAllData = false)
private without sharing class Test_Batch_SendStudentsAttendance {
    
    // Method to create the data
    @TestSetup
    static void testSetUpData(){

        List<Student__c> students = TestDataFactory.createListOfStudentsAttendanceTestData();
        System.assertEquals(3, students.size());  
    }
    
   //Method to test Batch on student
   @isTest(seeAllData = false)
    private static void testStudentsAttendanceDetails(){
        
        //Perform the test
        Test.startTest();
        
        Batch_SendStudentsAttendance stu = new Batch_SendStudentsAttendance();
        stu.query = 'SELECT Id, Name, Attendance__c FROM Student__c WHERE Attendance__c < 75';  
        DataBase.executeBatch(stu, 200);
        
        //Stpo test here
        Test.stopTest();
        
        //Query on student to get students whose attendance is less then 75%
        List<Student__c> listOfStudent = [SELECT Id, Attendance__c, Email_Sent__c FROM Student__c WHERE Attendance__c < 75];
        
        System.assertEquals(2, listOfStudent.size());
        System.assertEquals(True, listOfStudent[0].Email_Sent__c);
        System.assertEquals(1, Batch_SendStudentsAttendance.emailLimits);
    }
}