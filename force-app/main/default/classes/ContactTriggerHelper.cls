/*
 *  Purpose          :    This class is used to update contact count on Account.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/09/1
 *  Revision Logs    :    V_1.0 - Created 
 */
public without sharing class ContactTriggerHelper {

    public static void populateContactsOnAccount(List<Contact> newContacts, Map<Id,Contact> mapOfOldContacts) {
    
        //Map to hold updated Accounts
        Map<Id, Account> mapOfAccounts = new Map<Id, Account>();
            
        //Traverse on contacts
        for(Contact con : (newContacts != null ? newContacts : mapOfOldContacts.values())){
            
            //Check valid conditions for insert update and delete
            if( mapOfOldContacts == null || (mapOfOldContacts != null && con.AccountId != mapOfOldContacts.get(con.Id).AccountId) || newContacts == null){
            
                if(newContacts != null && con.AccountId != null) { //For Insert and Delete
                    mapOfAccounts.put(con.AccountId, new Account(Id = con.AccountId, No_of_Contacts__c = 0 )); 
                	System.debug('mapOfAccounts1');
            	}
                    
                if(mapOfOldContacts != null && mapOfOldContacts.get(con.Id).AccountId != null){ //For Update 
                    mapOfAccounts.put(mapOfOldContacts.get(con.Id).AccountId, new Account(Id = mapOfOldContacts.get(con.Id).AccountId, No_of_Contacts__c = 0 ));
                	System.debug('mapOfAccounts2');
           		 }
        	}
        }
        
        //Check Map is not empty
        if(!mapOfAccounts.isEmpty()){
        
            for(AggregateResult agr : [SELECT AccountId, COUNT(Id)totalContactCount FROM Contact WHERE AccountId IN : mapOfAccounts.keySet() GROUP By AccountId])
                mapOfAccounts.get((Id)agr.get('AccountId')).No_of_Contacts__c = (Integer)agr.get('totalContactCount');
            
            if(!mapOfAccounts.isEmpty())
                update mapOfAccounts.values();
        }   
    }
    
    public static void updateLastNameByAccountLastName(List<Contact> newContacts, Map<Id,Contact> mapOfOldContacts){
                
        Set<Id> setOfAccountIds = new Set<Id>();
        
        for(Contact con : (newContacts != null ? newContacts : mapOfOldContacts.values())){
            
            //Check valid conditions for insert and update
            if( mapOfOldContacts == null || (mapOfOldContacts != null && con.LastName != mapOfOldContacts.get(con.Id).LastName)){
                
                if(con.AccountId != null)
                    
                    setOfAccountIds.add(con.AccountId);   

            }
        }
        
        if(!setOfAccountIds.isEmpty()){
            
            Map<Id, Account> accountMap = new Map<Id, Account>([SELECT Id, Name FROM Account WHERE Id IN :setOfAccountIds]);
            
            if(!accountMap.isEmpty()){
                
                
                for(Contact con : newContacts)
                    
                    con.LastName = con.LastName + ' ' + accountMap.get(con.AccountId).Name;        
            }
        }
    }
    
}