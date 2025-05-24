global with sharing class MyClass {
    public void ListExceptionTest(){
        List<Integer> list1=new List<Integer>();
        list1.add(1);
        list1.add(2);
        list1.add(3);
        try {
            integer atInd4=list1.get(5);
        } catch (Exception e) {
            System.debug(e.getTypeName());
            System.debug(e.getMessage());
        }
    }
}