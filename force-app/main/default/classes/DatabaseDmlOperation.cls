/**
*
*  Purpose          :   Class to demonstrate the DtatBase DML Operation.
*
*  Created Date     :   09/10/2022
*
*  Created By       :   Shailendra Sharma
*
*  Revision Logs    :   V_1.0 - Created
*
**/
public without sharing  class DatabaseDmlOperation {
	//Method for insert records
    public static void dataBase_InsertMethod(){
        
        //Create a  list of account
       List<Account> newAccountList = new List<Account>();
        
        // Add account records to account list
        newAccountList.add(new Account(Name = 'DatacaseDml+Test-1', Phone = '3245567', Industry = 'Banking'));
        newAccountList.add(new Account(Name = 'DatacaseDml+Test-2', Phone = '5645567', Industry = 'Contruction'));
       
        //Bulk insert all account records in DML call
        Database.SaveResult[] accListToBeInserted = Database.insert(newAccountList,false);
        
        for(Database.SaveResult dsr : accListToBeInserted){
            if(dsr.isSuccess()){
                // Get RecordId if record is successfully inserted.
                System.debug('Id of successfylly inserted account:' +dsr.getId());
            }
            else{
                //Operation failed, so get all error.
                for(Database.Error err : dsr.getErrors()){
                   System.debug(err.getStatusCode() +':'+ err.getMessage());
                   System.debug('Account field affected this error:' +err.getFields()); 
                }
            }
        }
        //Create a  list of contact
        List<Contact> newContactList = new List<Contact>();
         // Add account records to account list
        newContactList.add(new Contact(FirstName ='DatacaseDml', LeadSource = 'Web'));
        newContactList.add(new Contact(FirstName ='DatacaseDml', LastName = 'Test-1', Phone = '7547858745'));
       
        //Bulk insert all contact records in DML call
        Database.SaveResult[] conListToBeInserted = Database.insert(newContactList, false);
        
        for(Database.SaveResult dsr : conListToBeInserted){
            if(dsr.isSuccess()){
                // Get RecordId if record is successfully inserted.
                System.debug('Id of seccessfully inserted contact:' +dsr.getId());
            }
            else{
                //Operation failed, so get all error.
                for(Database.Error err : dsr.getErrors()){
                    System.debug(err.getStatusCode() +':'+ err.getMessage());
                    //REQUIRED_FIELD_MISSING:Required fields are missing: [LastName]
                    System.debug('Conatct field affected this error :'+ err.getFields());
                    // Contact field affected this error:(LastName) 
                }
            }
        }
    }
    //Method for update records
    public static void dataBase_UpdateMethod(){
        //Create a  list of account 
        List<Account> accList = new List<Account>();
         
        // Query of account record for updating and add these records to account list
        for(Account acc :[SELECT Id, Name, Industry, Rating FROM Account WHERE Name LIKE 'DatacaseDml%']){
            acc.Industry = 'Chemicals';
            acc.Rating = 'Hot';
            accList.add(acc);
        }
         //Bulk update all account records in DML call
        Database.SaveResult[] accListToBeUpdated = Database.update(accList, false);
        
        for(Database.SaveResult dsr : accListToBeUpdated){
            if(dsr.isSuccess()){
                // Get RecordId if record is successfully updated.
                System.debug('Id of seccessfully inserted contact:' +dsr.getId());
            }
            else{
                //Operation failed, so get all error.
                for(Database.Error err : dsr.getErrors()){
                    System.debug(err.getStatusCode() +':'+ err.getMessage());
                    System.debug('Account field affected this error:' +err.getFields()); 
                }
            }
        }
        //Create a  list of  conatct 
		List<Contact> conListToBeUpdated = new List<Contact>();  
        
        // Query of contact record for updating and add these records to contact list
        for(Contact con : [SELECT Id, Name,LeadSource, Phone FROM Contact WHERE Name LIKE 'Data%']){
            con.LeadSource = 'Phone Inquiry';
            con.Phone = '9984247657';
            con.LastName = ' ';
            conListToBeUpdated.add(con);
        }
        
         //Bulk update all contact records in DML call
        Database.SaveResult[] conList = Database.update(conListToBeUpdated,false);
        
        for(Database.SaveResult dsr : conList){
            if(dsr.isSuccess()){
                // Get RecordId if record is successfully updated.
                System.debug('The Id of successfully updated conatct record is :' +dsr.getId());
            }
            else{
                //Operation failed, so get all error.
                for(Database.Error err : dsr.getErrors()){
                    System.debug(err.getStatusCode() +':'+ err.getMessage());
                    //REQUIRED_FIELD_MISSING:Required fields are missing: [LastName]
                    System.debug('Contact field affected this error:' +err.getFields()); 
                   // Contact field affected this error:(LastName)
                }
            }
        }       
    }
    //Method for delete records
    public static void dataBase_DeleteMethod(){
        
       // Query of account record for deleting
       List<Account> accListToBeDeleted = [SELECT Id, Name FROM Account WHERE Name LIKE 'Del%'];
       
        //Bulk delete all account records in DML call
        Database.DeleteResult[] accList = Database.delete(accListToBeDeleted,false);
       
        for(Database.DeleteResult ddr : accList){
            if(ddr.isSuccess()){
                // Get RecordId if record is successfully deleted.
                System.debug('The Id of successfully deleted acccount record is :' +ddr.getId());
            }
            else{
                //Operation failed, so get all error.
                for(Database.Error err : ddr.getErrors()){
                    System.debug(err.getStatusCode() +':'+ err.getMessage());
                    System.debug('Contact field affected this error:' +err.getFields());  
                }
            }
        }  
    }
    //Method for undelete records
    public static void dataBase_UnDeleteMethod(){
        
        // Query of account record for undeleting
       List<Account> accListToBeUnDeleted = [SELECT Id, Name FROM Account WHERE Name LIKE 'Del%' ALL ROWS];
       
        //Bulk delete all account records in DML call
        Database.UnDeleteResult[] accList = Database.Undelete(accListToBeUnDeleted, false);
       
        for(Database.UnDeleteResult dur : accList){
            if(dur.isSuccess()){
                // Get RecordId if record is successfully deleted.
                System.debug('The Id of successfully deleted acccount record is :' +dur.getId());
            }
            else{
                //Operation failed, so get all error.
                for(Database.Error err : dur.getErrors()){
                    System.debug(err.getStatusCode() +':'+ err.getMessage());
                    System.debug('Contact field affected this error:' +err.getFields());  
                }
            }
        }  
    }
}