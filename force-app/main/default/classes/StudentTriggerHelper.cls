/**
*
*  Purpose          :	Helper Class for Trigger on Student object.
*
*  Created Date     :  	10/07/2022
*
*  Created By       :  	Shailendra Sharma
*
*  Revision Logs    :  	V_1.0 - Created
*
**/
public without sharing class StudentTriggerHelper {
    
    //Method
    public static void updateNoOfStudentsDetailsOnSchool(List<Student__c> newListOfStudents, Map<Id, Student__c> mapOfOldStudents) {
        
        // Map to hold school Id as a key and other school details as values.
        Map<Id, School__c> mapOfSchool = new Map<Id, School__c>();
        
        for(Student__c student : (newListOfStudents != null ? newListOfStudents : mapOfOldStudents.values())){
            
            // Check valid conditions for insert delete and update
            if(mapOfOldStudents == null || newListOfStudents == null || (mapOfOldStudents != null && student.School__c != mapOfOldStudents.get(student.Id).School__c)){
                
                if(student.School__c != null)//Check for insert and delete
                    mapOfSchool.put(student.School__c, new School__c(Id = student.School__c, No_of_Students__c = 0));
                
                if(mapOfOldStudents!= null && mapOfOldStudents.get(student.Id).School__c != null){// Check for update
                    
                    mapOfSchool.put(student.School__c, new School__c(Id = student.School__c, No_of_Students__c = 0));
                    mapOfSchool.put( mapOfOldStudents.get(student.Id).School__c, 
                                    new School__c(Id =  mapOfOldStudents.get(student.Id).School__c, No_of_Students__c = 0 )); 
                }
            }
        }
        
        // Check map is not empty
        if(!mapOfSchool.isEmpty()){
            
            // Aggregate query to get total no of students on school
            for(AggregateResult agg : [SELECT School__c SchoolId, COUNT(Id)TotalStudents FROM Student__c 
                                       WHERE School__c IN :mapOfSchool.keySet() GROUP BY School__c])
                
                mapOfSchool.get((Id)agg.get('SchoolId')).No_of_Students__c = (Integer)agg.get('TotalStudents');
            
            if(!mapOfSchool.isEmpty())
                
                update mapOfSchool.values();   	
        }
    }
    
    //Method
    public static void updateNoOfStudentsDetailsOnClass(List<Student__c> newListOfStudents, Map<Id, Student__c> mapOfOldStudents) {
        
        // Map to hold school Id as a key and other school details as values.
        Map<Id, Class__c> mapOfClasses = new Map<Id, Class__c>();
        
        for(Student__c student : (newListOfStudents != null ? newListOfStudents : mapOfOldStudents.values())){
            
            // Check valid conditions for insert delete and update
            if(mapOfOldStudents == null || newListOfStudents == null || (mapOfOldStudents != null && student.Class__c != mapOfOldStudents.get(student.Id).Class__c)){
                
                if(student.Class__c != null)//Check for insert and delete
                    mapOfClasses.put(student.Class__c, new Class__c(Id = student.Class__c, Number_of_Students__c = 0));
                
                if(mapOfOldStudents!= null && mapOfOldStudents.get(student.Id).Class__c != null){ // Check for update
                    
                    mapOfClasses.put(student.Class__c, new Class__c(Id = student.Class__c, Number_of_Students__c = 0));
                    mapOfClasses.put( mapOfOldStudents.get(student.Id).Class__c, 
                                     new Class__c(Id =  mapOfOldStudents.get(student.Id).Class__c, Number_of_Students__c = 0 ));
                }
            }
        }
        
        // Check map is not empty
        if(!mapOfClasses.isEmpty()){
            	
            // Aggregate query to get total no of students on school
            for(AggregateResult agg : [SELECT Class__c ClassId, COUNT(Id)TotalStudents FROM Student__c 
                                       WHERE Class__c IN :mapOfClasses.keySet() GROUP BY Class__c])
                
                mapOfClasses.get((Id)agg.get('ClassId')).Number_of_Students__c = (Integer)agg.get('TotalStudents');
            
            if(!mapOfClasses.isEmpty())
                
                update mapOfClasses.values();   	
        }
    }
    
    //Method
    public static void updateSchoolOnStudentDetails(List<Student__c> newListOfStudents, Map<Id, Student__c> oldMapOfStudents){
        
        //Map to hold classes Ids as a key and students details as values.
        Map<Id, Student__c> mapOfIdsOfClassesAndStudentsDetails = new Map<Id, Student__c>(); 
        
        for(Student__c stu : newListOfStudents){
           
            // Check condition to fill the map.
            if(newListOfStudents != null || stu.Class__c != null && stu.Class__c != oldMapOfStudents.get(stu.Id).Class__c)
                
           		mapOfIdsOfClassesAndStudentsDetails.put(stu.Class__c, stu);
        }
        
        // Check map is not empty
        if(!mapOfIdsOfClassesAndStudentsDetails.isEmpty()){
            
            for(Class__c cls :[SELECT ID, School__c From Class__c WHERE ID IN :mapOfIdsOfClassesAndStudentsDetails.keySet()])
                
                mapOfIdsOfClassesAndStudentsDetails.get(cls.Id).School__c = cls.School__c;
        }  
    }
}