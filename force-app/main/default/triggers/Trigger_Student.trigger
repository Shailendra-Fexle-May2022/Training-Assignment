/**
*
*  Purpose          :	Trigger on Student object.
*
*  Created Date     :  	10/07/2022
*
*  Created By       :  	Shailendra Sharma
*
*  Revision Logs    :  	V_1.0 - Created
*
**/
trigger Trigger_Student on Student__c (before insert, before update, after insert, after update, after delete, after undelete) {

    if(Trigger.isAfter)
        if(Trigger.isInsert || Trigger.isUpdate || Trigger.isDelete || Trigger.isUndelete){
            StudentTriggerHelper.updateNoOfStudentsDetailsOnSchool(Trigger.new, Trigger.oldMap);
            StudentTriggerHelper.updateNoOfStudentsDetailsOnClass(Trigger.new, Trigger.oldMap);
        }
    
    if(Trigger.isbefore){
        if(Trigger.isInsert || Trigger.isUpdate){
            StudentTriggerHelper.updateSchoolOnStudentDetails(Trigger.new, Trigger.oldMap);
        }
    }
}