public class leadTriggerHandler {
    public static void afterInsertHandler(List<Lead> newleads)
    {
        set<string> emailcollection=new set<string>();
        for (lead ld : newleads) 
        {
            if (String.isNotBlank(ld.Email)) 
            {
                emailcollection.add(ld.Email);
            }
        }
        LeadTriggerHelper.updateleads(emailcollection);
    }
    public static void afterUpdateHandler(List<Lead> newLead, Map<Id, Lead> oldLeadsMap) 
    {
        set<string> emailcollection=new set<string>();
        for (Lead ld : newLead) 
        {
            if (String.isNotBlank(ld.Email) && oldLeadsMap.get(ld.Id).Email !=ld.Email) 
            {
                emailcollection.add(ld.Email);
                emailcollection.add(oldLeadsMap.get(ld.Id).Email);
            }
        }
        LeadTriggerHelper.updateleads(emailcollection);
    }
    public static void afterDeleteHandler(List<Lead> oldleads)
    {
        set<string> emailcollection=new set<string>();
        for (lead ld : oldleads) {
            if (String.isNotBlank(ld.Email)) 
            {
                emailcollection.add(ld.Email);
            }
        }
        LeadTriggerHelper.updateleads(emailcollection);
    }
    public static void afterUndeleteHandler(List<Lead> newleads)
    {
        set<string> emailcollection=new set<string>();
        for (lead ld : newleads) {
            if (String.isNotBlank(ld.Email)) 
            {
                emailcollection.add(ld.Email);
            }
        }
        LeadTriggerHelper.updateleads(emailcollection);
    }
}