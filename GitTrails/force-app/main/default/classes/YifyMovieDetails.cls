public class YifyMovieDetails {
    public class Movie {
        public Integer id;
        public String url;
        public String imdb_code;
        public String title;
        public String title_english;
        public String title_long;
        public String slug;
        public Integer year;
        public Double rating;
        public Integer runtime;
        public List<String> genres;
        public Integer download_count;
        public Integer like_count;
        public String description_intro;
        public String description_full;
        public String yt_trailer_code;
        public String language;
        public String mpa_rating;
        public String background_image;
        public String background_image_original;
        public String small_cover_image;
        public String medium_cover_image;
        public String large_cover_image;
        public List<Torrents> torrents;
        public String date_uploaded;
        public Integer date_uploaded_unix;
    }
    public class JsonParser{
        public String status;
        public String status_message;
        public Data data;
        public meta metadata;
    }
    
    
    
    public class Torrents {
        public String url;
        public String hash;
        public String quality;
        public String type;
        public Integer seeds;
        public Integer peers;
        public String size;
        public Integer size_bytes;
        public String date_uploaded;
        public Integer date_uploaded_unix;
    }
    
    public class Data {
        public Movie movie;
    }
    
    public class meta {
        public Integer server_time;
        public String server_timezone;
        public Integer api_version;
        public String execution_time;
    }
    public static void Moviecode(string code){
        string endpoint = 'https://yts.mx/api/v2/movie_details.json?movie_id=';
        if(string.isNotBlank(code)){
            endpoint = endpoint+ code; 
        }
        Http h = new Http();
        HttpRequest hreq = new HttpRequest();
        hreq.setMethod('GET');
        hreq.setEndpoint(endpoint);
        hreq.setHeader('content-type','application/json');
        HttpResponse hresp = h.send(hreq);
        system.debug('****hresp'+hresp.getStatusCode());
        system.debug('****getBody'+hresp.getBody());
        if(hresp.getStatusCode() ==200){
            {
                string res=hresp.getBody();
                 res=res.replace( '@meta','metadata');
                system.debug('****res'+res);
                JsonParser eachMovie = (JsonParser)json.deserialize(res, JsonParser.class);
                system.debug('eachMovie'+eachMovie);
            }
        }
    }
}