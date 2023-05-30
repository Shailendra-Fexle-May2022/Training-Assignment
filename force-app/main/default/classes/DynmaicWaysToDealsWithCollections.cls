/**
*
*  Purpose          :   Class to demonstrate the dynamic ways to deal with or populate collections in apex.
*
*  Created Date     :   09/03/2022
*
*  Created By       :   Shailendra Sharma
*
*  Revision Logs    :   V_1.0 - Created
*
**/
public without sharing class DynmaicWaysToDealsWithCollections {

    // Map of School with classes and its corresponding students
    public static Map<String, Map<String, List<String>>> mapOfSchoolNameWithClassNameAndRelatedStudentsDetails = new Map<String, Map<String, List<String>>>();

    //Construction
    public DynmaicWaysToDealsWithCollections() {

        //Query over class to retrieve all the related and needed details
        List<Class__c> listOfClass = [SELECT Id, Name, School__r.Name, (SELECT Id,Name FROM Students__r) FROM Class__c];
        if(!listOfClass.isEmpty()){
            for(Class__c classObj :listOfClass ){
                for(Student__c studentObj : classObj.Students__r){
                    System.debug('Details of Students:' + studentObj);
                    if(mapOfSchoolNameWithClassNameAndRelatedStudentsDetails.containsKey(classObj.School__r.Name)){
                        if(mapOfSchoolNameWithClassNameAndRelatedStudentsDetails.get(classObj.School__r.Name).containsKey(classObj.Name)){
                            mapOfSchoolNameWithClassNameAndRelatedStudentsDetails.get(classObj.School__r.Name).get(classObj.Name).add(studentObj.Name);
                            System.debug(mapOfSchoolNameWithClassNameAndRelatedStudentsDetails);
                        }else
                        mapOfSchoolNameWithClassNameAndRelatedStudentsDetails.get(classObj.School__r.Name).put(classObj.Name,new List<String>{studentObj.Name});
                    }else
                    mapOfSchoolNameWithClassNameAndRelatedStudentsDetails.put(classObj.School__r.Name, new Map<String, List<String>>{classObj.Name => new List<String> {studentObj.Name}});
                    System.debug('mapOfSchoolNameWithClassNameAndRelatedStudentsDetails' + mapOfSchoolNameWithClassNameAndRelatedStudentsDetails);
                }
            }
        } 
    }
}