@restresource(urlmapping='/dynamicsoql1/*')
global class dynamicsoql1 {
    public class wrappingclass {
        public String Objectname;
    }
    @httppost
    global static List<id> getmethod()
    {
        List<id> resultIds;
        List<sObject> sobjList ;
        RestRequest Request1 = RestContext.request;
        String requestBody = Request1.requestBody.toString();
        wrappingclass obj = (wrappingclass) JSON.deserialize(requestBody, wrappingclass.class);
        string soql ='select id from ';
        string objectname=obj.ObjectName;
        if (ObjectName!=null && ObjectName!='')
        {
            soql+=ObjectName;
            system.debug('soql==='+soql);
            sobjList = Database.query(soql);
            system.debug('sobjList==='+sobjList);
            map<id,sobject> maps=new Map<Id,SObject>(sobjList);
            resultIds.addall(maps.keySet());
            system.debug('resultIds==='+resultIds);
        }
       
        return resultIds;
    }
}