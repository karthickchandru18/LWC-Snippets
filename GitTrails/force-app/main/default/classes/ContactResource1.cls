@RestResource(urlMapping='/ContactAPI1/*')
global with sharing class ContactResource1 {

   
    @HTTPGet
    global static List<Contact> getContactIdNameAndLeadSource() {
       
        RestRequest contactRequest = RestContext.request;
        
        Map<String, String> contactRequestParams = contactRequest.params;
        
        Integer contactLimit = Integer.valueOf(contactRequestParams.get('limit'));
        String leadSource = contactRequestParams.get('leadsource');
		integer num= Integer.valueOf(contactRequestParams.get('num'));
        
        List<Contact> contactList = [SELECT Id, Name, LeadSource FROM Contact WHERE LeadSource =:leadSource and numofcons__c =:num LIMIT :contactLimit];
        
        return contactList;
    }

}