public class AccountTriggerHandler {
    public static void createContact(List<Account> accounts) {
        List<Contact> contact = new List<Contact>();
        for(Account acc : accounts){
            Contact con = new Contact();
                con.LastName = acc.name;
                con.AccountId=acc.id;
                con.MailingStreet=acc.BillingStreet;
                con.MailingCity=acc.BillingCity;
                con.MailingState=acc.BillingState;
                con.MailingPostalCode=acc.BillingPostalCode;
                con.MailingCountry=
                con.Fax=acc.Fax;
            contact.add(con);
        }
        insert contact; 
    }
}