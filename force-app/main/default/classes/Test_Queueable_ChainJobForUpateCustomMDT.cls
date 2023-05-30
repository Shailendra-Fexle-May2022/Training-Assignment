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
*	Purpose         :   Test Class for "Queueable_ChainJobForUpateCustomMDT" apex class
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
public without sharing class Test_Queueable_ChainJobForUpateCustomMDT {
	
    @isTest(seeAllData=false)
    private static void ChainJobForUpateCustomMDTWithMessage()
    {
       String metaData = 'MetaDtata';
        
        Queueable_ChainJobForUpateCustomMDT queueCustomMetaData = new Queueable_ChainJobForUpateCustomMDT(metaData);
  
        System.Assert(queueCustomMetaData != null);
    } 
    
}