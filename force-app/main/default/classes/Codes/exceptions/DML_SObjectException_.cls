global with sharing class MyClass {
    public void name() {
        Lead L=[SELECT id FROM Lead Limit 1];
        try {
            string name=L.Name;
            System.debug(name);
        } catch (Exception e) {
            // SObject Exceptiond
            System.debug(e.getCause());
            System.debug(e.getLineNumber());
            System.debug(e.getMessage());
            System.debug(e.getStackTraceString());
            System.debug(e.getTypeName());
        }finally{
            try {
                L.Description='asdads';
                insert L;
            } catch (Exception e) {
                // DML Exceptiond
                System.debug(e.getCause());
                System.debug(e.getLineNumber());
                System.debug(e.getMessage());
                System.debug(e.getStackTraceString());
                System.debug(e.getTypeName());
            }
        }
    }
    private void name() {
        // Check in dev console
        try{
            throw new MyCustomException();
        }catch(MyCustomException e){
            System.debug(e.getCause());
            System.debug(e.getLineNumber());
            System.debug(e.getMessage());
            System.debug(e.getStackTraceString());
            System.debug(e.getTypeName());
            e.MyExceptionMethod();
        }
        catch(Exception e){
            System.debug(e.getCause());
            System.debug(e.getLineNumber());
            System.debug(e.getMessage());
            System.debug(e.getStackTraceString());
            System.debug(e.getTypeName());
        }
    }
}