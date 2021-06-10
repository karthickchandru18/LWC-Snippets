public class PostalDepartmentAPIsample {
    public class PostalResponseWrapper{
        public string Name;
        public string Description;
        public string PINCode;
        public string BranchType;
        public string DeliveryStatus;
        public string Circle;
        public string District;
        public string Division;
        public string Region;
        public string State;
        public string Country;
    }
    public static void postOfficeByPincode(string pincode){
        list<PostalResponseWrapper> postalList = new list<PostalResponseWrapper>();
        string endpoint = 'https://api.postalpincode.in/pincode/';
        if(string.isNotBlank(pincode)){
            endpoint = endpoint+ pincode; 
        }
        Http h = new Http();
        HttpRequest hreq = new HttpRequest();
        hreq.setMethod('GET');
        hreq.setEndpoint(endpoint);
        hreq.setHeader('content-type','application/json');
        HttpResponse hresp = h.send(hreq);
        system.debug('****hresp'+hresp.getStatusCode());
        if(hresp.getStatusCode() ==200){
            JSONParser parser = JSON.createParser(hresp.getBody()); 
            parser.nextToken();
            system.debug('parser==='+parser.gettext());
            parser.nextToken();
            system.debug('parser==='+parser.gettext());
            parser.nextToken();
            system.debug('parser==='+parser.gettext());
            parser.nextToken();
            system.debug('parser==='+parser.gettext());
            while(parser.nextToken()!=NULL){
                if(parser.getcurrentToken() == JSONTOKEN.START_ARRAY ){
                    while(parser.nextToken()!=NULL){
                        if(parser.getcurrentToken() == JSONTOKEN.START_OBJECT) {
                            {
                                PostalResponseWrapper eachPostal = (PostalResponseWrapper)parser.readValueAs(PostalResponseWrapper.class);
                                postalList.add(eachPostal);
                                system.debug('eachPostal'+eachPostal);
                            }
                        }   
                    }
                }   
            }
        }
    }   
}