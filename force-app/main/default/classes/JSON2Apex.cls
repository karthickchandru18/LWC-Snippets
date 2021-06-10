public class JSON2Apex {

		public List<GetService> getService;

		public  class GetService {
			public String name;
		}

		
		public static JSON2Apex parse(String json) {
			return (JSON2Apex) System.JSON.deserialize(json, JSON2Apex.class);
		}
	}