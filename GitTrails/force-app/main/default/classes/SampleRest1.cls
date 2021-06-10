@restresource(urlmapping='/SampleRest1/*')
Global class SampleRest1 {
public static restrequest getrequest;
public static account Accdata;
    @httppost
    Global static string getpost()
    {
        getrequest=restcontext.request;
        Accdata=(Account) json.deserialize(getrequest.requestbody.tostring() , account.class);
        upsert Accdata;
        return json.serialize(Accdata);
    }
}