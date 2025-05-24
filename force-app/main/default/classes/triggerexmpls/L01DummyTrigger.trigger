trigger CreateDummyContactTrigger on Account(after  insert){
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
