global with sharing class MyClass {
    public void collections(){
        List<String> colors = new List<String>();
        colors.add('blue');
        colors.add('red');
        colors.add('blue');
        colors.add('red');
        colors.add(100); // ! Incomaptible type excption
        System.debug(colors.size());
        System.debug(colors);
        
        Map<Integer, String> myMap = new Map<Integer, String>();
        myMap.put(1, 'a');
        myMap.put(2, 'b');
        myMap.put(3, 'c');
        System.debug(myMap.size());
        System.debug(myMap);
        System.debug(myMap.get(2));
        
        Set<Integer> sName = new Set<Integer>();
        sName.add(1);
        sName.add(1);
        sName.add(2);
        sName.add(3);
        sName.add(3);
        sName.add(3);
        sName.add(null);
        sName.add(null);
        System.debug(sName);
    }
}