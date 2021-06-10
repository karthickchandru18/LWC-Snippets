public class StringDuplicateOccurence {
    Public static void occurmethod(){
        List<String> nameArray = new List<String>{'A','B','C','D','A','B','A','A','A','A','D','D'};
            Map<String,Integer> mapstring = new Map<String,Integer>();
        for(String element : nameArray)
        {
            if(!mapstring.containsKey(element))
            {
                mapstring.put(element,0);
            }
            Integer currentInt=mapstring.get(element)+1;
            system.debug(element+' '+currentInt);
            mapstring.put(element,currentInt);
        }
        system.debug(mapstring);
    }
}