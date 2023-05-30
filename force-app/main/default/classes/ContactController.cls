/**
*
*  Purpose          :   Class to get all contacts details under account.
*
*  Created Date     :   06/12/2022
*
*  Created By       :   Shailendra Sharma
*
*  Revision Logs    :   V_1.0 - Created
*
**/
public with sharing class ContactController {
    @AuraEnabled(cacheable = true)
    public static List<Contact> getContacts(){
        try {
            return [SELECT Id, accountId, FirstName, LastName
                    FROM Contact LIMIT 5
                    ];

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled(cacheable = true)
     public static List<Contact> getContactsList(String searchKeys, Id lwcRecordId){
         	
         //if search key is available
            if(String.isNotBlank(searchKeys) && searchKeys != ''){
                String key = '%'+ searchKeys + '%';
                 List<Contact> conList = [SELECT Id, Name, AccountId, FirstName, LastName
                    					  FROM Contact 
                                          WHERE AccountId = :lwcRecordId 
                                          AND Name 
                                          LIKE :key
                    					 ];
                //null check
                if(!conList.isEmpty())
                    return conList;
			
            }
         //if search key is not available
            else{	
                
                List<Contact> contactList = [SELECT Id, Name, AccountId, FirstName, LastName
                    					  	 FROM Contact 
                                          	 WHERE AccountId = :lwcRecordId 
                                          	 LIMIT 5
                    					 	];
                //null check
                if(!contactList.isEmpty())
                    return contactList;
            }
           return null;
    }
    
     @AuraEnabled(cacheable = true)
     public static List<Account> getAccountDetails(){
        try {
            return [SELECT Id, Name, Phone
                    FROM Account Limit 5
                    ];

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
	
     @AuraEnabled(cacheable = true)
     public static List<Contact> getRelatedContacts(String selectedAccountId){
         	
         //if search key is available
            if(String.isNotBlank(selectedAccountId)){
               
                 List<Contact> conList = [SELECT Id, Name, AccountId, FirstName, LastName
                    					  FROM Contact 
                                          WHERE AccountId = :selectedAccountId
                    					 ];
                //null check
                if(!conList.isEmpty())
                    return conList;
			
            }
         return null;
     }
}