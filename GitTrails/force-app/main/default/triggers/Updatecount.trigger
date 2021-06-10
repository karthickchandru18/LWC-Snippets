trigger Updatecount on contact (after insert, after delete, after undelete) {
/*
   List<account> ct = new List<account>();
   
   List<Id> custord = new List<Id>();
   
   if(Trigger.isDelete) {
     for(Contact test:Trigger.Old) {
      
        custord.add(test.accountid);   
    
     }   
   
   }
   else
   {
     for(Contact test:Trigger.New) {
      
        custord.add(test.accountid);   
    
     }
   }
   
   AggregateResult[] groupedResults = [SELECT COUNT(Id), accountid FROM Contact where accountid IN :custord GROUP BY accountid ];
  
   for(AggregateResult ar:groupedResults) {
     system.debug('ar========'+ar);
     Id custid = (ID)ar.get('accountid');
     
     integer count = (integer)ar.get('expr0');
     system.debug('count=='+count);
     account cust1 = new account(Id=custid);
     
     cust1.child_count__c = count ;
     
     ct.add(cust1);
      
   }

   update ct;
*/
}