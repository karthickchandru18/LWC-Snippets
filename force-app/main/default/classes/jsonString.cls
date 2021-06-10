public class jsonString {
    public Artists artists {get;set;}
    public Tracks tracks {get;set;}
   
    public class External_ids {
        public String isrc {get;set;}
    }
   
    public class Items_Z {
        public Album album {get;set;}
        public List<Artists_Z> artist {get;set;}
        public Integer disc_number {get;set;}
        public Integer duration_ms {get;set;}
        public Boolean explicit {get;set;}
        public External_ids external_ids {get;set;}
        public External_urls external_urls {get;set;}
        public String href {get;set;}
        public String id {get;set;}
        public Boolean is_local {get;set;}
        public Boolean is_playable {get;set;}
        public String name {get;set;}
        public Integer popularity {get;set;}
        public String preview_url {get;set;}
        public Integer track_number {get;set;}
        public String type_Z {get;set;} // in json: type
        public String uri {get;set;}
    }
   
    public class Tracks {
        public String href {get;set;}
        public List<Items_Z> items {get;set;}
        public Integer limit_Z {get;set;} // in json: limit
        public String next {get;set;}
        public Integer offset {get;set;}
        public String previous {get;set;}
        public Integer total {get;set;}
    }
   
    /*public class Searchjson {
public Artists artists {get;set;}
public Tracks tracks {get;set;}
}*/
   
    public class Images {
        public Integer height {get;set;}
        public String url {get;set;}
        public Integer width {get;set;}
    }
   
    public class Artists_Z {
        public External_urls external_urls {get;set;}
        public String href {get;set;}
        public String id {get;set;}
        public String name {get;set;}
        public String type_Z {get;set;} // in json: type
        public String uri {get;set;}
    }
   
    public class Album {
        public String album_type {get;set;}
        public List<Artists_Z> artists {get;set;}
        public External_urls external_urls {get;set;}
        public String href {get;set;}
        public String id {get;set;}
        public List<Images> images {get;set;}
        public String name {get;set;}
        public String release_date {get;set;}
        public String release_date_precision {get;set;}
        public Integer total_tracks {get;set;}
        public String type_Z {get;set;} // in json: type
        public String uri {get;set;}
    }
   
    public class Items {
        public External_urls external_urls {get;set;}
        public Followers followers {get;set;}
        public List<String> genres {get;set;}
        public String href {get;set;}
        public String id {get;set;}
        public List<Images> images {get;set;}
        public String name {get;set;}
        public Integer popularity {get;set;}
        public String type_Z {get;set;} // in json: type
        public String uri {get;set;}
    }
   
    public class Followers {
        public String href {get;set;}
        public Integer total {get;set;}
    }
   
    public class External_urls {
        public String spotify {get;set;}
    }
   
    public class Artists {
        public String href {get;set;}
        public List<Items> items {get;set;}
        public Integer limit_Z {get;set;} // in json: limit
        public String next {get;set;}
        public Integer offset {get;set;}
        public String previous {get;set;}
        public Integer total {get;set;}
    }
   
}