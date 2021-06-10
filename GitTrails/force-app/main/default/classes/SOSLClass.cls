public class SOSLClass {
   // Public string text='title';
    public static List <List <SObject> > searchContactsAndLeads(String str) {
         string text='title';
        //List <List<SObject>> searchList = [FIND :str IN ALL FIELDS RETURNING Contact(FirstName,LastName),Lead(FirstName,LastName)];
        String searchQuery = 'FIND \'' + str + '\' IN ALL FIELDS RETURNING  Account (Id WHERE Name = \''+text+'\')';
 		List<List<SObject>> searchList = System.search.query(searchQuery);
        system.debug('searchList'+searchList);
        return searchList;
    }
      public static List<account> searchContactsAndLeads1(String str) {
List<account> searchList = [select name,Description from account];
                List<account> searchList1= new List<Account>();
          if (searchList.size()>0){

      for(account ac:searchList){
          if(ac.Description.contains(str) ){
              searchList1.add(ac);
          }
      }
              
          }
              
       System.debug('searchList1=='+searchList1);
          
       return searchList1;
  }

 
}
//SOSLClass.searchContactsAndLeads1('title');