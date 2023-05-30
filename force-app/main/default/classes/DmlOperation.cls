public with sharing class DmlOperation {
    //Method for inserting and updating account records
    public static void insertAndUpdateDmlMethod() {
        List<Account> accList = new List<Account>();
        for(Integer i = 1; i<4; i++){
            Account acc = new Account ( Name = 'TestDmlMethod' + i, Industry = 'Banking');
            accList.add(acc);
        }
        try {

            insert accList;
            
            List<Account> listOfAccountToBeUpdated = new List<Account>();
            //Query of account record for updating
            for(Account acc : [SELECT Id, Name, Phone, Industry FROM Account WHERE Name LIKE 'Test%']){
                acc.Phone = '46341263413';
            	acc.Industry = 'Chemicals';
             	listOfAccountToBeUpdated.add(acc);
            }
            // upadte account record
            update listOfAccountToBeUpdated;   

        } catch (DmlException e) {
            //if Operation failed, so get error message.
            System.debug('An expected error has occurred:' + e.getMessage());
        }
    }
    //Method for inserting  and updating related record 
    public static void insertAndUpdateRelatedRecord(){
        
        Account accountToBeInserted = new Account(Name = 'InsertRelated');
         
        try {
            insert accountToBeInserted;
            // Add a contact to this account.
            Contact conListToBeInserted = new Contact(FirstName = 'RelatedRecord', LastName = 'Test-1', AccountId = accountToBeInserted.Id);
            insert conListToBeInserted;
        } catch (DmlException err) {
            //if Operation failed, so get error message.
            System.debug('An expected error has occurred:' + err.getMessage());
        }

        try {
            Contact contactToBeUpadated = [SELECT Account.Name, Account.Phone FROM contact WHERE FirstName = 'RelatedRecord' AND LastName = 'Test-1' AND AccountId != null Limit 1]; 
            contactToBeUpadated.Phone = '653262364';
            contactToBeUpadated.Account.Phone = '14132269915';

            update contactToBeUpadated;
            update contactToBeUpadated.Account;

        } catch (DmlException err) {
            //if Operation failed, so get error message.
            System.debug('An expected error has occurred:' + err.getMessage());
        }
    }
    //Method for upserting record
    public static void upsertDmlOperation(){

        List<Account> listOfAccountToBeUpserted = new List<Account>();

        //Created new account record
        Account accountToBeInserted = new Account(Name = 'UpsertTest-1', Phone = '47646747');

       //Query of account record for updating
        Account listOfQueriedAccount = [SELECT Id, Name FROM Account WHERE Name LIKE 'Test%'Limit 1];

        //Update phone and industry filed
        listOfQueriedAccount.Phone = '1413269915';
        listOfQueriedAccount.Industry = 'Banking';

        //Add to accountlist for inserting and updating
        listOfAccountToBeUpserted.add(accountToBeInserted);
        listOfAccountToBeUpserted.add(listOfQueriedAccount);
        upsert listOfAccountToBeUpserted;
    }
    public static void mergeDmlOperation(){
        //Query of account record for updating
        Account masterAccount = [SELECT Id, Name, Phone, Industry FROM Account WHERE Name = 'TestDmlMethod1'];

        //Query of account record for merging
        Account accountToBeMerged = [SELECT Id, Name, Phone, Industry FROM Account WHERE Name = 'TestDmlMethod2'];
        merge masterAccount accountToBeMerged; 

        // Once the account is merged with the master account,
        // the related contact should be moved to the master record.
        masterAccount = [SELECT Id, Name, Phone, Industry,
                                (SELECT Id, FirstName, LastName FROM Contacts) 
                                    FROM Account WHERE Name = 'TestDmlMethod1' LIMIT 1];

        System.assert(masterAccount.Contacts.size()>0);
        System.assertEquals('RelatedRecord', masterAccount.Contacts[0].get('FirstName'));
        System.assertEquals('Test-1', masterAccount.Contacts[0].get('LastName'));

        // Verify that the merge record got deleted
        List<Account> result = [SELECT Id, Name FROM Account WHERE Id = :accountToBeMerged.Id];
        System.assertEquals(0, result.size());
    }
}