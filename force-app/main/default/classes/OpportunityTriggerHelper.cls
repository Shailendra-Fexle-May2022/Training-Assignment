public without sharing  class OpportunityTriggerHelper {
	
    public static void sumOfAmountOnAccount(List<Opportunity> listOppList, Map<Id, Opportunity> mapOfOldOpportunity){
		
		Map<Id, Account> mapOfAccount = new Map<Id, Account>();
		
		for(Opportunity opp : (listOppList != null ? listOppList :mapOfOldOpportunity.values())){
			System.debug('Insert For Loop');
			if(mapOfOldOpportunity == null || (mapOfOldOpportunity != null && (opp.Amount != mapOfOldOpportunity.get(opp.Id).Amount || opp.AccountId != mapOfOldOpportunity.get(opp.Id).AccountId)) || listOppList == null){
				System.debug('Insert First If');
                if(opp.AccountId != null){
                   System.debug('Insert Second If');
			       mapOfAccount.put(opp.AccountId , new Account(Id = opp.AccountId, Sum_of_Opportunities_Amount__c = 0, Total_Number_of_Opportunity__c = 0)); 
                }
                
				
                if(mapOfOldOpportunity != null && mapOfOldOpportunity.get(opp.Id).AccountId != null){
                   	System.debug('Insert Third If');
					mapOfAccount.put(mapOfOldOpportunity.get(opp.Id).AccountId, new Account(Id = mapOfOldOpportunity.get(opp.Id).AccountId, Sum_of_Opportunities_Amount__c = 0, Total_Number_of_Opportunity__c = 0)); 
                }
                
			}
		}

			if(!mapOfAccount.isEmpty()){
				for(AggregateResult agg : [SELECT AccountId,COUNT(Id)TotalOpportunities, SUM(Amount)TotalAmount FROM Opportunity WHERE AccountId IN : mapOfAccount.keySet() GROUP BY AccountId]){
                    mapOfAccount.get((Id)agg.get('AccountId')).Sum_of_Opportunities_Amount__c = (Decimal)agg.get('TotalAmount');
                    mapOfAccount.get((Id)agg.get('AccountId')).Total_Number_of_Opportunity__c = (Integer)agg.get('TotalOpportunities');   
				}
                System.debug(mapOfAccount);
                
			 	update mapOfAccount.values();
			}
    }
}