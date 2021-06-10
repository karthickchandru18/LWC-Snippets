public class accounthelp {
    Public static void test2(List<Account> ac){
        List <Account> aclist=new list<Account>();
        for( Account a:ac){
            if(a.Description!=null&&a.Description!='')
            {
                a.Description = 'New description';
                aclist.add(a);
            }
            else{
            a.Description = 'old description';
                aclist.add(a);
        }
        
    }
        insert aclist;
}
}