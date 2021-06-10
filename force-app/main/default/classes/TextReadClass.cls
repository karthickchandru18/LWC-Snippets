public class TextReadClass

{
    
    public String Content {get;set;}
    
    public TextReadClass()
        
    {
        
        
        List<Document> d = [Select body, bodyLength, ContentType, Url from Document];
        
        if(d.size()>0)
            for(Document dr:d)
            
        {
            
            Blob b = dr.body;
            
            Content  = b.toString();
            
        }
        
    }
    
}