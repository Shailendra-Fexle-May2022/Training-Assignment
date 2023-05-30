/*
 *  Purpose          :    This class is used to update contacta count on Account.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/09/1
 *  Revision Logs    :    V_1.0 - Created - 2022/09/1
 */
public without sharing class ConatctTriggerHelper {

    /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is used to get AccountIds related to  its corresponding contacts and update contacts on Account.
    * Params        :    List<Contact> 
    * Return        :    Void
    */
    public static void populateContactsOnAccount(List<Contact> newContacts, Map<Id,Contact> mapOfOldContacts) {
    	System.debug(newContacts);
        System.debug(mapOfOldContacts);
        //Map to hold updated Accounts
        Map<Id, Account> mapOfAccounts = new Map<Id, Account>();
            
        //Traverse on contacts
        for(Contact con : (newContacts != null ? newContacts : mapOfOldContacts.values())){
            
            //Check valid conditions for insert update and delete
            if( mapOfOldContacts == null || (mapOfOldContacts != null && con.AccountId != mapOfOldContacts.get(con.Id).AccountId) || newContacts == null){
            
                if(con.AccountId != null) //For Insert and Delete
                    mapOfAccounts.put(con.AccountId, new Account(Id = con.AccountId, No_of_Contacts__c = 0 )); 
                    System.debug(mapOfAccounts);
                if(mapOfOldContacts.get(con.Id).AccountId != null) //For Update 
                    mapOfAccounts.put(mapOfOldContacts.get(con.Id).AccountId, new Account(Id = mapOfOldContacts.get(con.Id).AccountId, No_of_Contacts__c = 0 ));
                	System.debug(mapOfAccounts);
            }
        }
        System.debug(mapOfAccounts);
        
        //Check Map is not empty
        if(!mapOfAccounts.isEmpty()){
        
            for(AggregateResult agr : [SELECT AccountId, COUNT(Id)totalContactCount FROM Contact WHERE AccountId IN : mapOfAccounts.keySet() GROUP By AccountId])
                mapOfAccounts.get((Id)agr.get('AccountId')).No_of_Contacts__c = (Integer)agr.get('totalContactCount');
            if(!mapOfAccounts.isEmpty())
                update mapOfAccounts.values();
        }   
    }
}