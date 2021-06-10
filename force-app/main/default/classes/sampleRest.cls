@restresource (urlmapping='/Sampletest/*')
global class sampleRest {
    public static restrequest getrequest;
    public static Account Accdata;
    
    @httppost
    global static string getpost()
    {
      getrequest=restcontext.Request;
      Accdata=(Account) Json.deserialize(getrequest.requestBody.tostring() , Account.class);
      upsert Accdata;
      return json.serialize(Accdata);
    }

}