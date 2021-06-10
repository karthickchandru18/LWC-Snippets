trigger RollUpFromChildToParent on Contact (after insert,  after delete, after undelete) {
    
    Set<Id> accountIds = new Set<Id>();
    
    if(Trigger.isInsert  || Trigger.isUndelete){
        for(Contact con : Trigger.new){
            if(con.AccountId != null){
                accountIds.add(con.AccountId); 
            }
        }
    }
    
    if(Trigger.isDelete ){
        for(Contact con : Trigger.old){
            if(con.AccountId != null){
                accountIds.add(con.AccountId);
            }
        }
    }
    
    
    List<Account> accList = new List<Account>();
    List<Contact> ag=new  List<Contact>();
   // for( id acid:accountIds)
  //  {
        List<Contact> users = [SELECT Name, Accountid FROM Contact where Accountid in: accountIds];
        for (id u : accountIds) {
            account ac= new account();
            ac.id=u;
            ac.child_count__c=users.size();
            accList.add(ac);
        }    
   // }
    try{
        Update accList;
    }catch(DmlException de){
        System.debug(de);
    }
}