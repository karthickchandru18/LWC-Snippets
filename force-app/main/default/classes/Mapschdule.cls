public class Mapschdule implements Schedulable{
public  void execute(schedulableContext SC)
{
    list<Opportunity> ops=new  list<Opportunity>();
    Map<id,Opportunity> listop=new  map<id,Opportunity> ([select id,name,Stagename,Closedate from Opportunity where Stagename='Prospecting']);
    Map<id,Opportunity> listop3=new  map<id,Opportunity> ();
    set<id> listop2=new set <id>();
    listop2=listop.keySet();
    list<Opportunity> listop1=new  list<Opportunity>();
    listop1=listop.values();
    system.debug('listop'+listop);
    system.debug('listop2'+listop2);
  for (Opportunity op:listop1 )
  {
      
      op.CloseDate=system.today()+1;
      ops.add(op);
      system.debug('ops'+ops);    
  }
    update ops;

    for(Opportunity op6:[select id,name,Stagename,Closedate from Opportunity where Stagename='Prospecting'])
    {
        listop3.put(op6.id,op6);
        
    }
    
  }  
}