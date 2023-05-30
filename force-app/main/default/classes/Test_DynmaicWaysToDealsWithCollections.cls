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
  *    Description    :    This Test class check the existing of school in a map filled by dynamic way.
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
private class Test_DynmaicWaysToDealsWithCollections {
    
	//Method for inserting school, classes and students data for testing
    @testSetup
    static void testSetupData(){

    	List<Student__c> students = TestDataFactory.createListOfStudentsTestDataWithTriggerEnabled();
        System.assertEquals(5, students.size());   
    
    }
    
    //testMethod    
    @isTest
	static void testingOfMapFilledByDynamicWay(){
   		
        //Query of insertrd data for testing
        List<Class__c> listOfClass = [SELECT Id, Name, School__r.Name, (SELECT Id,Name FROM Students__r) FROM Class__c];
        
        //Perform the test
        Test.startTest();
        new DynmaicWaysToDealsWithCollections();
        Test.stopTest();
        
    	//Check the result
        System.assertEquals(listOfClass[0].School__r.Name, new List<String>(DynmaicWaysToDealsWithCollections.mapOfSchoolNameWithClassNameAndRelatedStudentsDetails.keySet())[0]);
    }
}