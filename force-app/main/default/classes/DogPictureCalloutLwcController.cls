/**
*
*  Purpose          :	Controller Class for integration with Open Source App via LWC Component.
*
*  Created Date     :  	15/12/2022
*
*  Created By       :  	Shailendra Sharma
*
*  Revision Logs    :  	V_1.0 - Created
*
**/
public with sharing class DogPictureCalloutLwcController {
    
	@AuraEnabled(cacheable = false)
  public static String getDogPicture(){
      
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:DogPictureApi');
        req.setMethod('GET');
        HttpResponse resp = http.send(req);
        return resp.getBody();
   }
}