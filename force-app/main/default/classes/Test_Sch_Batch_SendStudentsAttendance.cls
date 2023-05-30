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
*	Created Date    :   20/10/2022
*
*	Current Version :   v1.0
*
*	Revision Log    :   V_1.0 Created - Shailendra Sharma - 20/10/2022
*	
*	Coverage      	:    100%
*/

@isTest(seeAllData = false)
public class Test_Sch_Batch_SendStudentsAttendance {
    
    // Method to create the data
    @TestSetup
    static void testSetUpData(){
        
        List<Student__c> students = TestDataFactory.createListOfStudentsAttendanceTestData();
        System.assertEquals(3, students.size());
        System.debug('@@@students' + students);   
    }
    
    // Method to test schedule of batch 
    @isTest(seeAllData = false)
    private static void testScheduleOfBatchSendStudentsAttendance(){
        
        //Perform the test
        Test.startTest();
        
        String CORN_EXP = '0 30 16 * * ? 2022';
		String jobid = System.Schedule('Send_23Email Job', CORN_EXP, new Schedule_Batch_SendStudentsAttendance());
        
        CronTrigger ct = [Select id , CronExpression from CronTrigger where id = :jobId];
        System.assertEquals(CORN_EXP,ct.CronExpression); 
        
        //Stop test here
        Test.stopTest();
    }
}