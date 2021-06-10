public class ContactAndLeadSearch 
{
   public static List<List<sObject>> searchContactsAndLeads(String searchword)
   {
       String word='FIND \''+ searchword +'\' IN ALL FIELDS RETURNING Lead(Name,FirstName,LastName),Contact(FirstName,LastName)';
       List<List<sObject>> searchleadcontact=search.query(word);
       return searchleadcontact;
   }
}