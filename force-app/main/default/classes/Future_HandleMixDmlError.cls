/**
*
*  Purpose          :   Class to handle mixed DML error using future method.
*
*  Created Date     :   31/10/2022
*
*  Created By       :   Shailendra Sharma
*
*  Revision Logs    :   V_1.0 - Created
*
**/
public without sharing class Future_HandleMixDmlError {
	
    //Method to insert mew Account records
    public static void insertNewAcoount(){
        
        //Empty list of account to insert new account records
        List<Account> listOfNewInsertedAccount = new List<Account>();
        
        listOfNewInsertedAccount.add(new Account(Name = 'FutureTest-1'));
        listOfNewInsertedAccount.add(new Account(Name = 'FutureTest-2'));
        
        if(!listOfNewInsertedAccount.isEmpty())
        	Insert listOfNewInsertedAccount;
   }
    
    //Future method to insert new user and handle mixed DML error
    @future
    public static void insertUserWithRole(String uname, String al, String em, String lname){
        
        //Query to get profile id
        Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
        
        //Query to get userRole id
		UserRole r = [SELECT Id FROM UserRole WHERE Name = 'COO'];
		
		//Insert new user        
        User u = new User(username = uname, alias = al, email = em, lastname = lname, profileId = p.id, userroleId = r.id, emailencodingkey='UTF-8',
                          		languagelocalekey='en_US', timezonesidkey='America/Los_Angeles', localesidkey='en_US');
        insert u;
   }
}

//Future_HandleMixDmlError.insertNewAcoount();
//Future_HandleMixDmlError.insertUserWithRole('Subham@fexle.com', 'sufex','shailendra.sharma@fexle.com','Sharma');