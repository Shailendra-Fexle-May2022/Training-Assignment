/**
*
*  Purpose          :   Class to update phone number on related opportunities.
*
*  Created Date     :   10/03/2022
*
*  Created By       :   Shailendra Sharma
*
*  Revision Logs    :   V_1.0 - Created
*
**/
public without sharing class AccountTriggerHelper {
    public static void updatePhoneNumberOnRelatedContact(List<Account> newAccountList, Map<Id, Account> mapOfOldAccount){

        Map<Id, String> maoOfAccountIdWithPhoneNo = new Map<Id, String>();
        for(Account acc : newAccountList){
            if(mapOfOldAccount != null && acc.Phone != mapOfOldAccount.get(acc.Id).Phone)
				maoOfAccountIdWithPhoneNo.put(acc.Id, acc.Phone);  
        }  
        List<Contact> conList = [SELECT Id, AccountId,Phone From Contact WHERE AccountId IN :maoOfAccountIdWithPhoneNo.keySet()]; 
        
        if(!conList.isEmpty()){
            
            for(Contact con : conList){  
                
               if(maoOfAccountIdWithPhoneNo.containsKey(con.AccountId))
          			con.Phone = maoOfAccountIdWithPhoneNo.get(con.AccountId);
         	}
            update conList;
        }
    }
}