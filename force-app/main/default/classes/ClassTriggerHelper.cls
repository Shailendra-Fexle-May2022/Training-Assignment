/**
*
*  Purpose          :	Helper Class for Trigger on Class object.
*
*  Created Date     :  	10/07/2022
*
*  Created By       :  	Shailendra Sharma
*
*  Revision Logs    :  	V_1.0 - Created
*
**/
public without sharing class ClassTriggerHelper {
    
    public static void updateNoOfClassesDetails(List<Class__c> newListOfClass, Map<Id, Class__c> mapOfOldClass) {
	
        //Map to hold updated Class details
        Map<Id, School__c> mapOfSchools = new Map<Id, School__c>();

        //Traverse on Class
        for(Class__c cls : (newListOfClass != null ? newListOfClass : mapOfOldClass.values())){
			
            //Check valid conditions for insert update and delete
            if(mapOfOldClass == null || newListOfClass == null || (mapOfOldClass != null && cls.School__c != mapOfOldClass.get(cls.Id).School__c )){
               
                if(cls.School__c != null){//For Insert and Delete
                	mapOfSchools.put(cls.School__c, new School__c(Id = cls.School__c, No_of_Classes__c = 0, No_of_Students__c = 0));
                }
				
                if(mapOfOldClass != null && mapOfOldClass.get(cls.Id).School__c != null) { // For Update
                    
                    mapOfSchools.put( mapOfOldClass.get(cls.Id).School__c, new School__c(Id =  mapOfOldClass.get(cls.Id).School__c, No_of_Classes__c = 0 , No_of_Students__c = 0));
                    mapOfSchools.put(cls.School__c, new School__c(Id = cls.School__c, No_of_Classes__c = 0, No_of_Students__c = 0));
                }
            }
        }

        //Check Map is not empty
        if(!mapOfSchools.isEmpty()){
            
            for(AggregateResult agg : [SELECT School__c SchoolId, COUNT(Id)TotalClasses, SUM(Number_of_Students__c)TotalStudents 
                                       					FROM Class__c WHERE School__c IN :mapOfSchools.keySet() GROUP BY School__c]){
                                                         
                mapOfSchools.get((Id)agg.get('SchoolId')).No_of_Classes__c = (Integer)agg.get('TotalClasses');
                mapOfSchools.get((Id)agg.get('SchoolId')).No_of_Students__c = (Decimal)agg.get('TotalStudents');
            }
            
            if(!mapOfSchools.isEmpty())
                
                update mapOfSchools.values();             
        }
    }
    
    //Method
    public static void updateSchoolOnStudent(List<Class__c> newListOfClass, Map<Id, Class__c> mapOfOldClass){
       
       //Set to hold Ids of classes.
        Set<Id> setOfClassesIds = new Set<Id>();
        
        for(Class__c cls :newListOfClass){
            
            if(mapOfOldClass != null && cls.School__c != mapOfOldClass.get(cls.Id).School__c){
                setOfClassesIds.add(cls.Id);
            }
        }
        
        // Check Set of Ids is not empty
        If(!setOfClassesIds.isEmpty()){
            
            // Query on student records to get students parent and grand parent Ids.
            List<Student__c> listOfStudentsDetails = [SELECT ID, School__c, Class__c, Class__r.School__c 
                                                      	FROM Student__c WHERE Class__c IN :setOfClassesIds];
             
            for(Student__c stu : listOfStudentsDetails)
                
                stu.School__c = stu.Class__r.School__c;
           
            // Check listOfStudentsDetails is not empty
            if(!listOfStudentsDetails.isEmpty())
                
            	update listOfStudentsDetails;
        }  
    }
}