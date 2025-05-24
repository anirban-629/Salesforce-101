global class AccountBillingStreetUpdateBatch implements Database.Batchable<SObject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        System.debug('Inside Start Method');
        String query='SELECT Id, Name, BillingStreet, BillingCity, BillingState , BillingCountry, AccountNumber  FROM Account WHERE AccountNumber = null or BillingCity = null or BillingState = null or BillingCountry = null or BillingStreet = null';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Account> acctsList){
        try {
            for (Account acc : acctsList) {
                if(String.isBlank(acc.BillingStreet)){
                    acc.BillingStreet = 'InsertedViaApexBatchClass_AccountBillingStreetUpdateBatch';
                }
            }
            update acctsList;
        } catch (Exception e) {
            System.debug(e.getMessage());
        }
    }
    
    global void finish(Database.BatchableContext BC){
        System.debug('Inside Finish Method');
    }
}