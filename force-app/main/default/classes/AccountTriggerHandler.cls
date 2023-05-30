/**
*
*  Purpose          :   Helper class for trigger on Account.
*
*  Created Date     :   1/11/2022
*
*  Created By       :   Shailendra Sharma
*
*  Revision Logs    :   V_1.0 - Created
*
**/
public without sharing class AccountTriggerHandler {
    
    public static void deleteChildContactsOnParentAccountTypeChanged(List<Account> newListOfAccount, Map<Id, Account> oldMapOfAccounts){
        
        Map<Id, Account> mapOfAccountToBeDeleted = new Map<Id, Account>();
        
        for(Account acc : newListOfAccount){
            
            if(oldMapOfAccounts != null && acc.Type != oldMapOfAccounts.get(acc.Id).Type){
                mapOfAccountToBeDeleted.put(acc.Id, acc);
            }
        }
        
        if(mapOfAccountToBeDeleted.size()>0){
            
            List<Contact> listOfContactToBeDeleted = [SELECT Id FROM Contact WHERE AccountId IN :mapOfAccountToBeDeleted.keySet()];
           
            if(!listOfContactToBeDeleted.isEmpty()){
                
                Utilities.BypassAllTriggers = True;
                delete listOfContactToBeDeleted;
                Utilities.BypassAllTriggers = false;
            } 	
        }  
    }
    
    public static void deleteChildContactsOnParentAccountDelete(Map<Id, Account> oldMapOfAccounts){
        
        AccountTriggerHandler.deleteAssociatedContacts(oldMapOfAccounts);
    }
    
    public static void deleteChildContactsOnParentAccountDeleteOnAfter(Map<Id, Account> oldMapOfAccounts){
        
        AccountTriggerHandler.deleteAssociatedContacts(oldMapOfAccounts);
    }
    
    public static void deleteAssociatedContacts(Map<Id, Account> oldMapOfAccounts){
        
        Set<Id> setOfAccountIDs = new Set<Id>();
        
        if(oldMapOfAccounts != null && oldMapOfAccounts.values().size()> 0){
           
            for(Account acc : oldMapOfAccounts.values()){
                
                setOfAccountIDs.add(acc.Id);
            }
        }
        if(setOfAccountIDs.size()>0){
            
            List<Contact> listOfContactToBeDeleted = [SELECT Id, AccountId FROM Contact WHERE AccountId IN :setOfAccountIDs];
           
            System.debug('@@@@ listOfContactToBeDeleted' + listOfContactToBeDeleted);
            if(!listOfContactToBeDeleted.isEmpty()){
                
                Utilities.BypassAllTriggers = True;
                delete listOfContactToBeDeleted;
                Utilities.BypassAllTriggers = True;
            } 	
        }
    }
}