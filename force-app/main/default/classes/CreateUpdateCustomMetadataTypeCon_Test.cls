/*
    Purpose         :   Test Class for "CreateUpdateCustomMetadataTypeController" apex class
    Created By      :   Abhinav Sharma
    Created Date    :   11/18/2022
    Current Version :   v1.0
    Revision Log    :   V_1.0 Created - Abhinav Sharma - 10/18/2022
*/
@isTest(seeAllData=false)
private without sharing class CreateUpdateCustomMetadataTypeCon_Test
{  
    @isTest(seeAllData=false)
    private static void testUseCases() 
    {
        Test.startTest();
        CreateUpdateCustomMetadataTypeController con = new CreateUpdateCustomMetadataTypeController();
        System.Assert(con != null);
        Test.stopTest();
    }
}