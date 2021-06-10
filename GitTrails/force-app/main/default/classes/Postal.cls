public class Postal {
    public class wrapperclass{
        public string Message;
        public string Status;
        public List<PostOffice> PostOffice;
    }
    public class PostOffice{
        public string name;
        public string Description;
        public string BranchType;
        public string DeliveryStatus;
        public string Circle;
        public string District;
        public string Division;
        public string Region;
        public string Block;
        public string State;
        public string Country;
        public string Pincode;
    }
    Public static void getmethod1(string pincode){
        List<contact> alist=new List<contact>();
        string endpoint = 'https://api.postalpincode.in/pincode/';
        if(string.isNotBlank(pincode)){
            endpoint = endpoint+ pincode; 
        }
        http h1=new http();
        httprequest  req=new httprequest();
        req.setEndpoint(endpoint);
        req.setMethod('GET');
        httpresponse res=h1.send(req);
        if(res.getStatusCode()==200)
        {
            List<wrapperclass> wraps=(List<wrapperclass>)json.deserialize(res.getBody(), List<wrapperclass>.class);
            for (wrapperclass ac:wraps)
            {
                for(integer i=0;i<ac.PostOffice.size();i++)
                {
                    PostOffice pos=ac.PostOffice.get(i);
                    system.debug('datas sample'+pos.name);
                    contact c=new contact();
                    c.lastname='postal '+pos.name;
                    alist.add(c);
                }
            }
         insert alist;
        }
    }
}