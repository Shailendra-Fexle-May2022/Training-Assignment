/**
*
*  Purpose          :   Queueable class to delete acoount related contact.
*
*  Created Date     :   31/10/2022
*
*  Created By       :   Shailendra Sharma
*
*  Revision Logs    :   V_1.0 - Created
*
**/
public without sharing class Queueable_DeleteRelatedContactsOfAccount implements Queueable {
	
    private List<Account> newListOfAccount;
    private Map<Id, Account> oldMapOfAccount;
    
    //Constructor
    public Queueable_DeleteRelatedContactsOfAccount(List<Account> newListOfAccount, Map<Id, Account> oldMapOfAccount){
        
        This.newListOfAccount = newListOfAccount;
        This.oldMapOfAccount = oldMapOfAccount; 
    }
    
    //Execute Method
    public void execute(QueueableContext QC){
        
        //Empty set of Id to hold account Ids.
        Set<Id> accountIds = new Set<Id>();
        
        for(Account acc : newListOfAccount){
            
            //Check for update in Type field value and for blank check.
            if(oldMapOfAccount != null && acc.Type != oldMapOfAccount.get(acc.Id).Type)
                accountIds.add(acc.Id);    
        }
        
        if(!accountIds.isEmpty()){
           
            //Query to get contact under account whose type filed value is changed.
        	List<Contact> conList = [SELECT Id, AccountId FROM Contact WHERE AccountId IN : accountIds];
            
            if(!conList.isEmpty())
                delete conList;      
        }
    }
}