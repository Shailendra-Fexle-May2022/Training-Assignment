/**
*
*  Purpose          :	Helper Class for Trigger on School object.
*
*  Created Date     :  	07/10/2022
*
*  Created By       :  	Shailendra Sharma
*
*  Revision Logs    :  	V_1.0 - Created
*
**/
public without sharing class SchoolTriggerHelper {
    
   //Method
    public static void updateNoOfStudentsDetails(List<School__c> newSchoolList, Map<Id, School__c> mapOfOldSchool) {
        
        //Empty Map of school with key schoolId and No of schooldetails as values.
        Map<Id, School__c> mapOfSchoolDetails = new Map<Id, School__c>();
        
        //Iterate the newly inserted school
        for(School__c school : newSchoolList){
            
            if(mapOfOldSchool != null && school.No_of_Students__c != mapOfOldSchool.get(school.Id).No_of_Students__c)
                
                mapOfSchoolDetails.put(school.Id, school);
        }
        
        //Check Map is not empty
        if(!mapOfSchoolDetails.isEmpty()) 
            
            // Call the CountsManager1 class method by passing filled schoolmap to update no students on school object.
            CountsManager1.doCalculationForNoOfStudentsInBeforeTrigger(mapOfSchoolDetails);  
        //CountsManager1.doCalculationForNoOfStudentsInAfterTrigger(mapOfSchoolDetails); 
    }
    
    //Method
    public static void updateNoOfClassDetails(List<School__c> newSchoolList, Map<Id, School__c> mapOfOldSchool) {
        
        //Empty Map of school with key schoolId and No of schooldetails as values.
        Map<Id, School__c> mapOfSchoolDetails = new Map<Id, School__c>();
        
        //Iterate the newly inserted school
        for(School__c school : newSchoolList){
            
            if(mapOfOldSchool != null && school.No_of_Classes__c != mapOfOldSchool.get(school.Id).No_of_Classes__c)
                
                mapOfSchoolDetails.put(school.Id, school);
        }
        
        //Check Map is not empty
        if(!mapOfSchoolDetails.isEmpty())
            
            // Call the CountsManager1 class method by passing filled schoolmap to update no classes on school object.
            CountsManager1.doCalculationForNoOfSClassesInBeforeTrigger(mapOfSchoolDetails);
        //CountsManager1.doCalculationForNoOfClassesInAfterTrigger(mapOfSchoolDetails);
    } 
    
    //Method
    public static void updateNoOfStudentsDetailsOnSchoolInBeforeTrigger(Map<Id, School__c> mapOfNewSchools , Map<Id, School__c> mapOfOldSchools){
        
        //Map to hold the school Ids as a key and school details as a vlaue.
        Map<Id, School__c> mapOfSchoolWithIdAndNoOfStudentsCount = new Map<Id, School__c>();
        
        for(School__c school : mapOfNewSchools.values()){
            
            // for update and blank check
            if(mapOfOldSchools !=null && school.No_of_Students__c != mapOfOldSchools.get(school.Id).No_of_Students__c)
                
                mapOfSchoolWithIdAndNoOfStudentsCount.put(school.Id, new School__c(Id = school.Id, No_of_Students__c = 0 ));  	
        }
        
        // Check school map is not empty
        if(!mapOfSchoolWithIdAndNoOfStudentsCount.isEmpty()){
            
            for(Student__c stu : [SELECT ID, School__c FROM Student__c WHERE School__c IN :mapOfSchoolWithIdAndNoOfStudentsCount.keySet()]){
                
                If(mapOfSchoolWithIdAndNoOfStudentsCount.containsKey(stu.School__c)){
                    
                    mapOfSchoolWithIdAndNoOfStudentsCount.get(stu.School__c).No_of_Students__c += 1; 
                    mapOfNewSchools.get(stu.School__c).No_of_Students__c = mapOfSchoolWithIdAndNoOfStudentsCount.get(stu.School__c).No_of_Students__c;
                    
                }
            }
        }
        
        /* // Map to hold the school Ids as a key and school details as a vlaue.
        Map<Id, School__c> mapOfSchoolWithIdAndNoOfStudentsCount = new Map<Id, School__c>();
        
        for(School__c school : newSchoolList)
        
        // for update and blank check
        if(mapOfOldSchools !=null && school.No_of_Students__c != mapOfOldSchools.get(school.Id).No_of_Students__c){
        
        mapOfSchoolWithIdAndNoOfStudentsCount.put(school.Id, new School__c(Id = school.Id, No_of_Students__c = 0 ));    
        System.debug('@@@70'+ mapOfSchoolWithIdAndNoOfStudentsCount);
        }
        if(!mapOfSchoolWithIdAndNoOfStudentsCount.isEmpty()){
        
        for(Student__c stu : [SELECT ID, School__c FROM Student__c WHERE School__c IN :mapOfSchoolWithIdAndNoOfStudentsCount.keySet()]){
        System.debug('@@@75'+ stu);
        
        If(mapOfSchoolWithIdAndNoOfStudentsCount.containsKey(stu.School__c))
        
        mapOfSchoolWithIdAndNoOfStudentsCount.get(stu.School__c).No_of_Students__c += 1;     
        }
        System.debug('@@@80'+ mapOfSchoolWithIdAndNoOfStudentsCount);
        }
        
        for(School__c sch : newSchoolList){
        
        // Check school map is not empty
        if(!mapOfSchoolWithIdAndNoOfStudentsCount.isEmpty()){
        
        sch.No_of_Students__c = mapOfSchoolWithIdAndNoOfStudentsCount.get(sch.Id).No_of_Students__c;
        System.debug('@@@90'+ sch);
        }
        }*/
    }
    
    //Method
    public static void updateNoOfClassesDetailsOnSchoolInBeforeTrigger(List<School__c> newSchoolList, Map<Id, School__c> mapOfOldSchools){
        
        // Map to hold the school Ids as a key and school details as a vlaue.
        Map<Id, School__c> mapOfSchoolWithIdAndNoOfClassesCount = new Map<Id, School__c>();
        
        for(School__c school : newSchoolList) {
            
            // for update and blank check
            if(mapOfOldSchools != null && school.No_of_Classes__c != mapOfOldSchools.get(school.Id).No_of_Classes__c)
                
                mapOfSchoolWithIdAndNoOfClassesCount.put(school.Id, new School__c(Id = school.id, No_of_Classes__c = 0));  
        }
        
        // Check set of Ids is not empty
        if(!mapOfSchoolWithIdAndNoOfClassesCount.isEmpty()){
            
            for(Class__c cls : [SELECT ID, School__c FROM Class__c WHERE School__c IN :mapOfSchoolWithIdAndNoOfClassesCount.keySet()]){
                
                If(mapOfSchoolWithIdAndNoOfClassesCount.containsKey(cls.School__c))
                    
                    mapOfSchoolWithIdAndNoOfClassesCount.get(cls.School__c).No_of_Classes__c += 1;
            }
        }
        
        for(School__c sch :newSchoolList){
            
            // Check school map is not empty
            if(!mapOfSchoolWithIdAndNoOfClassesCount.isEmpty())
                
                sch.No_of_Classes__c = mapOfSchoolWithIdAndNoOfClassesCount.get(sch.Id).No_of_Classes__c;
        }
    }
    
    //Method
    public static void updateNoOfClassesDetailsOnSchoolInBeforeTriggerUsingParentToChildQuery(List<School__c> newSchoolList, Map<Id, School__c> mapOfOldSchools){
        
        // Map to hold the school Ids as a key and recaluate no of classes as a vlaue.
        Map<Id, Integer> mapOfSchoolWithIdAndNoOfClassesCount = new Map<Id, Integer>();
        
        // Set to hold schoolds
        Set<Id> setOfSchoolIds = new Set<Id>();
        
        for(School__c school : newSchoolList){
            
            // for update and blank check
            if(mapOfOldSchools !=null && school.No_of_Classes__c != mapOfOldSchools.get(school.Id).No_of_Classes__c)
                
                setOfSchoolIds.add(school.Id); 
        }
        
        // Check set of Ids is not empty
        if(!setOfSchoolIds.isEmpty()){
            
            for(School__c school : [SELECT ID,(SELECT ID FROM Classes__r WHERE School__c != NULL) 
                                    FROM School__c WHERE ID IN :setOfSchoolIds])
                
                mapOfSchoolWithIdAndNoOfClassesCount.put(school.Id, school.Classes__r.size());
        }
        
        for(School__c sch :newSchoolList){
            
            // Check school map is not empty
            if(!mapOfSchoolWithIdAndNoOfClassesCount.isEmpty())
                
                sch.No_of_Classes__c = mapOfSchoolWithIdAndNoOfClassesCount.get(sch.Id);
        }    
    }
    
    //Method
    public static void updateNoOfStudentsDetailsOnSchoolInBeforeTriggerUsingParentToChildQuery(List<School__c> newSchoolList, Map<Id, School__c> mapOfOldSchools){
        
        // Map to hold the school Ids as a key and recaluate no of students as a vlaue.
        Map<Id, Integer> mapOfSchoolWithIdAndNoOfStudentsCount = new Map<Id, Integer>();
        
        // Set to hold schoolds
        Set<Id> setOfSchoolIds = new Set<Id>();
        
        for(School__c school : newSchoolList){
            
            // for update and blank check
            if(mapOfOldSchools !=null && school.No_of_Students__c != mapOfOldSchools.get(school.Id).No_of_Students__c)
                
                setOfSchoolIds.add(school.Id); 
        }
        
        // Check set of Ids is not empty
        if(!setOfSchoolIds.isEmpty()){
            
            for(School__c school : [SELECT ID,(SELECT ID FROM Students__r WHERE School__c != NULL) 
                                    FROM School__c WHERE ID IN :setOfSchoolIds])
                
                mapOfSchoolWithIdAndNoOfStudentsCount.put(school.Id, school.Students__r.size());
        }
        for(School__c sch :newSchoolList){
            
            // Check school map is not empty
            if(!mapOfSchoolWithIdAndNoOfStudentsCount.isEmpty())
                
                sch.No_of_Students__c = mapOfSchoolWithIdAndNoOfStudentsCount.get(sch.Id);
        }    
    }
    
    public static void doApexSharingCalculations(List<School__c> newSchoolList, Map<Id, School__c> mapOfOldSchools){
        
        //Set to fill the schoolIds where no of teachers om school are more than given criteria.
        Set<Id> setOfEligibleSchoolsForSharingAddition = new Set<Id>();
        
        //Set to fill the schoolIds where no of teachers om school are less than given criteria.
        Set<Id> setOfEligibleSchoolsForSharingDeletion = new Set<Id>();
        Boolean isAnyRelaventChangesHappens = false;
        
        for(School__c sch : newSchoolList){
            
            if(mapOfOldSchools != null){
                
               //Only execute the logic if relavent field(s) values got changes or batch is executing
                if(System.isBatch() || (sch.No_of_Teachers__c != mapOfOldSchools.get(sch.Id).No_of_Teachers__c)){
                    
                    if(sch.No_of_Teachers__c != null){
                        
                        if(sch.No_of_Teachers__c > Integer.valueOf(System.label.NO_OF_TEACHERS_THRESHOLD_VALUE_FOR_GRANTED_SHARING_RULE)){
                            
                            setOfEligibleSchoolsForSharingAddition.add(sch.Id);  
                            System.debug('setOfEligibleSchoolsForSharingAddition' +setOfEligibleSchoolsForSharingAddition);
                            
                        }
                        else {
                            
                            setOfEligibleSchoolsForSharingDeletion.add(sch.Id);
                            System.debug('setOfEligibleSchoolsForSharingDeletion' + setOfEligibleSchoolsForSharingDeletion);
                        }   
                    }
                    else{
                        
                        //fill the set if No of Teachers fileld value on school is null
                        setOfEligibleSchoolsForSharingDeletion.add(sch.Id);
                    }
                    isAnyRelaventChangesHappens = true;    
                }
            }
        }
        
        List<User> UserDetails;
        
        if(setOfEligibleSchoolsForSharingAddition.size() > 0 || setOfEligibleSchoolsForSharingDeletion.size() > 0)
            
            //Query to get user ID to which we will share the record
            UserDetails = [SELECT Id FROM User Where Id = :System.Label.USER_TO_SHARE_RECORD_BY_APEX_SHARING AND isActive = True];   
        
        
        //Only execute the logic if relavent field(s) values got changes
        if(isAnyRelaventChangesHappens) {
            
            if(UserDetails.size() > 0){
                
                List<School__Share> listOfSchoolOnWhichSharingRuleAreApplying = new List<School__Share>();
                
                //Loop over school records and create sharing record for the Integration User
                for(Id schoolShare : setOfEligibleSchoolsForSharingAddition){
                    
                    // Create new sharing object for the custom object School.
                    School__Share schoolShr  = new School__Share();
                    
                    // Set the ID of record being shared.
                    schoolShr.ParentId = schoolShare;
                    
                    // Set the ID of user or group being granted access.
                    schoolShr.UserOrGroupId = UserDetails[0].Id;
                    
                    // Set the access level.
                    schoolShr.AccessLevel = Constants.SHARING_ACCESS_TYPE_READ;
                    
                    // Set rowCause to 'Apex Sharing' for Apex Sharing sharing.
                    schoolShr.RowCause = Schema.School__Share.RowCause.Apex_Sharing__c; 
                    System.debug(' schoolShr.RowCause ' + schoolShr.RowCause );
                    
                    listOfSchoolOnWhichSharingRuleAreApplying.add(schoolShr);
                }
                
                System.debug('listOfSchoolOnWhichSharingRuleAreApplying'+listOfSchoolOnWhichSharingRuleAreApplying);
                
                if(listOfSchoolOnWhichSharingRuleAreApplying.size()>0){
                    
                    //Insert sharing record details
                    Utilities.BypassAllTriggers = true;
                    insert listOfSchoolOnWhichSharingRuleAreApplying;
                    Utilities.BypassAllTriggers = false;
                    
                    //Make a integration callout and do further processing 
                    //if sharing records will be created successfully
                    
                    //Via future method
                   	//HerokuAppIntegrationManager.makeCalloutToHerokuAndUpdateUsers(setOfEligibleSchoolsForSharingAddition);
                    
                    //enqueue the Queueable job for processing
                    Queueable_UpdateUserWithHerokuAppDetails queueableJob = new Queueable_UpdateUserWithHerokuAppDetails(setOfEligibleSchoolsForSharingAddition);
                    ID jobID = System.enqueueJob(queueableJob);
                }  
                
                if(setOfEligibleSchoolsForSharingDeletion.size() > 0){
                    
                    // Query to get shared record to user
                    List<School__Share> listOfSchoolOnWhichSharingRuleAreRemoving = [SELECT Id, ParentId, RowCause, UserOrGroupId FROM School__share WHERE ParentId IN: setOfEligibleSchoolsForSharingDeletion AND RowCause = 'Apex_Sharing__c'];
                    System.debug('query '+ listOfSchoolOnWhichSharingRuleAreRemoving);
                    
                    if(listOfSchoolOnWhichSharingRuleAreRemoving.size() > 0){
                        
                        //Delete sharing of record from user
                        Utilities.BypassAllTriggers = true;
                        delete listOfSchoolOnWhichSharingRuleAreRemoving;
                        Utilities.BypassAllTriggers = false;
                        
                        //Make a integration callout and do further processing 
                        //if sharing records will be created successfully
                        
                        //Via future method
                        //HerokuAppIntegrationManager.makeCalloutToHerokuAndUpdateUsers(setOfEligibleSchoolsForSharingAddition);
                        
                        //enqueue the Queueable job for processing
                        Queueable_UpdateUserWithHerokuAppDetails queueableJob = new Queueable_UpdateUserWithHerokuAppDetails(setOfEligibleSchoolsForSharingAddition);
                        ID jobID = System.enqueueJob(queueableJob);
                    }	   
                }
            }
            else
                //Display error if activated user is not found.
                newSchoolList[0].addError(System.Label.ERROR_USER_IS_DEACTIVATED);  
        }     
    }
}