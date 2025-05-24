/*
 * *************************************************************
 * @description    Throw an error if an Account is deleted,
 *                  Only if some account is associated with it
 * @author          Anirban Mishra
 * ************************************************************
 */

trigger CreateDummyContactTrigger on Account(after insert, before delete, before insert){
    /**
     * @description     After inserting Account , create a Contact with FirstName as Account Name and LastName as 'Dummy'
     */
    if (Trigger.isAfter && Trigger.isInsert) {
        List<Contact> conList = new List<Contact>();
        for (Account acc : Trigger.new) {
            
            Contact newContact=new Contact();
            newContact.FirstName=acc.Name;
            newContact.LastName='Dummy';
            newContact.AccountId=acc.Id;
            
            conList.add(newContact);
        }
        insert conList;
    }
    /**
     * @description     Before deleting an Account , check whether it has any associated Contact or not.
     *                  If yes , throw an error.
     */
    else if (Trigger.isDelete) {
        Set<Id> accList = new Set<Id>();
        for (Account acc : Trigger.old) {
            accList.add(acc.Id);
        }
        Map<Id,Account> accts=new Map<Id,Account>(
            [
                SELECT Id, Name, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :accList]
            );
        for (Account acc : Trigger.old) {
            if(accts.get(acc.Id).Contacts.size()>0){
                acc.addError('Account cannot be deleted if it has associated contacts');
            }
        }
    }
    /**
     *   @description     Before inserting an Account , if BillingCity is null , set it to Kolkata.
     */
    else if(Trigger.isBefore && Trigger.isInsert) {
        for (Account acc : Trigger.new) {
            if(String.isBlank(acc.BillingCity)){
                acc.BillingCity='Kolkata';
            }
            if(String.isBlank(acc.BillingState)){
                acc.BillingState='West Bengal';
            }
        }
    }
}