public class youtubedetails {
    public class wrapper {
        public String kind;
        public String etag;
        public List<Items> items;
        public PageInfo pageInfo;
    }
    public class Items {
        public String kind;
        public String etag;
        public String id;
        public Statistics statistics;
    }
    public class Statistics {
        public String viewCount;
        public String likeCount;
        public String dislikeCount;
        public String favoriteCount;
        public String commentCount;
    }
    public class PageInfo {
        public Integer totalResults;
        public Integer resultsPerPage;
    }
    @AuraEnabled
    public static void getdetails(string id)
    {
        string videoid=id;
        string APIKey=Youtube_API_Settings__c.getinstance('Youtube key').Value__c;
        string endpoint=Youtube_API_Settings__c.getinstance('Youtube EndPoint').Value__c;
        endpoint=endpoint.replace('[VIDEO_ID]', videoid);
        endpoint=endpoint.replace('[YOUR_API_KEY]', APIKey);
        system.debug('endpoint=='+endpoint);
        http h=new http();
        httprequest req=new httprequest();
        req.setEndpoint(endpoint);
        req.setMethod('GET');
        httpresponse res=h.send(req);
        if(res.getStatusCode()==200)
        {
            system.debug('Data passed');
            wrapper wr=(wrapper)json.deserialize(res.getBody(), wrapper.class);
            Youtube_video__c yt=new Youtube_video__c();
            yt.name=wr.etag;
            yt.Video_Id__c=id;
            yt.No_Of_Comments__c=decimal.valueOf(wr.items[0].statistics.commentCount);
            yt.No_Of_Dislikes__c=decimal.valueOf(wr.items[0].statistics.dislikeCount);
            yt.No_Of_Likes__c=decimal.valueOf(wr.items[0].statistics.likeCount);
            yt.No_Of_View_Count__c=decimal.valueOf(wr.items[0].statistics.viewCount);
            insert yt;
        }
    }
}