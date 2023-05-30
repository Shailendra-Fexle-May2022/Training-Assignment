/**
*
*  Purpose          :	Mock Class for integration with Open Source Heroku App.
*
*  Created Date     :  	08/11/2022
*
*  Created By       :  	Shailendra Sharma
*
*  Revision Logs    :  	V_1.0 - Created
*
**/
@isTest
public class Mock_HerokuAppIntegrationManager implements HttpCalloutMock {
    
	// Implement this interface method
    public HTTPResponse respond(HTTPRequest request) {
        
        // Create a fake response
        HttpResponse response = new HttpResponse();
        
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}');
        response.setStatusCode(200);
        return response; 
    }
}