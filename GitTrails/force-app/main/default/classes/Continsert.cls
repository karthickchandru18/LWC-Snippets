public class Continsert 

{
@InvocableMethod 
 public static void insert_cont()
 {
     //To insert multiple contacts
     List<Contact> cont=new List<Contact>{
         new Contact(FirstName='Sharan',LastName='Mary',Department='CSE',AccountID='0017F00001h3xOW'),
         new Contact(FirstName='Sherine',LastName='Immaculate',Department='ECE',AccountID='0017F00001h3xOW'),
         new Contact(FirstName='Reena',LastName='James',Department='CSE',AccountID='0017F00001h3xOW')   
     };
     
     //DML Operation on Contact
     insert cont;
     
     //To Update Contacts
     List<Contact> conupd=new List<Contact>();
     for(Contact Con:cont)
     {
         if(Con.Department=='CSE')
         {
             Con.Department='EEE';
         }
         conupd.add(Con);
     }
     update conupd;
 }

}