public class Schdule implements Schedulable {
public void execute(SchedulableContext SC)
{
    list<Opportunity> ops=new  list<Opportunity>();
    List<Opportunity> listop=new  list<Opportunity> ([select id,name,Stagename,Closedate from Opportunity where Stagename='Prospecting']);
    system.debug('listop'+listop);
  for (Opportunity op:listop )
  {
      op.CloseDate=system.today();
      ops.add(op);
      system.debug('ops'+ops);    
  }
    update ops;
}
}