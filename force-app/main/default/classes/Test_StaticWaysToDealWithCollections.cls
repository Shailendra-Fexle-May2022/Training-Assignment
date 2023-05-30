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
  *    Created Date   :    11/09/2022
  *
  *    Version        :    V1.0
  *
  *    Revisison Log  :    V1.0 - Created
  *
  *    Coverage       :    100%
**/
@isTest(seeAllData = false)
private class Test_StaticWaysToDealWithCollections {
    
	//TestMethod
     @isTest(seeAllData=false)
    private static void testingOfMapFilledByStaticWay(){
        
		//Fill the map fir testing
        Map<String, Map<String, List<String>>> mapOfSchoolWithClassAndRelatedStudentsDetails = new Map<String, Map<String,List<String>>>{'India'=> new Map<String, List<String>>{'Rajasthan'=> new List<String>{'Jaipur'}}};
        
            //Call the class for testing
        new StaticWaysToDealsWithCollections();
		
        //Check the result
        System.assertEquals(new List<String>(mapOfSchoolWithClassAndRelatedStudentsDetails.keySet())[0], new List<String>(StaticWaysToDealsWithCollections.mapOfSchoolNameWithClassNameAndRelatedStudentsDetails.keySet())[0]);
    }
}