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
  *    Description    :    TTest Class for "Queue_ChainJobForUpateCustomMDT" apex class.
  *  
  *    Created By     :    Shailendra Sharma
  *
  *    Created Date   :    01/12/2022
  *
  *    Version        :    V1.0
  *
  *    Revisison Log  :    V1.0 - Created
  *					   	
  *    Coverage       :    100%
**/
@isTest(seeAllData = false)
public without sharing class Test_Queue_ChainJobForUpateCustomMDT {
    
    @IsTest(seeAllData = false)
    private static void whenUpsertingBySObjectSendsEvent() {

        // Given
        MockPlatform mockPlatform = new MockPlatform();
        mockPlatform.metadataEnqueueDeploymentResult = new Metadata.DeployResult();
        mockPlatform.metadataEnqueueDeploymentResult.details = new Metadata.DeployDetails();
        mockPlatform.metadataEnqueueDeploymentResult.details.componentFailures = new List<Metadata.DeployMessage>();
        mockPlatform.metadataEnqueueDeploymentResult.details.componentSuccesses = new List<Metadata.DeployMessage>();
        Metadata.DeployMessage deploySuccess = 
            (Metadata.DeployMessage) JSON.deserialize(
                '{"Name":"Web_Service_Log__c","success":true}', Metadata.DeployMessage.class);
        mockPlatform.metadataEnqueueDeploymentResult.details.componentSuccesses.add(deploySuccess);
        mockPlatform.eventBusPublishResponse = 
            (List<Database.SaveResult>) JSON.deserialize(
                '[{"id":"e00xx000000001TAAQ","success":true,"errors":[],"warnings":[]}]', List<Database.SaveResult>.class);
        CustomMetadata.Platform = mockPlatform;
        List<SObject> records = new List<SObject> { new Account(Description = 'My Record') }; 
          
        Queueable_ChainJobForUpateCustomMDT queObj = new Queueable_ChainJobForUpateCustomMDT('next Job');
        System.enqueueJob(queObj);
        
        List<HTTPCalloutConfiguration__mdt> httpCalloutConfigRecords = [SELECT DeveloperName, Label, Timeout__c
                                                                        FROM HTTPCalloutConfiguration__mdt
                                                                        where DeveloperName =: Constants.HTTP_CALLOUT_NAME_TEST_METADATA];
        
        system.debug('@@@@@httpCalloutConfigRecords'+ httpCalloutConfigRecords);

        // Then
        System.assertEquals(11000,httpCalloutConfigRecords[0].Timeout__c);
            
        
    }    
    
    /**
     * Mock platform API behaviours and responses. Public so applications can mock their own metadata deploy
     * responses following the pattern of the testmethods in this test class 
     **/
    public class MockPlatform extends CustomMetadata.Platform {
        
        // Mock test inputs and captured responses
        public List<Database.SaveResult> eventBusPublishResponse;
        public List<SObject> eventBusPublishEvents;
        public Metadata.DeployContainer metadataEnqueueDeploymentContainer;
        public Metadata.DeployResult metadataEnqueueDeploymentResult; 
        
        // Mock System.EventBus.publish
        public override List<Database.SaveResult> eventBusPublish(List<SObject> events) {
            eventBusPublishEvents = events;
            return eventBusPublishResponse;
        }
        // Mock Metadata.Operations.enqueueDeployment
        public override Id metadatEnqueueDeployment(Metadata.DeployContainer mdContainer, Metadata.DeployCallback deployCallback) {
            metadataEnqueueDeploymentContainer = mdContainer;
            deployCallback.handleResult(metadataEnqueueDeploymentResult, new Metadata.DeployCallbackContext());
            return null; // Not used
        }        
    }

}