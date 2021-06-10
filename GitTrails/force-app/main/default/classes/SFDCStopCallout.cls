public with sharing class SFDCStopCallout {

    public SFDCStopCallout(ApexPages.StandardController controller) {

    }

   
    public static list<account> getBlogs() {
        list<account> acclist=new list<account>();
        HTTP http = new HTTP();
      
        HTTPRequest request = new HTTPRequest();
       
        request.setEndpoint('https://sfdcstop.herokuapp.com/blogs');
        //request.setEndpoint('callout:Pardot');
        request.setMethod('GET');
        
        HTTPResponse response = http.send(request);
       
        if(response.getStatusCode() == 200) {
           
            SFDCStopBlogsWrapper responseWrapper = SFDCStopBlogsWrapper.parse(response.getBody());
            
            System.debug('Author:- ' + responseWrapper.author);
             System.debug('blogs:- ' + responseWrapper.blogs);
            
            if((responseWrapper.blogs!=null) && (!responseWrapper.blogs.isEmpty())) {
                
                for(Integer i=0; i<responseWrapper.blogs.size(); i++) {
                    SFDCStopBlogsWrapper.Blogs blog = responseWrapper.blogs.get(i);
                    System.debug('Blog Id:- ' + blog.id);
                    System.debug('Blog Title:- ' + blog.title);
                    System.debug('Blog URL:- ' + blog.url);
                    
                    account acc=new account();
                    acc.Name='test'+blog.id;
                   // acc.AccountNumber=blog.title;
                    acc.Site=blog.url;
                    acclist.add(acc);
                }
                insert acclist;
            }
        }
        return acclist;
    }
}