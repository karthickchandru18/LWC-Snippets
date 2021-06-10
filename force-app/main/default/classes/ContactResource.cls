@RestResource(urlMapping='/ContactAPI/*')
global with sharing class ContactResource {
   
   @HTTPGet
    global static List<Contact> getContactIdAndNames() {
  
        RestRequest contactRequest = RestContext.request;
        system.debug('contactRequest===='+contactRequest);
        String contactRequestURI = contactRequest.requestURI;
        system.debug('contactRequestURI===='+contactRequestURI);
        Integer contactLimit = Integer.valueOf(contactRequestURI.substring(contactRequestURI.lastIndexOf('/') + 1));
     
        List<Contact> contactList = [SELECT Id, Name FROM Contact LIMIT :contactLimit];
      
        return contactList;
    }
    
     @HTTPPost
    global static Contact createNewContact() {
        
        RestRequest contactRequest = RestContext.request;
        
        String requestBody = contactRequest.requestBody.toString();
       
        Contact contact = (Contact) JSON.deserialize(requestBody, Contact.class);
        
        insert contact;
        
        return contact;
    }

}