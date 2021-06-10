public class MapExample {
    public static void example()
    {
        List<Account> accs= new list<Account>();
        List<Contact> cons= new list<Contact>();
        accs=[select id,name,(select id from Contacts) from Account];
        cons=[select id from Contact where accountid!=null and accountid!=''];
        for( Contact c:cons)
            {
                for( Account a:accs)
       				 {
                  integer count=a.Contacts.size();
					system.debug('count'+count);
                         
                         if(count>2)
                         {
                             a.Description='Too Many Contacts';
                         }
                }
            }
        }
    }