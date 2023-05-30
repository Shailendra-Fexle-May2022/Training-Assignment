/**
*
*  Purpose          :   Class to demonstrate the count of total classes and students on school.
*
*  Created Date     :   09/03/2022
*
*  Created By       :   Shailendra Sharma
*
*  Revision Logs    :   V_1.0 - Created
*
**/
public without sharing class CountsManager {
    //Method
    public static void updateNoOfStudentsDetails(String schoolName){
        
        //Query on school for getting school Id.
        List<School__c> listOfSchool = [SELECT Id, No_of_Students__c,Name FROM School__c WHERE Name = :schoolName];
        
        //Check List is not empty
        if(!listOfSchool.isEmpty()){
            
			List<School__c> listOfStudentsOfSchoolToBeUpdated = new List<School__c>();

            // Aggregate query to get total no of students in the corresponding school
            for(AggregateResult aggre: [SELECT COUNT(Id)NoOfStudents, School__c schoolId FROM Student__c WHERE School__c IN : listOfSchool GROUP BY School__c]){
                 
                System.debug(aggre);  
                School__c school = new School__c();
                school.Id = (Id)aggre.get('schoolId');
                school.No_of_Students__c = (Integer)aggre.get('NoOfStudents');
                   listOfStudentsOfSchoolToBeUpdated.add(school);
                }

            System.debug(listOfStudentsOfSchoolToBeUpdated);
            
            //Update students count on the school.
            if(!listOfStudentsOfSchoolToBeUpdated.isEmpty())
            update listOfStudentsOfSchoolToBeUpdated;
        }
        else
            System.debug('Unable to find out a school for given name');
    }
    
    //Method
    public static void updateNoOfClassesDetails(Id schoolId){
        
        List<School__c> listOfClassesOfSchoolToBeUpdated = new List<School__c>();

            // Aggregate query to get total no of classes in the corresponding school
            for(AggregateResult aggre: [SELECT COUNT(Id)NoOfClasses, School__c schoolId FROM Class__c WHERE School__c = :schoolId  GROUP BY School__c]){
                 
                System.debug(aggre);  
                School__c school = new School__c();
                school.Id = (Id)aggre.get('schoolId');
                school.No_of_Classes__c = (Integer)aggre.get('NoOfClasses');
                   listOfClassesOfSchoolToBeUpdated.add(school);
                }

            System.debug(listOfClassesOfSchoolToBeUpdated);
        
            //Update classes count on the school.
        if(!listOfClassesOfSchoolToBeUpdated.isEmpty()){
            update listOfClassesOfSchoolToBeUpdated;
        }
        else
         System.debug('Unable to find out a school for given record ID'); 
    }
}