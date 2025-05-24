global with sharing class MyClass {
    public void insertRecord(){
        Lead l1=new Lead(FirstName='Ram', LastName='Ranjan', Company='Accenture');
        insert l1;
    }
    
    public void updateRecord(){
        Lead l2=[SELECT Id, FirstName, LastName, Company FROM Lead LIMIT 1];
        System.debug('ID: ---->> ' + l2.id);
        l2.LeadSource='Web';
        l2.Company='A Y S A A Y I';
        update l2;
        System.debug('UPDATED Company: ---->> ' + l2.Company);
        System.debug('UPDATED LeadSource: ---->> ' + l2.LeadSource);
    }
    
    public void updatePhoneNoForAllLeads(){
        List<Lead> leads=[SELECT Id, FirstName, LastName, Phone FROM Lead LIMIT 4];
        // List<Lead> recordsToUpdate=new List<Lead>();
        for (Lead lead : leads) {
            lead.Phone='111111111111111';
            // recordsToUpdate.add(lead);
        }
        update leads;
    }
    
    public void deleteAndUndeleteEmployees(){
        List<Employee__c> emps=[SELECT Name ,Email__c,First_Name__c FROM Employee__c WHERE Address__c = null and Email__c = null AND Age__c >= 21 AND Age__c <= 22];
        System.debug('No of Records ' + emps.size());
        delete emps;
        
        // ? ALL ROWS doesn’t work in a SOQL query written in a query editor. It only works in a query used in Apex.
        List<Employee__c> emps=[SELECT Name ,Email__c,First_Name__c FROM Employee__c WHERE Address__c = null and Email__c = null AND Age__c >= 21 AND Age__c <= 22 ALL ROWS];
        System.debug('No of Records ' + emps.size());
        undelete emps;
    }
    
    public void upsertOperation(){
        List<Contact> contacts=[SELECT Id, Name, FirstName, LastName FROM Contact WHERE LastName = 'MISHRA'];
        for (Contact c : contacts) {
            c.FirstName='Anirban';
        }
        Contact con=new Contact(FirstName='ABC',LastName='MISHRA');
        Contact con2=new Contact(FirstName='XYZ',LastName='MISHRA');
        contacts.add(con);
        contacts.add(con2);
        upsert contacts;
    }
    
    
}