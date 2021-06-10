public class AccountHandler {
    Public Static void CountofContact(List<Contact> Contacts)
    {
        Set<id> Accid=new Set<id>();
        for (Contact con: Contacts)
        {
            Accid.add(con.accountid);
        }
        List<Account> Accs=[select id, (select id from contacts) from account where id in:Accid];
        map<id,integer> accsize=new  map<id,integer>();
        for(Account a: Accs)
        {
            List<Contact> Cons=a.contacts;
            integer count=Cons.size();
            accsize.put(a.id, count);
        }
        for(Contact con : Contacts)
        {
            id parentid=con.AccountId;
            if(parentid!=null || parentid!='')
            {
                integer concount=accsize.get(parentid);
               // con.numofcons__c=concount;
                
            }
        }
    }
}