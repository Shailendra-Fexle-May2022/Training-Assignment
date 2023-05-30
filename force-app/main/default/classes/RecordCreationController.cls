public with sharing class RecordCreationController {
    @AuraEnabled(cacheable = true)
    public static  List<Account> fetchAccountRecords(){
        try {
            return [SELECT Id, Name, Industry, Type, AccountNumber, Site FROM Account ORDER BY CreatedDate DESC LIMIT 5 ];

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}