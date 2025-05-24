global with sharing class MyClass {
    public void meth1() {
        string namePrefix='Test_Governor_limits1_';
        integer noOfAcc=5;
        for (Integer i = 0; i < noOfAcc; i++) {
            Account acc= new Account(Name=namePrefix+i);
            insert acc;
        }
        System.debug('Limits.getDMLStatements()==>'+Limits.getDmlStatements());
        System.debug('Limits.getDmlRows()==>'+Limits.getDmlRows());
        System.debug('Limits.getLimitDmlRows()==>'+Limits.getLimitDmlRows());
        System.debug('Limits.getLimitDmlStatements()==>'+Limits.getLimitDmlStatements());
    }
    public void meth2() {
        string namePrefix='Test_Governor_limits2_';
        integer noOfAcc=5;
        List<Account> accList=new List<Account>();
        for (Integer i = 0; i < noOfAcc; i++) {
            Account acc= new Account(Name=namePrefix+i);
            accList.add(acc);
        }
        insert accList;
        System.debug('Limits.getDMLStatements()==>'+Limits.getDmlStatements());
        System.debug('Limits.getDmlRows()==>'+Limits.getDmlRows());
        System.debug('Limits.getLimitDmlRows()==>'+Limits.getLimitDmlRows());
        System.debug('Limits.getLimitDmlStatements()==>'+Limits.getLimitDmlStatements());
    }
}