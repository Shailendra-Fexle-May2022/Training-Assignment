/**
*
*  Purpose          :	Trigger on Account object.
*
*  Created Date     :  	10/07/2022
*
*  Created By       :  	Shailendra Sharma
*
*  Revision Logs    :  	V_1.0 - Created
*
**/
trigger Trigger_Account on Account (before delete, after delete, after update) {
    
    try{
        
        if(Utilities.BypassAllTriggers) 
            return;
        
        if(Trigger.isAfter){
            
            if(Trigger.isUpdate){
                // AccountTriggerHelper.updatePhoneNumberOnRelatedContact(Trigger.new, Trigger.oldMap);
                AccountTriggerHandler.deleteChildContactsOnParentAccountTypeChanged(Trigger.new, Trigger.oldMap);
            //System.enqueueJob(new Queueable_DeleteRelatedContactsOfAccount(Trigger.new, Trigger.oldMap));// Call queueable class
            }
            
            if(Trigger.isDelete){
                
               AccountTriggerHandler.deleteChildContactsOnParentAccountDeleteOnAfter(Trigger.oldMap);
            }
        }
        
        if(Trigger.isBefore){
            
            if(Trigger.isDelete){
                
               //AccountTriggerHandler.deleteChildContactsOnParentAccountDelete(Trigger.oldMap); 
            }
        }
    }
    
    catch(Exception e)
    {
        integer i=0;
        if(Trigger.isDelete)
            Trigger.Old[i].addError(e.getMessage());
        else
            Trigger.New[i].addError(e.getMessage());
    } 
}