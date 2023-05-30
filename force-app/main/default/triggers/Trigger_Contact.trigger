/**
 *  Purpose          :    This trigger is to handle all the pre abd post processing operations for Contact object.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/08/31
 *  Revision Logs    :    V_1.0 - Created - 2022/08/31
 **/ 
trigger Trigger_Contact on Contact (before insert, before update, after insert,after update,after delete) {

    if(Trigger.isAfter){
            ContactTriggerHelper.populateContactsOnAccount(Trigger.new , Trigger.oldMap);
    }
    
    if(Trigger.isBefore){
         
		ContactTriggerHelper.updateLastNameByAccountLastName(Trigger.new , Trigger.oldMap);
    }
    
}