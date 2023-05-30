/**
*
*  Purpose          :	Helper Class for integration with Open Source Heroku App.
*
*  Created Date     :  	24/11/2022
*
*  Created By       :  	Shailendra Sharma
*
*  Revision Logs    :  	V_1.0 - Created
*
**/
@isTest
public class Mock_StandardRestAPICallOutsHelper implements HttpCalloutMock {
    
	// Implement this interface method
    public HTTPResponse respond(HTTPRequest request) {
        
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.getBody();
                        /* ,
                         "Error_Message__c" : "",
                         "Record_ID__c" : "0055g00000ETPHNAA5",
                         "Request_Message__c" : "",
                         "Request_Message_Log__c" : "",
                         "Request_Sent__c" : "2022-11-21T08:33:02.939Z",
                         "Response_Message__c" : "SUCCESS",
                         "Response_Message_Log__c" : "{\"animals\":[\"majestic badger\",\"fluffy bunny\",\"scary bear\",\"chicken\"]}",
                         "Response_Received__c" : "2022-11-21T08:33:02.940Z",
                         "Web_Service_Class__c" : "HerokuAppIntegrationManager",
                         "Web_Service_Method__c" : "GET",
                         "Web_Service_Name__c" : "makeHerokuAppCalloutAndUpdateUsers"}');*/
                         
        response.setStatusCode(201);
        System.debug('@@@Response :'+response);
        return response; 
        
          
    }
}