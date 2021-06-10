@isTest
public class postaltestclass {
    @istest
    public static void method1(){
        test.startTest();
        Test.setMock(HttpCalloutMock.class, new Postaltest());
        Postal.getmethod1('754207');
        test.stopTest();
    }
}