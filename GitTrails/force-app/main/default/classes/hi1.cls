public class hi1
{
    public List<Kindle__C> code {get;set;}
  
    public hi1()
    {
        Map<String,Kindle__C> allCodes = Kindle__C.getAll();
        code = allCodes.values();
    } 
  
}