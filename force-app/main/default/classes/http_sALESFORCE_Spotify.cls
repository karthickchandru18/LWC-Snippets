public class http_sALESFORCE_Spotify {
   public jsonString jsonvar{
        get;
        set;
    }  
    public String Title {
        get;
        set;
    }
    public List<String> SongName1 {
        get;
        set;
    }
    public string songname;
    Spotify__mdt gd= [Select Refresh_token_spotify__c from Spotify__mdt];
    String refreshtoken = gd.Refresh_token_spotify__c;
    public void invoke(){
        string key = '46df154797184884bdff2a51a76e7aeb';
        string secret = '1df6527db1074bc698272c2e8ecaebd8';
        string redirect_uri = 'https://ktech2-dev-ed--c.visualforce.com';
        String accesstoken;
        String thumbnailLink;
        String fid;
        String clink;
        Integer expiresIn;
        String tokentype;
        String resp;
        String res2;
        SongName1 = new List<String>();
        HttpRequest req = new HttpRequest();
        req.setMethod('POST');
        //EndPoint Set on the Remote Site Setting
        req.setEndpoint('https://accounts.spotify.com/api/token');
        req.setHeader('content-type', 'application/x-www-form-urlencoded');
        String messageBody = 'client_id=' + key + '&client_secret=' + secret + '&refresh_token='+refreshtoken + '&redirect_uri=' + redirect_uri + '&grant_type=refresh_token';
        req.setHeader('Content-length', String.valueOf(messageBody.length()));
        req.setBody(messageBody);
        req.setTimeout(60 * 1000);
        Http h = new Http();
        HttpResponse res = h.send(req);
        resp = res.getBody();
        JSONParser parser = JSON.createParser(resp);
        while (parser.nextToken() != null) {
            if ((parser.getCurrentToken() == JSONToken.FIELD_NAME)) {
                String fieldName = parser.getText();
                parser.nextToken();
                if (fieldName == 'access_token') {
                    accesstoken = parser.getText();
                }
                else if (fieldName == 'expires_in') {
                    expiresIn = parser.getIntegerValue();
                } else if (fieldname == 'token_type') {
                    tokentype = parser.getText();
                }
            }
        }
        system.debug('refToken'+accesstoken );        
         Http http1 = new Http();
        HttpRequest req1 = new HttpRequest();
        HttpResponse res1 = new HttpResponse();
        req1.setMethod('GET');
        //req1.setEndpoint('https://api.spotify.com/v1/albums/'+Title);//('https://api.spotify.com/v1/albums/'+Title);('https://api.spotify.com/v1/search/'+Title)
        req1.setEndpoint('https://api.spotify.com/v1/search?q='+Title+'&type=track&market=US&limit=50&offset=5');
        req1.setHeader('Authorization', 'Bearer '+accesstoken);
        req1.setHeader('Content-Type','application/json');
        res1 = http1.send(req1);
        res2 = res1.getBody();
        system.debug('infoooooo------------>'+res2);
        jsonvar = (jsonString)JSON.deserialize(res1.getBody(),jsonString.class);//(res2, spotify_details.class);
        for(jsonString.Items_Z item : jsonvar.tracks.items){
           SongName1.add(item.name+'-'+'('+item.album.name+')');
        }
    }
}