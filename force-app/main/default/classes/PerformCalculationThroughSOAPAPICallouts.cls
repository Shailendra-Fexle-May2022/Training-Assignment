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
public without sharing class PerformCalculationThroughSOAPAPICallouts {
     
    //Method to add two numbers	
      public static Double add(Double x, Double y) {
          
        calculatorServices.CalculatorImplPort calculator = new calculatorServices.CalculatorImplPort();
        return calculator.doAdd(x,y);
    }
	
    //Method to divide two numbers	
    public static Double divide(Double x, Double y) {
          
        calculatorServices.CalculatorImplPort calculator = new calculatorServices.CalculatorImplPort();
        return calculator.doDivide(x,y);
    }
    
    //Method to subtract two numbers	
    public static Double subtract(Double x, Double y) {
          
        calculatorServices.CalculatorImplPort calculator = new calculatorServices.CalculatorImplPort();
        return calculator.doSubtract(x,y);
    }
    
    //Method to multiply two numbers	
    public static Double multiply(Double x, Double y) {
          
        calculatorServices.CalculatorImplPort calculator = new calculatorServices.CalculatorImplPort();
        return calculator.doMultiply(x,y);
    }
}