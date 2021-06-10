public class ParentChildSQL {
      public static void sample(){
    for(Account u: [select id,(select Name from Contacts) from Account])
{   
    for(Contact c:u.Contacts)
         System.debug('University Name:'+u.id+'   College Name:'+c.Name);
}
}
}