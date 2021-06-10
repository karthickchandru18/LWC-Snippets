@istest
public class AccounttriggerTest {
    @istest
    public  static  void  test1(){
        account a= new account();
        a.name='test';
        insert a;
        
       
    }
     public  static  void  test2(){
     account a2= new account();
        a2.name='test';
        a2.Description='test';
        insert a2;
}
}