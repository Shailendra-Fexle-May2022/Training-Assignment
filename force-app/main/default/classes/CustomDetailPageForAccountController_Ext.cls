/**
*
*  Purpose          :	Controller class for "GenericDetailPageUsingFS" VF Page.
                        Basically it is going to have server side needed code to build custom detail page for Account using standard controller.
*
*  Created Date     :  	02/12/2022
*
*  Created By       :  	Shailendra Sharma
*
*  Revision Logs    :  	V_1.0 - Created
*
**/
public with sharing class CustomDetailPageForAccountController_Ext {
	
    private final Account acct;
    
    // The extension constructor initializes the private member
    // variable acct by using the getRecord method from the standard
    // controller.
    public CustomDetailPageForAccountController_Ext(ApexPages.StandardController stdController) {
        this.acct = (Account)stdController.getRecord();
    }
}