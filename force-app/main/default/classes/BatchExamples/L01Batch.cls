global with sharing class AccountUpdateNullvaluesBatch implements Database.Batchable<SObject>{
    public Integer totalUpdated = 0; // Stateless - no track
    global Database.QueryLocator start(Database.BatchableContext BC){
        System.debug('Inside Start Method');
        String query='SELECT Id, Name, BillingStreet, BillingCity, BillingState , BillingCountry, AccountNumber  FROM Account WHERE AccountNumber = null or BillingCity = null or BillingState = null or BillingCountry = null';
        return Database.getQueryLocator(query);
    }
    
    //  Suppost 2 batches will be there for that will execute only after current batch is completed and the start and finish method will be running only once but execute will be running for 2 times only
    global void execute(Database.BatchableContext BC, List<Account> acctsList){
        System.debug('Inside Execute Method');
        System.debug('Size - ' + acctsList.size());
        try {
            for (Account acc : acctsList) {
                if(String.isBlank(acc.AccountNumber)){
                    acc.AccountNumber = '125349618';
                }
                if(String.isBlank(acc.BillingCity)){
                    acc.BillingCity = 'Kolkata';
                }
                if(String.isBlank(acc.BillingState)){
                    acc.BillingState = 'West Bengal';
                }
                if(String.isBlank(acc.BillingCountry)){
                    acc.BillingCountry = 'India';
                }
            }
            update acctsList;
            totalUpdated += acctsList.size();
        } catch (Exception e) {
            System.debug(e.getMessage());
        }
    }
    
    global void finish(Database.BatchableContext BC){
        System.debug('Inside Finish Method');
        System.debug('Total Updated: ' + totalUpdated); // Stateless - no track
        // execute any post-processing operations
    }
    // ! ************************************************************************************************
    // https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_batch_interface.htm
    //To Run this the batch save this class in dev console and run the below command
    // Database.executeBatch(new AccountUpdateNullvaluesBatch(),5); // It'll run 5 batches
    
    //  Suppose we have 16 records and given the number is 5 which is by default 200 minimum and maximum 2000 but here it is given 5 so 5 == 5 records now to complete all the process it'll run a total of 4 batches
    
    // *  3 batches X 5 Records = 15 another 1 is remaining out of 16 so one more will be running to complete
    // ! ************************************************************************************************
}