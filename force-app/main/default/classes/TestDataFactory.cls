/**
*
*  Purpose          :	Factory class to create test data for testing prospective.
*
*  Created Date     :  	14/10/2022
*
*  Created By       :  	Shailendra Sharma
*
*  Revision Logs    :  	V_1.0 - Created
*
**/
@isTest(seeAllData = false)
public without sharing class TestDataFactory {

    //Method to create the test data for School object
    @isTest(seeAllData = false)
    public static List<School__c> createListOfSchoolsTestData() {

        List<School__c> listOfNewInsertedSchool = (List<School__c>)SmartFactory.createSObjectList(Constants.OBJECT_NAME_SCHOOL, false, 5);
   
        for(School__c sc : listOfNewInsertedSchool){
          		
              sc.No_of_Teachers__c = 0;
              sc.Active__c = True;
        }

        Utilities.BypassAllTriggers = True;
        insert listOfNewInsertedSchool;
        Utilities.BypassAllTriggers = false;
        System.assertEquals(5, listOfNewInsertedSchool.size());
		System.debug('listOfNewInsertedSchool'+listOfNewInsertedSchool);
        return listOfNewInsertedSchool;
    }

    //Method to create the test data for Class object
    @isTest(seeAllData = false)
    public static List<Class__c> createListOfClaeessTestData(){

        List<School__c> schools = TestDataFactory.createListOfSchoolsTestData();
        System.assertEquals(5, schools.size());

        List<Class__c> listOfNewInsertedClasses = (List<Class__c>)SmartFactory.createSObjectList(Constants.OBJECT_NAME_CLASS, false, 5);

        Integer count = 0;
        for(Class__c cls : listOfNewInsertedClasses){

            if(count >= 2){
                cls.School__c = schools[1].Id;
            }
            else{
                cls.School__c = schools[0].Id;
            }
            count ++;
        }

        Utilities.BypassAllTriggers = True;
        insert listOfNewInsertedClasses;
        Utilities.BypassAllTriggers = false;

        List<Class__c> classesResults = [SELECT ID FROM Class__c WHERE School__c = :schools[0].Id];
        System.assertEquals(2, classesResults.size());

        classesResults = [SELECT ID FROM Class__c WHERE School__c = :schools[1].Id];
        System.assertEquals(3, classesResults.size());
        return listOfNewInsertedClasses;
    }

    //Method to create the test data for Class object
    @isTest(seeAllData = false)
    public static List<Class__c> createListOfClaeessTestDataWithTriggerEnabled(){

        List<School__c> schools = TestDataFactory.createListOfSchoolsTestData();
        System.assertEquals(5, schools.size());

        List<Class__c> listOfNewInsertedClasses = (List<Class__c>)SmartFactory.createSObjectList(Constants.OBJECT_NAME_CLASS, false, 5 );

        Integer count = 0;
        for(Class__c cls : listOfNewInsertedClasses){

            if(count >= 2){
                cls.School__c = schools[1].Id;
            }
            else{
                cls.School__c = schools[0].Id;
            }
            count ++;
        }

        insert listOfNewInsertedClasses;
        
        List<Class__c> classesResults = [SELECT ID FROM Class__c WHERE School__c = :schools[0].Id];
        System.assertEquals(2, classesResults.size());

        classesResults = [SELECT ID FROM Class__c WHERE School__c = :schools[1].Id];
        System.assertEquals(3, classesResults.size());

        List<School__c> schoolResults = [SELECT ID, No_of_Classes__c FROM School__c WHERE ID = :schools[0].Id];

        System.assertEquals(2, schoolResults[0].No_of_Classes__c);
        System.assertEquals(1, schoolResults.size());

        schoolResults = [SELECT ID, No_of_Classes__c FROM School__c WHERE ID = :schools[1].Id];

        System.assertEquals(3, schoolResults[0].No_of_Classes__c);
        System.assertEquals(1, schoolResults.size());

        return listOfNewInsertedClasses;
    }

    //Method to create the test data for Student object
    @isTest(seeAllData = false)
    public static List<Student__c> createListOfStudentsTestData(){

        List<Class__c> classes = TestDataFactory.createListOfClaeessTestData();
        System.assertEquals(5, classes.size());

        List<Student__c> listOfNewInsertedStudents = (List<Student__c>)SmartFactory.createSObjectList(Constants.OBJECT_NAME_STUDENT, false, 5);
        System.assertEquals(5, listOfNewInsertedStudents.size());

        Integer count = 0;
        for(Student__c stu : listOfNewInsertedStudents){
            if(count >= 2){
                stu.Class__c = classes[1].Id;
                stu.School__c = classes[1].School__c;
            }
            else{
                stu.Class__c = classes[0].Id;
                stu.School__c = classes[0].School__c;
            }
           count ++;   
        }

        Utilities.BypassAllTriggers = True;
        insert listOfNewInsertedStudents;
        Utilities.BypassAllTriggers = false;

        List<Student__c> students = [SELECT ID FROM Student__c WHERE Class__c = :classes[0].Id];
        System.assertEquals(2, students.size());

        students = [SELECT ID FROM Student__c WHERE Class__c = :classes[1].Id];
        System.assertEquals(3, students.size());

        return listOfNewInsertedStudents;
    }

    //Method to create the test data for Student object
    @IsTest(seeAllData=false)
    public static List<Student__c> createListOfStudentsTestDataWithTriggerEnabled() {

        List<Class__c> classes = TestDataFactory.createListOfClaeessTestDataWithTriggerEnabled();
        System.assertEquals(5, classes.size());

        List<Student__c> listOfNewInsertedStudents = (List<Student__c>)SmartFactory.createSObjectList(Constants.OBJECT_NAME_STUDENT, false, 5);
        System.assertEquals(5, listOfNewInsertedStudents.size());

        Integer count = 0;
        for(Student__c stu : listOfNewInsertedStudents){
            if(count >= 2){
                stu.Class__c = classes[1].Id;
                stu.School__c = classes[1].School__c;
            }
            else{
                stu.Class__c = classes[0].Id;
                stu.School__c = classes[0].School__c;
            }
           count ++;   
        }

        insert listOfNewInsertedStudents;

        List<Student__c> students = [SELECT ID FROM Student__c WHERE Class__c = :classes[0].Id];
        System.assertEquals(2, students.size());

        students = [SELECT ID FROM Student__c WHERE Class__c = :classes[1].Id];
        System.assertEquals(3, students.size());

        return listOfNewInsertedStudents;
    }
    
    //Method to create the test Attendance data for Student object
    @IsTest(seeAllData=false)
    public static List<Student__c> createListOfStudentsAttendanceTestData() 
    {
        List<Class__c> classes = TestDataFactory.createListOfClaeessTestData();
        System.assertEquals(5, classes.size());
        
        List<Student__c> students = (List<Student__c>)SmartFactory.createSObjectList(Constants.OBJECT_NAME_STUDENT, false, 3);
        System.assertEquals(3, students.size());
        
        Integer cnt = 0;
        for(Student__c st : students) 
        {
            if(cnt == 0 ) 
            {	
                st.Attendance__c = 67;
            	st.Class__c = classes[0].Id;  
                st.School__c = classes[0].School__c;
            }
            else if(cnt > 0 && cnt <= 1) 
            {	
                 st.Attendance__c = 70;
                st.Class__c = classes[1].Id;
                st.School__c = classes[1].School__c;
            }
            else{
                st.Attendance__c = 80;
                st.Class__c = classes[2].Id;
                st.School__c = classes[2].School__c;
            }
            cnt++;
        }
        
        Utilities.BypassAllTriggers = true;
        insert students;
        Utilities.BypassAllTriggers = false;
        
        return students;
    }
      //Method to create the test data for User objet
    @isTest(seeAllData = false)
    public static List<User> createListOfUsersTestData() {
        
        List<User> users = (List<User>)SmartFactory.createSObjectList(Constants.OBJECT_NAME_USER, false, 2);
        for(User us : users){

            us.isActive = True;
        }
        
        Utilities.BypassAllTriggers = True;
        insert users;
        Utilities.BypassAllTriggers = false;
        System.assertEquals(2, users.size());

        return users;
    }
    //Method to create the test data for Web Service Log objet
    @isTest(seeAllData = false)
    public static List<Web_Service_Log__c> createListOfWebServiceLogTestData() {

        List<Web_Service_Log__c> listOfNewInsertedWebServiceLog = (List<Web_Service_Log__c>)SmartFactory.createSObjectList(Constants.OBJECT_NAME_WEB_SERVICE_LOG, false, 1);

        Utilities.BypassAllTriggers = True;
        insert listOfNewInsertedWebServiceLog;
        Utilities.BypassAllTriggers = false;
        
        System.assertEquals(1, listOfNewInsertedWebServiceLog.size());
        
		System.debug('listOfNewInsertedWebServiceLog'+listOfNewInsertedWebServiceLog);
        return listOfNewInsertedWebServiceLog;
    }
}