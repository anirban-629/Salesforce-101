global with sharing class MyClass {
    public void npeMethod(){
        string s=null;
        boolean b;
        try {
            boolean b=s.contains('arg');
        } catch (NullPointerException npe) {
            System.debug(npe.getCause());
            System.debug(npe.getLineNumber());
            System.debug(npe.getMessage());
            System.debug(npe.getStackTraceString());
            System.debug(npe.getTypeName());
        } finally {
            System.debug('Finally Block');
        }
    }
}