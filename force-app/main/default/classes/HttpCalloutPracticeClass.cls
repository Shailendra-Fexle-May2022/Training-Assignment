public class HttpCalloutPracticeClass {
    
    public static void getRestApiDetails(){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://gorest.co.in/public/v2/users');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        
        if(response.getStatusCode() == 200){ 
            
            System.debug('Response Body' + response.getBody()); 
                      
            List<Object> results = (List<Object>)JSON.deserializeUntyped(response.getBody());
             System.debug('Results' + results); 
            
            for(Object obj : results)
                System.debug('Records Details' +obj); 
        	}
        }
    
    public static void postRestApiDetails(){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://gorest.co.in/public/v2/users');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setHeader('Authorization', 'Bearer edf42fe9ddc5ef2583738cc78f882728fb4665504eeb72630ed800dc89f36de7');
        request.setBody('{"name":"surendra","email":"surendra_1986@gmail.com","gender":"male","status":"active"}');
        HttpResponse response = http.send(request);
        System.debug('Response Body' + response.getStatusCode()); 
 		System.debug('Response Body' + response.getBody()); 
        
        if(response.getStatusCode() == 201){ 
            
            System.debug('Response Body' + response.getBody()); 
        	}
        }
    
    public static void deleteRestApiDetails(){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://gorest.co.in/public/v2/users/2356');
        request.setMethod('DELETE');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setHeader('Authorization', 'Bearer edf42fe9ddc5ef2583738cc78f882728fb4665504eeb72630ed800dc89f36de7');
        HttpResponse response = http.send(request);
        System.debug('Response Body' + response.getStatusCode()); 
 		System.debug('Response Body' + response.getBody()); 
        
        }
    
     public static void patchRestApiDetails(){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://gorest.co.in/public/v2/users');
        request.setMethod('PATCH');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setHeader('Authorization', 'Bearer edf42fe9ddc5ef2583738cc78f882728fb4665504eeb72630ed800dc89f36de7');
        request.setBody('{"Id" : "2373","status":"active"}');
        HttpResponse response = http.send(request);
        System.debug('Response Body' + response.getStatusCode()); 
 		System.debug('Response Body' + response.getBody()); 
     }
  }