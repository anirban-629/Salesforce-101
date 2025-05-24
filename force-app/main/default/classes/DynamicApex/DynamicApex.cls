global with sharing class MyClass {
    private void name() {
        List<Schema.SObjectType> objList=Schema.getGlobalDescribe().values();
        for (Schema.SObjectType obj : objList) {
            System.debug(
                'Object Name - '+ obj.getDescribe().getName()+
                'Fields - '+ obj.getDescribe().fields.getMap().values()
                );
        }
    }
}