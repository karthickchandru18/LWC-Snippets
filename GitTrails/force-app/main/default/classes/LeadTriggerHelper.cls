public class LeadTriggerHelper {
    public static void updateleads(Set<string> emailcollection) 
    {
        List<AggregateResult> results = [SELECT  COUNT(Id) totalContacts,Email FROM lead WHERE Email IN :emailcollection GROUP BY Email];
        Map<string,String> newmap=new  Map<string,String>();
        for (AggregateResult result : results) 
        {
            String EmailId = String.valueOf(result.get('Email'));
            String totalContacts = String.valueOf(result.get('totalContacts'));
            newmap.put(EmailId,totalContacts);
        }
        List<Lead> leadupd=new list<lead>();
        for (Lead c:[select id,email,search__c from lead where email in:newmap.keyset()])
        {
            c.search__c=newmap.get(c.email);
            leadupd.add(c);
        }
        update leadupd;
    }
}