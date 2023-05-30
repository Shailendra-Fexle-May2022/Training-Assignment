/**
*
*  Purpose          :   Trigger on School object.
*
*  Created Date     :   10/07/2022
*
*  Created By       :   Shailendra Sharma
*
*  Revision Logs    :   V_1.0 - Created
*
**/
trigger Trigger_School on School__c (before update, after update) {
    
    try{
        
        if(Utilities.BypassAllTriggers) 
            return;
        
        if(Trigger.isBefore){
            
            if(Trigger.isUpdate){
                
               	//SchoolTriggerHelper.updateNoOfStudentsDetails(Trigger.new, Trigger.oldMap);
                //SchoolTriggerHelper.updateNoOfClassDetails(Trigger.new, Trigger.oldMap);
                //SchoolTriggerHelper.updateNoOfStudentsDetailsOnSchoolInBeforeTrigger(Trigger.newMap, Trigger.oldMap);
                //SchoolTriggerHelper.updateNoOfClassesDetailsOnSchoolInBeforeTrigger(Trigger.new, Trigger.oldMap);
                SchoolTriggerHelper.updateNoOfClassesDetailsOnSchoolInBeforeTriggerUsingParentToChildQuery(Trigger.new, Trigger.oldMap);
                SchoolTriggerHelper.updateNoOfStudentsDetailsOnSchoolInBeforeTriggerUsingParentToChildQuery(Trigger.new, Trigger.oldMap);   
            }
        }
        
        if(Trigger.isAfter ){
            
            if(Trigger.isUpdate){
                
                //SchoolTriggerHelper.doApexSharingCalculations(Trigger.new, Trigger.oldMap);
                //SchoolTriggerHelper.updateNoOfStudentsDetails(Trigger.new, Trigger.oldMap);
                //SchoolTriggerHelper.updateNoOfClassDetails(Trigger.new, Trigger.oldMap);
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