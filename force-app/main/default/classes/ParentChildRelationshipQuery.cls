/**
*
*  Purpose          :   Class to demonstrate the parent to child and child to parent query.
*
*  Created Date     :   09/06/2022
*
*  Created By       :   Shailendra Sharma
*
*  Revision Logs    :   V_1.0 - Created
*
**/
public without sharing class ParentChildRelationshipQuery {

    public static void childToParentQuery(){
        
        //Child to Parent Quiers of relationship,Parent=>Account,Child=>Contact
        List<Contact> listOfContact = [SELECT FirstName, LastName, Account.Name,
                                        Account.Industry FROM Contact LIMIT 1 ];
        if(!listOfContact.isEmpty()){
            for(Contact con : listOfContact){
                System.debug('Account Name:' + con);//Account Name:Contact:{FirstName=Rose, LastName=Gonzalez, AccountId=0015g00000qPNCBAA4, Id=0035g00000fSVL1AAO}
                System.debug('Account Name:' + con.Account.Name);//Account Name:Edge Communications
                System.debug('Industry:' + con.Account.Industry);//Industry:Electronics
            }   
        } 
        
        //Child to Parent Quiers of relationship,Parent=>Contact,Child=>QueryTest_Child__c
        List<QueryTest_Child__c> listOfQueryTest = [SELECT Name, Phone_No__c, Contact__r.FirstName, Contact__r.LastName
                                        				 FROM QueryTest_Child__c];
        if(!listOfQueryTest.isEmpty()){
            for(QueryTest_Child__c queryTest : listOfQueryTest){
                System.debug('Contact FirstName:' + queryTest.Contact__r.FirstName);//Sahil,Neha
            }   
        } 
        
        //Child to Parent Quiers of relationship,Parent=>QueryTest_Parent__c,Child=>QueryTest_Child__c
        List<QueryTest_Child__c> listOfQueryTest1 = [SELECT Name, Phone_No__c, QueryTest_Parent__r.Name, QueryTest_Parent__r.Phone__c, QueryTest_Parent__r.Salary__c
                                        				 FROM QueryTest_Child__c LIMIT 2];
        if(!listOfQueryTest1.isEmpty()){
            for(QueryTest_Child__c queryTest : listOfQueryTest1){
                System.debug('QueryTest_Parent__r.Name:' + queryTest.QueryTest_Parent__r.Name);//Prateek,Robinder
                System.debug('QueryTest_Parent__r.Salary__c:' + queryTest.QueryTest_Parent__r.Salary__c);//2300,1000
            }   
        }
    }
    
    // Method for parent to child query 
    public static void ParentToChildQuery(){
        
        //Parent to Child Quiers of relationship,Parent=>Account,Child=>Contact
        List<Account> listOfAccount = [SELECT Name, Industry, (SELECT FirstName, LastName  FROM Contacts) FROM Account Limit 2];
        System.debug('listOfAccount with child record:'+ listOfAccount);
        
        //listOfAccount with child record:
        //(Account:{Name=Ashok Kumar, Id=0015g00000oocxQAAQ}, 
        //Account:{Name=Sample Account for Entitlements, Id=0015g00000ooNLnAAM})
        
        //Parent to Child Quiers of relationship,Parent=>Contact,Child=>QueryTest_Child__c
        List<Contact> listOfContact = [SELECT FirstName, LastName, (SELECT Name, Phone_No__c FROM QueryTest_Child__r) FROM Contact];
        //SELECT Id, FirstName, LastName, (SELECT Name, Phone_No__c FROM QueryTest_Child__r) FROM Contact Where Id IN (SELECT Contact__c FROM QueryTest_Child__c)
        
        //Parent to Child Quiers of relationship,Parent=>QueryTest_Parent__c,Child=>QueryTest_Child__c
        List<QueryTest_Parent__c> listOfQueryTestParent = [SELECT Name, Phone__c, (SELECT Name, Phone_No__c FROM QueryTest_Child__r) FROM QueryTest_Parent__c];
        
        if(!listOfQueryTestParent.isEmpty()){
            for(QueryTest_Parent__c qtp :listOfQueryTestParent){
                System.debug(qtp); 
                //QueryTest_Parent__c:{Name=Prateek, Phone__c=356234134, Id=a045g000009FQqJAAW}
                //QueryTest_Parent__c:{Name=Robinder, Phone__c=245366, Id=a045g000009FQqOAAW}
        	}
        }
    }
}