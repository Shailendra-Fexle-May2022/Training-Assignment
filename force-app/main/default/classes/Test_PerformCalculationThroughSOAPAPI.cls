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
*	Purpose         :   Test Class for PerformCalculationThroughSOAPAPICallouts class
*
*	Created By      :   Shailendra Sharma
*
*	Created Date    :   30/11/2022
*
*	Current Version :   v1.0
*
*	Revision Log    :   V_1.0 Created - Shailendra Sharma - 30/11/2022
*	
*	Coverage      	:    100%
*/

@isTest(seeAllData = false)
private without sharing class Test_PerformCalculationThroughSOAPAPI {
	
    //Method to test addition through SOAP API CallOut.
    @isTest(seeAllData = false)
    private static void testAddCallOut(){
        
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new CalculatorCalloutMock(CalculatorCalloutMock.ADD_MODE));
        
        // Call the method that invokes a callout
        Double x = 6.0;
        Double y = 3.0;
        Double result = PerformCalculationThroughSOAPAPICallouts.add(x, y);
        
        // Verify that a fake result is returned
        System.assertEquals(9.0, result); 
    }
    
    //Method to test subtraction through SOAP API CallOut.
    @isTest(seeAllData = false)
    private static void testSubCallOut(){
        
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new CalculatorCalloutMock(CalculatorCalloutMock.SUB_MODE));
        
        // Call the method that invokes a callout
        Double x = 6.0;
        Double y = 3.0;
        Double result = PerformCalculationThroughSOAPAPICallouts.subtract(x, y);
        
        // Verify that a fake result is returned
        System.assertEquals(3.0, result); 
    }
    
    //Method to test divide through SOAP API CallOut.
    @isTest(seeAllData = false)
    private static void testDivideCallOut(){
        
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new CalculatorCalloutMock(CalculatorCalloutMock.DIV_MODE));
        
        // Call the method that invokes a callout
        Double x = 6.0;
        Double y = 3.0;
        Double result = PerformCalculationThroughSOAPAPICallouts.divide(x, y);
        
        // Verify that a fake result is returned
        System.assertEquals(2.0, result); 
    }
    
     //Method to test multiply through SOAP API CallOut.
    @isTest(seeAllData = false)
    private static void testMultiplyCallOut(){
        
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new CalculatorCalloutMock(CalculatorCalloutMock.MUL_MODE));
        
        // Call the method that invokes a callout
        Double x = 6.0;
        Double y = 3.0;
        Double result = PerformCalculationThroughSOAPAPICallouts.multiply(x, y);
        
        // Verify that a fake result is returned
        System.assertEquals(18.0, result); 
    }
}