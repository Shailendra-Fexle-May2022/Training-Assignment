/**
*
*  Purpose          :   Class to demonstrate the future method to update number of cases on account based on Email,Phone,Web. 
*
*  Created Date     :   09/20/2022
*
*  Created By       :   Shailendra Sharma
*
*  Revision Logs    :   V_1.0 - Created
*
**/
public class CalculateCaseOrigin {
    //Future Method
	@future
    public static void countBasedOnOrigin(List<Id> listOfaccIds){
        
        //Query to get parent and child record
        List<Account> listOfAccount = [SELECT Id,Name,Cases_Through_Email__c,Cases_Through_Phone__c, Cases_Through_Web__c,
                                       (SELECT Id,Origin FROM Cases) 
                                       FROM Account WHERE Id IN :listOfaccIds];
        //Irration account record
        for(Account acc : listOfAccount){
            Integer Web = 0,Email = 0,Phone = 0;
            for(Case ca : acc.Cases){
                if(ca.Origin == 'Phone'){
                    Phone++;
                }else if(ca.Origin == 'Email'){
                    Email++;
                }else if(ca.Origin == 'Web'){
                    Web++;
                }   
            }
            acc.Cases_Through_Email__c = Email;
            acc.Cases_Through_Phone__c = Phone;
            acc.Cases_Through_Web__c = Web;
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
    CalculateCaseOrigin.countBasedOnOrigin(accIds); */
}