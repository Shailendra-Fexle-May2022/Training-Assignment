/**
*
*  Purpose          :	Trigger on Class object.
*
*  Created Date     :  	10/07/2022
*
*  Created By       :  	Shailendra Sharma
*
*  Revision Logs    :  	V_1.0 - Created
*
**/
trigger Trigger_Class on Class__c (after insert, after update, after delete, after undelete) {
    
    if(Trigger.isAfter)
        if(Trigger.isInsert || Trigger.isUpdate || Trigger.isDelete || Trigger.isUndelete){
            ClassTriggerHelper.updateNoOfClassesDetails(Trigger.new, Trigger.oldMap);
         	ClassTriggerHelper.updateSchoolOnStudent(Trigger.new, Trigger.oldMap); 
        }        
}