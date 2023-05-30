public class SchoolClassStudentDetails {
    public static Map<String, Map<String, List<String>>> mapOfSchoolNameWithClassNameAndRelatedStudentsDetails = new Map<String, Map<String, List<String>>>();
    public static void fillMapDynamically(){
        
        List<Student__c> listOfStudents = [SELECT Id,Name,Class__r.Name,Class__r.School__r.Name FROM Student__c];
        List<Class__c> listOfClass = [SELECT Id,Name,School__r.Name FROM Class__c];
        List<School__c> listOfSchool = [SELECT Id,Name FROM School__c];
        
        Map<String,List<String>> mapOfClassWithStudents = new  Map<String,List<String>>();
        
        for(Student__c student : listOfStudents){
            System.debug(student);
            
            if(mapOfClassWithStudents.containsKey(student.Class__r.Name)){
                mapOfClassWithStudents.get(student.Class__r.Name).add(student.Name);
            }
            else{
                mapOfClassWithStudents.put(student.Class__r.Name, new List<String>{student.Name});
            }   
        }
        System.debug(mapOfClassWithStudents);
        
        Map<String, List<String>> mapOfSchoolWithClasses = new Map<String, List<String>>();
        
        for(Class__c cls : listOfClass){
              System.debug(cls);
            
            if(mapOfSchoolWithClasses.containsKey(cls.School__r.Name)){
                mapOfSchoolWithClasses.get(cls.School__r.Name).add(cls.Name);
            }
            else{
                mapOfSchoolWithClasses.put(cls.School__r.Name, new List<String>{cls.Name});
            } 
            System.debug(mapOfSchoolWithClasses);
        }
        
        for(String school : mapOfSchoolWithClasses.keySet()){
            System.debug(school);
            if(!mapOfSchoolNameWithClassNameAndRelatedStudentsDetails.containsKey(school)){
                mapOfSchoolNameWithClassNameAndRelatedStudentsDetails.put(school, new Map<String, List<String>>());
                if(mapOfSchoolNameWithClassNameAndRelatedStudentsDetails.containsKey(school)){
                    for(String cls :mapOfSchoolWithClasses.get(school)){
                        mapOfSchoolNameWithClassNameAndRelatedStudentsDetails.get(school).put(cls,new List<String>());
                        for(String student : mapOfClassWithStudents.get(cls)){
                            List<String> st = new List<String>();
                            if(mapOfSchoolNameWithClassNameAndRelatedStudentsDetails.get(school).containsKey(cls)){
                                st.add(student);
                               mapOfSchoolNameWithClassNameAndRelatedStudentsDetails.get(school).get(cls).addAll(st); 
                            }
                        }
                    }
                }
            }
            
        }
        System.debug(mapOfSchoolNameWithClassNameAndRelatedStudentsDetails);
        
    }
}