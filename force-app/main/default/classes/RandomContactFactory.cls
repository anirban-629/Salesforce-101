public with sharing class RandomContactFactory {
    public static List<Contact> generateRandomContacts (Integer n, String commonLastName) {
        List<Contact> contactsListToInsert = new List<Contact>();
        for (Integer i = 0; i < n; i++){
            String fName= 'Test' + ' '+i;
            contactsListToInsert.add(new Contact(
                FirstName = fName,
            LastName = commonLastName
                ));
        }
        return contactsListToInsert;
    }
}