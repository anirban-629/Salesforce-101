global with sharing class MyClass {
    public void loops(){
        // https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_loops_for_SOQL.htm
        for (List<Employee__c> emp :[ SELECT Id,First_Name__c FROM Employee__c LIMIT 10]) {
            System.debug(emp[1].First_Name__c);
        }
    }
}