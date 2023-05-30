/**
*
*  Purpose          :	Class for Creating new Account record using REST API.
*
*  Created Date     :  	18/11/2022
*
*  Created By       :  	Shailendra Sharma
*
*  Revision Logs    :  	V_1.0 - Created
*
**/
public without sharing class CreateAccountRecordUsingRestApi {
	
    public static void makePostCallout() {
        String sessionId = UserInfo.getSessionId();
        System.debug('sessionId' +sessionId);
        Http http = new Http();
       
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://fexleservicesprivatelim-12c-dev-ed.my.salesforce.com/services/data/v56.0/sobjects/Account');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
        request.setBody('{"Name" : "Express Logistics and Transport"}');
        HttpResponse response = http.send(request);
        
        System.debug('REQUEST HEADER: ' + request.getHeader('Authorization'));
        
        System.debug('Response' +response);
        // Parse the JSON response
        if(response.getStatusCode() != 201) {
            
            System.debug('The status code returned was not expected: ' +
                response.getStatusCode() + ' ' + response.getStatus());
        } else 
            
            System.debug(response.getBody());
    }    
}