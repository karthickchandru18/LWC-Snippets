trigger CovidTracker on Covid_Affected_People__c (after insert,after update) {
    set<id>CovidAreas=new set<id>();
    string recid;
    integer NumberofChilds;
    List<Covid_Area__c> Covidlist=new  List<Covid_Area__c>();
    if (Trigger.isInsert || Trigger.isUpdate)
    {
        FOR (Covid_Affected_People__c cap: Trigger.new )
        {
            if(cap.Covid_Area__c!=null)
            {
                CovidAreas.add(cap.Covid_Area__c);
            }
        }
        List<aggregateresult> results=[select Avg(Cured_Days__c) cureddays,Covid_Area__c from Covid_Affected_People__c where Covid_Area__c in:CovidAreas group by Covid_Area__c];
        for(aggregateresult result: results)
        {
            recid = string.valueOf(result.get('Covid_Area__c'));
            NumberofChilds = integer.valueOf(result.get('cureddays'));
            Covid_Area__c CA=new Covid_Area__c(id=recid,Avg_Days_Taken_for_Cure_in_This_Area__c=NumberofChilds);
            Covidlist.add(CA);
        }
        update Covidlist;
    }
}