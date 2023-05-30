/**
*
*  Purpose          :   Apex class that callout different Arithmetic operation through SOAP API callouts
*
*  Created Date     :   30/11/2022
*
*  Created By       :   Shailendra Sharma
*
*  Revision Logs    :   V_1.0 - Created
*
**/
@isTest
public without sharing class CalculatorCalloutMock implements WebServiceMock {
    
   public String mode;
   public static String ADD_MODE = 'ADD_MODE';
   public static String SUB_MODE = 'SUB_MODE';
   public static String MUL_MODE = 'MUL_MODE';
   public static String DIV_MODE = 'DIV_MODE';

    /*
    *   Constructor is used to set the mode in which the mock is called,
    *   It'll help the mock class to form the correct dummy response according to the callout invoked
    */
   public CalculatorCalloutMock(String mockMode) {
       this.mode = mockMode;
   }
	
   // This method is declared in WebServiceMock interface and needs to be overridden by our mock class 
   public void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType){
               
        /*
        *   Checking the mode and forming the correct response for mock callout.
        *   We're using the auto-genrated response wrappers from CalculatorService class
        *   and the response variable received as a parameter for setup the mock response
        */
               
        if(mode == ADD_MODE) {
               
            // start - specify the response you want to send
            calculatorServices.doAddResponse addResponse = new calculatorServices.doAddResponse();
            addResponse.return_x = 9.0;
            response.put('response_x', addResponse); 
        }
  
   
        else if(mode == SUB_MODE) {      
             // start - specify the response you want to send
             calculatorServices.doSubtractResponse subtractResponse = new calculatorServices.doSubtractResponse();
             subtractResponse.return_x = 3.0;
             response.put('response_x', subtractResponse); 
         }  
         else if(mode == DIV_MODE) {
             
             // start - specify the response you want to send
             calculatorServices.doDivideResponse divideResponse = new calculatorServices.doDivideResponse();
             divideResponse.return_x = 2.0;
             response.put('response_x', divideResponse); 
   		}
    
      	else if(mode == MUL_MODE) {
          
          // start - specify the response you want to send
          calculatorServices.doMultiplyResponse multiplyResponse = new calculatorServices.doMultiplyResponse();
          multiplyResponse.return_x = 18.0;
          response.put('response_x', multiplyResponse); 
   		}
	}
}