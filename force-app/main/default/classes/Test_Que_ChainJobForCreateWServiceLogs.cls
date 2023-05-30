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
*	Purpose         :   Test Class for "Queueable_ChainJobForCreateWServiceLogs" apex class
*
*	Created By      :   Shailendra Sharma
*
*	Created Date    :   23/11/2022
*
*	Current Version :   v1.0
*
*	Revision Log    :   V_1.0 Created - Shailendra Sharma - 23/11/2022
*	
*	Coverage      	:    100%
*/
@isTest(seeAllData = false)
public without sharing class Test_Que_ChainJobForCreateWServiceLogs {
    
    //Method for inserting Web Service Log data for testing
	@testSetup
    static void testSetupData(){
        
        List<Web_Service_Log__c> listOfWebServiceLog = TestDataFactory.createListOfWebServiceLogTestData();
        System.assertEquals(1, listOfWebServiceLog.size());
        System.debug('@@@WebServiceLog' +listOfWebServiceLog);
    }
    
    @isTest(seeAllData = false)
    private static void testToCheckChainJobForCreateWServiceLogsWithWrapperClassDetails(){
        
        WebServiceLogsWrapper webServiceLogsWrapper = new WebServiceLogsWrapper();
        
        webServiceLogsWrapper.direction = Constants.HTTP_CALLOUT_DIRECTION_SF_TO_HEROKU;
        webServiceLogsWrapper.endpoint = System.Label.ENDPOINT_HEROKU_APP;
        webServiceLogsWrapper.errorMessage = Constants.CHAR_BLANK;
        webServiceLogsWrapper.recordID = '';
        webServiceLogsWrapper.requestMessage = Constants.CHAR_BLANK;
        webServiceLogsWrapper.requestMessageLog = '';
        webServiceLogsWrapper.requestSent = System.now();
        webServiceLogsWrapper.responseMessage = Constants.HTTP_CALLOUT_STATUS_SUCCESS;
        webServiceLogsWrapper.responseMessageLog = '';
        webServiceLogsWrapper.responseReceived = System.now();
        webServiceLogsWrapper.webServiceClass = Constants.HEROKU_APP_INTEGRATION_CLASS_NAME;
        webServiceLogsWrapper.webServiceMethod = Constants.HTTP_CALLOUT_OPERATION_GET;
        webServiceLogsWrapper.webServiceName = Constants.HEROKU_UPDATE_USERS_METHOD_NAME; 
        
        String message = 'Hello';
        Queueable_ChainJobForCreateWServiceLogs updater = new Queueable_ChainJobForCreateWServiceLogs(webServiceLogsWrapper);
        
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new HTTPCalloutServiceMock(201, message));
        System.enqueueJob(updater);
        Test.stopTest(); 
        
        
    }
    
    @isTest(seeAllData = false)
    private static void testToCheckChainJobForCreateWServiceLogsWithMessage(){
      
        String message = 'Hello';
        Queueable_ChainJobForCreateWServiceLogs updater = new Queueable_ChainJobForCreateWServiceLogs(message);
    }
    
    //Method to test updated Web Service Records
    @isTest(seeAllData = false)
    private static void testToCheckChainJobForCreateWServiceLogsWithMessageAndWrapperDetails(){
        
        //Query for Web Service Log Record
        List<Web_Service_Log__c> webServiceLog = [SELECT Id, Direction__c, EndPoint__c,Record_ID__c, Response_Message_Log__c FROM Web_Service_Log__c];
        System.debug('@@@webServiceLog' +webServiceLog);
        System.assertEquals(1, webServiceLog.size());
        System.assertEquals(null, webServiceLog[0].Response_Message_Log__c);
        
        WebServiceLogsWrapper webServiceLogsWrapper = new WebServiceLogsWrapper();
        
        webServiceLogsWrapper.direction = Constants.HTTP_CALLOUT_DIRECTION_SF_TO_HEROKU;
        webServiceLogsWrapper.endpoint = System.Label.ENDPOINT_HEROKU_APP;
        webServiceLogsWrapper.errorMessage = Constants.CHAR_BLANK;
        webServiceLogsWrapper.recordID = '';
        webServiceLogsWrapper.requestMessage = Constants.CHAR_BLANK;
        webServiceLogsWrapper.requestMessageLog = '';
        webServiceLogsWrapper.requestSent = System.now();
        webServiceLogsWrapper.responseMessage = Constants.HTTP_CALLOUT_STATUS_SUCCESS;
        webServiceLogsWrapper.responseMessageLog = '';
        webServiceLogsWrapper.responseReceived = System.now();
        webServiceLogsWrapper.webServiceClass = Constants.HEROKU_APP_INTEGRATION_CLASS_NAME;
        webServiceLogsWrapper.webServiceMethod = Constants.HTTP_CALLOUT_OPERATION_GET;
        webServiceLogsWrapper.webServiceName = Constants.HEROKU_UPDATE_USERS_METHOD_NAME;
        
        String job = 'Job Item';
        
        Queueable_ChainJobForCreateWServiceLogs updater = new Queueable_ChainJobForCreateWServiceLogs(webServiceLogsWrapper, job);
        
        Test.startTest();
        
        Test.setMock(HttpCalloutMock.class, new HTTPCalloutServiceMock(201, Job));
        ID jobId = System.enqueueJob(updater);
        
        Test.stopTest();
        
        AsyncApexJob aaj = [SELECT Id, Status, JobItemsProcessed, TotalJobItems, NumberOfErrors 
                    FROM AsyncApexJob WHERE ID =: jobId ];
        System.debug('AsyncApexJob' +aaj);
        System.assertEquals('Completed', aaj.Status);
        
        webServiceLog = [SELECT Id, Direction__c, EndPoint__c,Record_ID__c, Response_Message_Log__c FROM Web_Service_Log__c];
        System.debug('@@@webServiceLog' +webServiceLog);
        System.assertEquals(1, webServiceLog.size());
        //System.assert(webServiceLog[0].Direction__c != null);
        
    }
    
   	@isTest(seeAllData = false)
    private static void testToCheckChainJobForCreateWServiceLogsWithNullWrapper(){
        
        WebServiceLogsWrapper webServiceLogsWrapper ;
        
         String job = 'Job Item';
        
        Queueable_ChainJobForCreateWServiceLogs updater = new Queueable_ChainJobForCreateWServiceLogs(webServiceLogsWrapper, job);
        
        Test.startTest();
        
        Test.setMock(HttpCalloutMock.class, new HTTPCalloutServiceMock(201, Job));
        ID jobId= System.enqueueJob(updater);
        
        Test.stopTest();

		 AsyncApexJob aaj = [SELECT Id, Status, JobItemsProcessed, TotalJobItems, NumberOfErrors 
                    FROM AsyncApexJob WHERE ID =: jobId ];

        System.debug('AsyncApexJob' +aaj);
        System.assertEquals('Completed', aaj.Status);
        
    }
}