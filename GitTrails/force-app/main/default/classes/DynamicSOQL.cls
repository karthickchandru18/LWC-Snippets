public class DynamicSOQL {
    public static void search(string fieldname,string objectname)
    {
        string query='select ';
        if(fieldname!=null && fieldname!=''&&objectname!=null && objectname!='')
        {
			fieldname = fieldname.replace(' ', ',');
            query=query+fieldname+' from '+objectname;
            system.debug('query'+query);
        }
        List<sobject> s=Database.query(query);
        system.debug('s--'+s);
    }
}