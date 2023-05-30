/**
*
*  Purpose          :   Class to update the field on updating the stage.
*
*  Created Date     :   09/06/2022
*
*  Created By       :   Shailendra Sharma
*
*  Revision Logs    :   V_1.0 - Created
*
**/
public without sharing  class OpportunityTriggerHandler {

    public static Schema.DescribeFieldResult fieldResult = Opportunity.StageName.getDescribe();
	public static List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
    
    public static void updateStageOnLifeCycle(List<Opportunity> listOfnewOpportunity, Map<Id, Opportunity> mapOfoldOpportunity) {
    	
        Set<String> setOfOrderedStageName = new Set<String>();
        Set<String> setOfStageName = new Set<String>();
        List<String> orderingList = new List<String>();
    
        for(Schema.PicklistEntry spe : ple){

        	System.debug('value: '+spe.getLabel());
            setOfOrderedStageName.add(spe.getLabel());
            System.debug(setOfOrderedStageName); 
		} 
       
        //Traverse on Opportunity
        for(Opportunity opp : (listOfnewOpportunity != null ? listOfnewOpportunity : mapOfoldOpportunity.values())){
           System.debug(opp); 
            
            //Check valid conditions for insert and update
            if(mapOfoldOpportunity == null || (mapOfoldOpportunity != null && opp.StageName != mapOfoldOpportunity.get(opp.id).StageName)){
               System.debug(opp.StageName); 

                if(mapOfoldOpportunity != null && String.isNotEmpty(mapOfoldOpportunity.get(opp.id).Life_Cycle__c)){

                    System.debug('Old life cycle: ' + mapOfoldOpportunity.get(opp.id).Life_Cycle__c);
                    setOfStageName.addAll(mapOfoldOpportunity.get(opp.id).Life_Cycle__c.split(' --> '));
                    System.debug(setOfStageName);
                }
                //Check for null
                if(opp.StageName != null){
                   // opp.Life_Cycle__c = mapOfoldOpportunity.get(opp.id).StageName + '-->' + opp.StageName + '-->';//
                    setOfStageName.add(opp.StageName);
                    //setOfStages.add(mapOfoldOpportunity.get(opp.id).StageName);
                }
            }
            
            if(!setOfStageName.isEmpty()){
                System.debug(setOfStageName);

                for(String st : setOfOrderedStageName){
                    if(setOfStageName.contains(st))
                        orderingList.add(st);
                }

                String stageName = String.join(orderingList, ' --> ');
                System.debug(stageName); 
               //Add sorted string to field
              	opp.Life_Cycle__c = stageName;
            }
        }    
    }
}