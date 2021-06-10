public class GetAccountList {
    @AuraEnabled
    public static List<Account> GetAccount()
    {
        List<Account> lstAccount=[Select Id,Name,Subscriber__c,Country__c,Potential_Value__c FROM Account];
        return lstAccount;
    } 
}