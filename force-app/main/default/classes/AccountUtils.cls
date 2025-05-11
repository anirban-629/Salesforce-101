public with sharing class AccountUtils {
    public List<Map<String, String>> accountsByState(String state) {
        List<Map<String, String>> results= new List<Map<String, String>>();
        if (Schema.sObjectType.Account.isAccessible()) {
            List<Account> accts= [SELECT Id, Name FROM Account WHERE BillingState = :state];
            for(Account acc:accts){
                Map<String,String> accData= new Map<String, String>();
                accData.put('Name', acc.Name);
                accData.put('Id', acc.Id);
                results.add(accData);
            }
        }
        return results;
    }
}