public class AccountUtility {
    public static void createSingleAccount(string name, string billingCity){
        Account acc = new Account();
        acc.Name = name;
        acc.BillingCity=billingCity;
        insert acc;
    }
    public static void createMultipleAccounts(integer noOfAcc, string namePrefix){
        string namePrefix='asd';
        integer noOfAcc=2;
        List<Account> accList = new List<Account>();
        for (Integer i = 1; i < = noOfAcc; i++) {
            Account acc = new Account(Name= namePrefix + ' '+ i);
            accList.add(acc);
        }
        insert accList;
    }
    public static void updateAccount(string name, string newName){
        Account acc = [SELECT Id, Name, BillingCity FROM Account WHERE Name= :name LIMIT 1];
        System.debug('Id is '+acc.Id);
        acc.Name=newName;
        update acc;
    }
    public static void deleteMultipleAccounts(string namePrefix){
        string pattern=namePrefix+'%';
        List<Account> accList = [SELECT Id, Name, CreatedDate FROM Account WHERE Name LIKE : pattern];
        delete accList;
    }
}