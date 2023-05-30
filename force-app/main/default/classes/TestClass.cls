public class TestClass {
	
    public static Map<Id, Map<Id, Contact>> mapOfSchoolNameWithClassNameAndRelatedStudentsDetails = new Map<Id, Map<Id, Contact>> ();
    public static void DynmaicWaysToDealsWithCollections() {
        //Query over class to retrieve all the related and needed details
        List<Contact> listOfClass = [SELECT Id,AccountId,Account.Name FROM Contact Where AccountId != null];
        if(!listOfClass.isEmpty()){
            for(Contact classObj :listOfClass ){
                if(mapOfSchoolNameWithClassNameAndRelatedStudentsDetails.containsKey(classObj.AccountId)){
                            mapOfSchoolNameWithClassNameAndRelatedStudentsDetails.get(classObj.AccountId).put(classObj.Id, classObj);
                        }else
                        mapOfSchoolNameWithClassNameAndRelatedStudentsDetails.put(classObj.AccountId, new Map<Id, Contact>{classObj.Id => classObj });
                   
                }
        }    
    	System.debug(mapOfSchoolNameWithClassNameAndRelatedStudentsDetails);
	}


	public static void DynmaicWaysToDealsWithCollections1(){
    
     List<Account> listOfAccoiunt= [SELECT Id,Name,(SELECT Id,Name From Contacts Where AccountId != null) FROM Account];
            for(Account classObj :listOfAccoiunt ){
                for(Contact con : classObj.Contacts){
                	if(mapOfSchoolNameWithClassNameAndRelatedStudentsDetails.containsKey(classObj.Id)){
                            mapOfSchoolNameWithClassNameAndRelatedStudentsDetails.get(classObj.Id).put(con.Id, con);
                        }else
                        mapOfSchoolNameWithClassNameAndRelatedStudentsDetails.put(classObj.Id, new Map<Id, Contact>{con.Id => con });
                   
                }
        }    
    	System.debug(mapOfSchoolNameWithClassNameAndRelatedStudentsDetails);
	}
}