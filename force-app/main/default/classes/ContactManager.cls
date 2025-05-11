public with sharing class ContactManager {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getAllContacts(Integer numberOfRecords){
        if (numberOfRecords == null) {
            numberOfRecords = 100; // default value
        }
        if (Schema.sObjectType.Contact.fields.LastName.isAccessible() &&
        Schema.sObjectType.Contact.fields.Phone.isAccessible()) {
            
            try {
                return [SELECT Id, LastName, Phone FROM Contact LIMIT :numberOfRecords];
            } catch (Exception e) {
                // Ideally log this properly with a logging framework
                System.debug('Error fetching contacts: ' + e.getMessage());
                return new List<Contact>(); // Return empty list instead of null
            }
            
        } else {
            throw new AuraHandledException('You do not have permission to access these fields.');
        }
    }
}