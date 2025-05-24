public class CarExample{
    public string make;
    public string model;
    public integer averageSpeed;
    
    public void display(){
        System.debug(make);
        System.debug(model);
        System.debug(averageSpeed);
    }
}

{
    CarExample bmw=new CarExample();
    
    bmw.make='a';
    bmw.model='b';
    bmw.averageSpeed=123123;
    
    bmw.display();
}