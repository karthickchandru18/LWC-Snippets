@restresource(urlmapping='/samplewrap/*')
global class samplewrap {
    public static  restrequest getrequest;
    public static Account Accountobj;
    public static Contact Contactobj;
    public static requetwrapper requestData;

    public class requetwrapper
    {
        public Account Accdata;
        public Contact Condata;
    }
    public class responsewrapper
    {
        public Account Accdata;
        public Contact Condata;
        public string Message;
    }
    
    @httppost
    global static string post()
    {
    getrequest=restcontext.request;
    requestData=(requetwrapper) json.deserialize(getrequest.requestBody.tostring(), requetwrapper.class);
        Accountobj=requestData.Accdata;
        upsert Accountobj;
        requestData.Condata.AccountID=Accountobj.ID;
        //requestData.Condata.put('AccountID',Accountobj.ID);
         Contactobj=requestData.Condata;
          upsert Contactobj;
        
       responsewrapper res = new responsewrapper();
       res.Message = 'Success';
       res.accData = accountObj;
       res.conData = contactObj;
      return JSON.serialize(res);
   
  
    }

}