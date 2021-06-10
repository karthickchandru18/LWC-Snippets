@restresource (urlmapping='/samplewrapper/*')
global class samplewrapper {
    public static  restrequest getrequest;
    public static List<Account> accountObj= new list<Account>();
    public static List<contact> contactobj= new list<contact>();
    public class requestwrapper{
    public List<Account> Accdata= new list<Account>();
    public List<contact> Condata= new list<contact>();
    }
    @httppost
    global static void getdata()
    {
        getrequest=restcontext.request;
        List<requestwrapper> requestData=(List<requestwrapper>) Json.deserialize(getrequest.requestBody.tostring(), List<requestwrapper>.class);
        for(requestwrapper req:requestData)
        {
   		accountObj = req.accData;
           
            
        contactobj = req.Condata;
        }
        upsert accountObj;
        
        
        upsert contactobj;
    }                                                       
}