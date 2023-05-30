/**
 *  Purpose          :    This trigger is to handle all the pre abd post processing operations for Contact object.
 *  Created By       :    Shailendra Sharma
 *  Created Date     :    2022/09/6
 *  Revision Logs    :    V_1.0 - Created - 2022/09/6
 **/ 
trigger Trigger_Opportunity on Opportunity (before insert, before update,after insert,after update) {

    if(trigger.isBefore){
       OpportunityTriggerHandler.updateStageOnLifeCycle(Trigger.new, Trigger.oldMap);
   }
    if(trigger.isAfter){
      // OpportunityTriggerHelper.sumOfAmountOnAccount(Trigger.new, Trigger.oldMap);
    }
}