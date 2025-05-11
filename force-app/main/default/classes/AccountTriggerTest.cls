@isTest
private class AccountTriggerTest {
    
    @isTest
    static void myUnitTest() {
        String prefixOfAcc='Trailhead_Test_';
        List<Account> acctsToBeInserted=new List<Account>();
        for (Integer i = 0; i < 200; i++) {
            String nameOfAcc=prefixOfAcc+i;
            Account acc=new Account(Name=nameOfAcc,BillingState='CA');
            acctsToBeInserted.add(acc);
        }
        insert acctsToBeInserted;
        List<Account> insertedAccts= [SELECT Id, Name, BillingState, ShippingState FROM Account WHERE Name LIKE 'Trailhead_Test_%'];
        for(Account acc:insertedAccts){
            Assert.areEqual(acc.BillingState,acc.ShippingState);
        }
    }
}