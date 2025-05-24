// Statefull will keep tracking of earlier things for each batch like variables
global class StatufullApexBatch implements Database.Batchable<SObject>, Database.Stateful {
    integer recordsProcessed=0;
    integer noOfBatchRun=0;
    global Database.QueryLocator start(Database.BatchableContext BC){
        System.debug('Inside Start Method');
        String query='SELECT Id, Name, BillingStreet, BillingCity, BillingState, BillingCountry, AccountNumber From Account WHERE AccountNumber = \'125349618\'';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Account> acctsList){
        try {
            for (Account acc : acctsList) {
                acc.AccountNumber = '987654321';
                recordsProcessed+=1;
            }
            update acctsList;
        } catch (Exception e) {
            System.debug(e.getMessage());
        }
        noOfBatchRun+=1;
    }
    
    global void finish(Database.BatchableContext BC){
        System.debug('Inside Finish Method');
        System.debug('No of records Processed - ' + recordsProcessed);
        System.debug('No of Batch Ran - ' + noOfBatchRun);
    }
}