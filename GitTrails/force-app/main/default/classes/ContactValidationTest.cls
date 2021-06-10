@istest
public class ContactValidationTest {
    @istest
    public static void testmethod1()
    {
        Account a=new Account();
        a.name='testing';
        insert a;
        
       contact c=new contact();
       c.lastname='test';
       c.AccountId=a.id;
       insert c;
        
        
    }
}