global with sharing class MyClass {
    public void insertMethod() {
        Account acc1=new Account(Name='Anirban Mishra');
        Account acc2=new Account(Name='Rahul Mishra');
        Account acc3=new Account();
        
        List<Account> listAcc=new List<Account>();
        listAcc.add(acc1);
        listAcc.add(acc2);
        listAcc.add(acc3);
        
        insert listAcc;
    }
    public void databaseInsertMethod() {
        Account acc1=new Account(Name='Anirban2 Mishra');
        Account acc2=new Account(Name='Rahul2 Mishra');
        Account acc3=new Account();
        
        List<Account> listAcc=new List<Account>();
        listAcc.add(acc1);
        listAcc.add(acc2);
        listAcc.add(acc3);
        
        // ? https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_database.htm#apex_System_Database_insert_4
        Database.insert(listAcc,false);
    }
    public void advancedDatabaseInsertMethod() {
        Account acc1=new Account(Name='Anirban2 Mishra');
        Account acc2=new Account(Name='Rahul2 Mishra');
        Account acc3=new Account();
        
        List<Account> listAcc=new List<Account>();
        listAcc.add(acc1);
        listAcc.add(acc2);
        listAcc.add(acc3);
        
        // ? https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_database.htm#apex_System_Database_insert_4
        Database.SaveResult[] results = Database.insert(listAcc,false);
        for(Database.SaveResult result: results) {
            if (result.isSuccess()) {
                System.debug('Successfully inserted account. Account ID: ' + result.getId());
            } else {
                // Operation failed, so get all errors
                for(Database.Error err : result.getErrors()) {
                    System.debug('The following error has occurred.');
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Account fields that affected this error: ' + err.getFields());
                }
            }
        }
    }
}