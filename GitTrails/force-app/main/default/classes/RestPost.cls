@RestResource(urlMapping='/RestPost/*')
global with sharing class RestPost {
    // Post Method
    @HTTPPost
    global static string createNewAccount() {
        // Initializing the request parameter with the incoming request
        RestRequest AccountRequest = RestContext.request;
        // Getting the request body from the request
        String requestBody = AccountRequest.requestBody.toString();
        // Deserializing the JSON response body and assigning it to an instance of Contact object
        Account Account = (Account) JSON.deserialize(requestBody, Account.class);
        // Inserting Account
        string g='fail';
        insert Account;	
        // Returning the Account in the response
        return g;
    }
}