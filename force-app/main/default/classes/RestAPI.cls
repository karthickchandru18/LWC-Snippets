@Restresource(urlmapping='/RestAPI/*')
global class RestAPI {   
    public static RestRequest request;
    public static RestRequest getRequest;
    public static requestWrapper requestData1;
    global class requestWrapper{
    global Account Details{get;set;}
    }
  
    @HttpPost
    global static String getRecords(){
        getRequest = RestContext.request;
        requestData1 =  (requestWrapper) System.JSON.deserialize(getRequest.requestBody.toString(),requestWrapper.class);
        System.debug('REQUESTed raw data=='+requestData1);
        string response;
        return response;
    }
}
//{"Details":{"Name":"123"}}