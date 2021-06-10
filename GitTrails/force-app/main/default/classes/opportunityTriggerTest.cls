@istest
public class opportunityTriggerTest {
    
    @istest
    public static void test1()
    {
        opportunity op=new opportunity();
        op.Name='all';
        op.CloseDate=system.today();
        op.Type='Existing Customer - Upgrade';
        op.Amount=12;
        op.StageName='prospect';
        insert op;
    }
@istest
    public static void test2()
    {
        opportunity op=new opportunity();
        op.Name='all';
        op.CloseDate=system.today();
        op.Type='New Customer';
        op.Amount=12;
        op.StageName='prospect';
        insert op;
    }

}