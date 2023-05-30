/**
*
*  Purpose          :   Class to demonstrate the future method to update number of contact on account.
*
*  Created Date     :   09/20/2022
*
*  Created By       :   Shailendra Sharma
*
*  Revision Logs    :   V_1.0 - Created
*
**/
public class ContactCalulator {
    //Future Method
	@future
    public static void countContact(List<Id> accIds){
        //Query to get parent and child record
        List<Account> listOfAccount = [SELECT Id, (SELECT Id, Name FROM Contacts) FROM Account WHERE Id IN :accIds];
       
        //Irration account record
        for(Account acc : listOfAccount){
            //Add no of contact under each account
            acc.No_of_Contacts__c = acc.Contacts.size();
        }
        //Update account record
        if(!listOfAccount.isEmpty())
            update listOfAccount;
    }
    /*List<Account> accList = [SELECT Id,Name FROM Account];
    List<Id> accIds = new List<Id>();
    for(Account acc: accList){
        accIds.add(acc.Id);
    }
    ContactCalulator.countContact(accIds); */
}