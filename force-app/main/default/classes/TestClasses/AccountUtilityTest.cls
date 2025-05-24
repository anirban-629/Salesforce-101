@isTest
public class AccountUtilityTest {
    @isTest
    public class AccountUtilitytest {
        @IsTest
        static void createSingleAccountTest(){
            AccountUtility accUtil=new AccountUtility();
            string name='Test Account', billingCity='Kolkata';
            accUtil.createSingleAccount(name, billingCity);
            List<Account> accts= [SELECT Id,Name FROM Account WHERE name= : name AND BillingCity= :billingCity LIMIT 10];
            Boolean expected = !accts.isEmpty() && accts.size()==1;
            System.debug(expected);
            Assert.areEqual(expected, true);
        }
        @IsTest
        static void createMultipleAccountsTest(){
            AccountUtility accUtil=new AccountUtility();
            string namePrefix='Test_Acc_Multiple';
            integer noOfAcc=10;
            accUtil.createMultipleAccounts(noOfAcc,namePrefix);
            List<Account> accts = [SELECT Id, Name FROM Account WHERE Name LIKE :namePrefix+'%'];
            Assert.areEqual(noOfAcc,accts.size());
        }
    }
    @IsTest
    static void updateAccount(){
        String name = 'Meta';
        String newName = 'Me_updated';
        
        Account testAcc = new Account(Name = name, BillingCity = 'Kolkata');
        insert testAcc;
        
        AccountUtility accUtil = new AccountUtility();
        accUtil.updateAccount(name, newName);
        
        Account updatedAcc = [SELECT Id, Name FROM Account WHERE Id = :testAcc.Id];
        
        System.assertEquals(newName, updatedAcc.Name);
    }
    @IsTest
    static void deleteMultipleAccounts(){
        AccountUtility accUtil = new AccountUtility();
        
        accUtil.createSingleAccount('Test_to_be_deleted_1', 'Kolkata');
        accUtil.createSingleAccount('Test_to_be_deleted_2', 'Kolkata');
        
        List<Contact> contList = [SELECT Id, FirstName FROM Contact WHERE FirstName LIKE 'Test_to_be_deleted%'];
        
        delete contList;
        
        accUtil.deleteMultipleAccounts('Test_to_be_deleted');
        
    }
}