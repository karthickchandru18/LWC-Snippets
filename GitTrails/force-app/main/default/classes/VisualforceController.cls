public class VisualforceController {
    Public List<Aggregateresult> result{get;set;}
        Public List<Opportunity> asce{get;set;}
        Public List<Opportunity> desce{get;set;}
    public List<OpportunityWrapper> oppty{get;set;}		
    public VisualforceController	(){
        result=[select stagename,sum(Amount)total,min(Amount)minval,max(Amount)maxval,avg(Amount)avg from Opportunity group by stagename];
          asce=[select name,stagename from Opportunity order by name asc];
          desce=[select name,stagename from Opportunity order by name desc];
        oppty= new list<OpportunityWrapper>();
        for (Aggregateresult rs:result)
        {
            OpportunityWrapper op=new OpportunityWrapper();
            op.stagename=(string)rs.get('stagename');
     	 	 op.Total=(decimal)rs.get('total');
             op.minval=(decimal)rs.get('minval');
             op.maxval=(decimal)rs.get('maxval');
             op.Avg=(decimal)rs.get('avg');
            oppty.add(op);
         }
            
    }
    
}