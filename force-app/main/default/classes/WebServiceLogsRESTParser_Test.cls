/**
*
*  Purpose          :   Test Class for "WebServiceLogsRESTParser" apex class.
						//https://developer.salesforce.com/forums/?id=9060G0000005VB1QAM
*
*  Created Date     :   28/11/2022
*
*  Created By       :   Shailendra Sharma
*
*  Revision Logs    :   V_1.0 - Created
*
**/
@IsTest(seeAllData=false)
public without sharing class WebServiceLogsRESTParser_Test 
{
	// This test method should give 100% coverage
	static testMethod void testParse() 
    {
		String json = '{'+
		'	\"Direction__c\" : \"3rd Party --> SFDC\",'+
		'	\"Endpoint__c\" : \"https://fexleservicesprivatelimi-1a-dev-ed.my.salesforce.com/_ui/common/apex/debug/ApexCSIPage\",'+
		'	\"Error_Message__c\" : \"Test\",'+
		'	\"Request_Message__c\" : \"Success\",'+
		'	\"Request_Message_Log__c\" : \"Test 1\",'+
		'	\"Response_Message__c\" : \"Test 2\",'+
		'	\"Response_Message_Log__c\" : \"Test 3\",'+
		'	\"Web_Service_Class__c\" : \"ABCD\",'+
		'	\"Web_Service_Method__c\" : \"XYZ\",'+
		'	\"Web_Service_Name__c\" : \"Test\",'+
		'	\"Request_Sent__c\" : \"Test\",'+
		'	\"Response_Received__c\" : \"Test\",'+
		'	\"Id\" : \" Test\"'+
		'}';
		WebServiceLogsRESTParser r = WebServiceLogsRESTParser.parse(json);
		System.assert(r != null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		WebServiceLogsRESTParser objJSON2Apex = new WebServiceLogsRESTParser(System.JSON.createParser(json));
		System.assert(objJSON2Apex != null);
		System.assert(objJSON2Apex.Direction == null);
		System.assert(objJSON2Apex.Endpoint == null);
		System.assert(objJSON2Apex.Error_Message == null);
		System.assert(objJSON2Apex.Request_Message == null);
		System.assert(objJSON2Apex.Request_Message_Log == null);
		System.assert(objJSON2Apex.Response_Message == null);
		System.assert(objJSON2Apex.Response_Message_Log == null);
		System.assert(objJSON2Apex.Web_Service_Class == null);
		System.assert(objJSON2Apex.Web_Service_Method == null);
		System.assert(objJSON2Apex.Web_Service_Name == null);
		System.assert(objJSON2Apex.Request_Sent == null);
		System.assert(objJSON2Apex.Response_Received == null);
		System.assert(objJSON2Apex.recordId == null);
	}
}