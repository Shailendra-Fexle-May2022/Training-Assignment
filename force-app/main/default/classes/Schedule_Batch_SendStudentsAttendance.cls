/**
*
*  Purpose          :   Schedule class to send email alert of those students parents whose attedance is less than 75% on given schedule time. .
*
*  Created Date     :   20/10/2022
*
*  Created By       :   Shailendra Sharma
*
*  Revision Logs    :   V_1.0 - Created
*
**/
public without sharing class Schedule_Batch_SendStudentsAttendance implements Schedulable{
	
    public void execute(SchedulableContext SC){
        
        Batch_SendStudentsAttendance studentAttendanceBatch = new Batch_SendStudentsAttendance();
        studentAttendanceBatch.query = 'SELECT Id, Name, Attendance__c FROM Student__c WHERE Attendance__c < 75';
        DataBase.executeBatch(studentAttendanceBatch, 200);
    }
}

    /*Schedule_Batch_SendStudentsAttendance SC = new Schedule_Batch_SendStudentsAttendance();
    String CORN_EXP = '0 0 13 * 10 ? 2022';
    String jobID = System.Schedule('Send Email Job',CORN_EXP,SC1);*/