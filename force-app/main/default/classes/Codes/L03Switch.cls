global with sharing class MyClass {
    public void test(){
        Integer i = 50;
        switch on i {
            when 10,20,30,40 {
                System.debug('in');
            }
            when else {
                System.debug('out');
            }
        }
    }
}