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
public without sharing  class CountsManager1 {
    
    public static void updateNoOfStudentsDetails(String schoolName){
        
        //Query on school for getting school Id.
        List<School__c> listOfSchool = [SELECT Id, No_of_Students__c,Name FROM School__c WHERE Name = :schoolName];
        
        //Map to hold schoolIds as a key amd school details as values.
        Map<Id, School__c> mapofSchoolWithTotalNoOfStudents  = new Map<Id, School__c>();
        
        //Check List is not empty
        if(!listOfSchool.isEmpty()){
            
            for(School__c school : listOfSchool) 
                
                mapofSchoolWithTotalNoOfStudents.put(school.id, new School__c(Id = school.id, No_of_Students__c = 0 ));
        }
        else
            System.debug('Unable to find out a school for given name');
        
        //Check Map is not empty
        if(!mapofSchoolWithTotalNoOfStudents.isEmpty()){
            
            // Aggregate query to get total no of students in the corresponding school
            for(AggregateResult aggre: [SELECT COUNT(Id)NoOfStudents, School__c schoolId FROM Student__c 
                                        WHERE School__c IN : mapofSchoolWithTotalNoOfStudents.keySet() GROUP BY School__c])
                
                mapofSchoolWithTotalNoOfStudents.get((Id)aggre.get('schoolId')).No_of_Students__c = (Integer)aggre.get('NoOfStudents');
            
            
            //Update students count on the school.
            if(!mapofSchoolWithTotalNoOfStudents.isEmpty())
                
                update mapofSchoolWithTotalNoOfStudents.values();
        }
    }
    
    //Method
    public static void updateNoOfClassesDetails(Id schoolId){
        
        //Empty Map of school with key schoolId and No of schooldetails as values.
        Map<Id, School__c> mapofSchoolWithTotalNoOfclasses = new Map<Id, School__c>();
        
        List<School__c> listOfSchool = [SELECT Id, No_of_Students__c,Name FROM School__c WHERE Id = :schoolId];
        
        //Check List is not empty
        if(!listOfSchool.isEmpty()){
            
            for(School__c school : listOfSchool)
                
                mapofSchoolWithTotalNoOfclasses.put(school.id, new School__c(Id = school.id, No_of_Classes__c = 0 ));
        }
        else
            System.debug('Unable to find out a school for given record ID'); 
        
        //Check Map is not empty
        if(!mapofSchoolWithTotalNoOfclasses.isEmpty()){
            
            // Aggregate query to get total no of classes in the corresponding school
            for(AggregateResult aggre: [SELECT COUNT(Id)NoOfClasses, School__c schoolId FROM Class__c 
                                        WHERE School__c IN :mapofSchoolWithTotalNoOfclasses.keySet() GROUP BY School__c])
                
                mapofSchoolWithTotalNoOfclasses.get((Id)aggre.get('schoolId')).No_of_Classes__c = (Integer)aggre.get('NoOfClasses');
            
            //Update classes count on the school.
            if(!mapofSchoolWithTotalNoOfclasses.isEmpty())
                
                update mapofSchoolWithTotalNoOfclasses.values();
        } 
    }
    
    //Method
    public static void doCalculationForNoOfStudentsInBeforeTrigger(Map<Id, School__c> mapOfSchool){
        
        //Empty Map of school with key schoolId and No of schooldetails as values.
        Map<Id, School__c> mapofSchoolWithTotalNoOfStudent  = new Map<Id, School__c>();
        
        //Check Map values is not empty
        if(!mapOfSchool.isEmpty()){
            
            for(School__c school : mapOfSchool.values()) 
                
                mapofSchoolWithTotalNoOfStudent.put(school.Id, new School__c(Id = school.Id, No_of_Students__c = 0 ));
        }
        
        //Check Map is not empty
        if(!mapofSchoolWithTotalNoOfStudent.isEmpty()){
            
            // Aggregate query to get total no of students in the corresponding school
            for(AggregateResult aggre: [SELECT COUNT(Id)NoOfStudents, School__c schoolId FROM Student__c 
                                        WHERE School__c IN : mapofSchoolWithTotalNoOfStudent.keySet() GROUP BY School__c])
                
                mapOfSchool.get((Id)aggre.get('schoolId')).No_of_Students__c = (Integer)aggre.get('NoOfStudents');                       
        }   
    }
    
    //Method
    public static void doCalculationForNoOfStudentsInAfterTrigger(Map<Id, School__c> mapOfSchool) {
        
        //Empty Map of school with key schoolId and No of schooldetails as values.
        Map<Id, School__c> mapofSchoolWithTotalNoOfStudent  = new Map<Id, School__c>();
        
        //Check Map values is not empty
        if(!mapOfSchool.isEmpty()){
            
            for(School__c school : mapOfSchool.values())
                
                mapofSchoolWithTotalNoOfStudent.put(school.id, new School__c(Id = school.id, No_of_Students__c = 0 ));
        }
        
        //Check Map is not empty
        if(!mapofSchoolWithTotalNoOfStudent.isEmpty()){
            
            // Aggregate query to get total no of students in the corresponding school
            for(AggregateResult aggre: [SELECT COUNT(Id)NoOfStudents, School__c schoolId FROM Student__c 
                                        WHERE School__c IN : mapofSchoolWithTotalNoOfStudent.keySet() GROUP BY School__c])
                
                mapofSchoolWithTotalNoOfStudent.get((Id)aggre.get('schoolId')).No_of_Students__c = (Integer)aggre.get('NoOfStudents');
            
            //Update students count on the school.
            if(!mapofSchoolWithTotalNoOfStudent.isEmpty())
                
                update mapofSchoolWithTotalNoOfStudent.values();
        }
    }
    
    //Method
    public static void doCalculationForNoOfSClassesInBeforeTrigger(Map<Id, School__c> mapOfSchool){
        
        //Empty Map of school with key schoolId and No of schooldetails as values.
        Map<Id, School__c> mapofSchoolWithTotalNoOfClasses  = new Map<Id, School__c>();
        
        //Check Map values is not empty
        if(!mapOfSchool.isEmpty()){
            
            for(School__c school : mapOfSchool.values()) 
                
                mapofSchoolWithTotalNoOfClasses.put(school.id, new School__c(Id = school.id, No_of_Classes__c = 0 ));
        }
        
        //Check Map is not empty
        if(!mapofSchoolWithTotalNoOfClasses.isEmpty()){
            
            // Aggregate query to get total no of students in the corresponding school
            for(AggregateResult aggre: [SELECT COUNT(Id)NoOfClasses, School__c schoolId FROM Class__c 
                                        WHERE School__c IN : mapofSchoolWithTotalNoOfClasses.keySet() GROUP BY School__c])
                
                mapOfSchool.get((Id)aggre.get('schoolId')).No_of_Classes__c = (Integer)aggre.get('NoOfClasses');                                                            
        }        
    }
    
    //Method
    public static void doCalculationForNoOfClassesInAfterTrigger(Map<Id, School__c> mapOfSchool) {
        
        //Empty Map of school with key schoolId and No of schooldetails as values.
        Map<Id, School__c> mapofSchoolWithTotalNoOfClasses  = new Map<Id, School__c>();
        
        //Check Map values is not empty
        if(!mapOfSchool.isEmpty()){
            
            for(School__c school : mapOfSchool.values())
                mapofSchoolWithTotalNoOfClasses.put(school.id, new School__c(Id = school.id, No_of_Classes__c = 0 ));
        }
        
        //Check Map is not empty
        if(!mapofSchoolWithTotalNoOfClasses.isEmpty()){
            
            // Aggregate query to get total no of students in the corresponding school
            for(AggregateResult aggre: [SELECT COUNT(Id)NoOfClasses, School__c schoolId FROM Class__c 
                                        WHERE School__c IN : mapofSchoolWithTotalNoOfClasses.keySet() GROUP BY School__c])
                
                mapofSchoolWithTotalNoOfClasses.get((Id)aggre.get('schoolId')).No_of_Classes__c = (Integer)aggre.get('NoOfClasses');
            
            //Update Class count on the school.
            if(!mapofSchoolWithTotalNoOfClasses.isEmpty())
                
                update mapofSchoolWithTotalNoOfClasses.values();
        }
    }
}