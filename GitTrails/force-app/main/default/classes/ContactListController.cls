public class ContactListController {
    
    @AuraEnabled
    public static List<contact> getcontactlist(){
        List<contact> contactList=new List<contact>([select id,name,email,Lastname from contact where email!=null]);
            return contactList;
    }
}