public class CovidCountryAPI {
    Public class Covidwrapper{
        public string Country;
        public string Slug;
        public string ISO2;
    }
    public static void main1()
    {
        
        http h=new http();
        httprequest req=new httprequest();
        req.setEndpoint('callout:covidcountry');
        req.setMethod('GET');
        httpresponse res=h.send(req);
        if(res.getStatusCode()==200)
        {
            List<Covidwrapper> cws=(List<Covidwrapper>)json.deserialize(res.getBody(), List<Covidwrapper>.class);
            List<account> conlist=new  List<account>();
            for (Covidwrapper c:cws)
            {
                account con=new account();
                con.name=c.Country;               
                conlist.add(con);
            }
             insert conlist;
        }
    }
}