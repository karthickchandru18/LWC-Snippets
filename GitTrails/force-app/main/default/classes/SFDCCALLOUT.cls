public class SFDCCALLOUT {
    Public Class wrapper{
        Public String author;
        Public List<blogs> blogs;
    }
     Public Class blogs{
        public string id;
        public string title;
        public string url;
    }
    public static void getmethod()
    {
        List<account> alist=new List<account>();
        http h=new http();
        httprequest req= new httprequest();
       //req.setEndpoint('https://sfdcstop.herokuapp.com/blogs');
        req.setEndpoint('callout:SFDCCALLOUT');
        req.setMethod('GET');
        httpresponse res=h.send(req);
        if (res.getStatusCode()==200)
        {
            wrapper wrap= (wrapper)json.deserialize(res.getBody(), wrapper.class);
            if((wrap.blogs!=null) && (!wrap.blogs.isEmpty())) {
                for(Integer i=0; i<wrap.blogs.size(); i++) {                   
                    SFDCCALLOUT.Blogs blog = wrap.blogs.get(i);
                    System.debug('Blog id:- ' + blog.id +' Blog title:- '+ blog.title +'Blog url:- '+ blog.url);
                    account a = new account();
                    a.Name='salesforce '+blog.id;
                    a.Description= blog.title;
                    alist.add(a);
                }
            }
        }insert alist;
    }
}