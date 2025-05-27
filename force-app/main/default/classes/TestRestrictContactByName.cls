@isTest
private class TestRestrictContactByName {
    
    @isTest
    static void testRestrictContactByNameTrigger() {
        
        Contact c = new Contact(LastName = 'INVALIDNAME');
        test.startTest();
        Database.SaveResult result = Database.insert(c,false);
        test.stopTest();
        
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size()>0);
        String expectedErrorMessage = 'The Last Name "'+c.LastName+'" is not allowed for DML';
        System.assertEquals(expectedErrorMessage,result.getErrors()[0].getMessage());
    }
}