global class youtube{
    global static void getYoutubeData(String searchKeyword){
       HttpRequest req = new HttpRequest();
       HttpResponse res = new HttpResponse();
       Http http = new Http();
       
       req.setMethod('GET');
       req.setEndpoint('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&q='+searchKeyword+'&key=AIzaSyDPb13Ku68h8Na3OcU-KY8D0M24jxv4YKU');
       res = http.send(req);
       if(res.getStatusCode() == 200){
         System.debug('result==='+res.getBody());
       }
    }
}