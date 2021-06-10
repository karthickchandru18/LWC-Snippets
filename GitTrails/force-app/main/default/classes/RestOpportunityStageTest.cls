@isTest
public class RestOpportunityStageTest{

    static testMethod void testHttpGet1() {
        Account a = new Account();
        A.Name = 'First';
        insert A;
        
        Opportunity O = new Opportunity();
        O.Name = 'First';
        O.AccountId=A.Id;
        O.CloseDate=system.today();
        O.StageName='Prospecting';
        insert O;
        
        String myJSON =  '{"AccountID":{"Id":"'+A.id+'","Type":"Customer"},"OpportunityID":{"Id":"'+O.id+'","StageName":"Closed-Won"}}';
        
        Test.startTest();
        RestRequest request = new RestRequest();
        request.requestUri ='/services/apexrest/RestOpportunityStage';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueof(myJSON);
        
        RestContext.request = request;
        RestOpportunityStage.doPost();
        Test.stopTest();
    }
    static testMethod void testHttpGetex() {
        String myJSON =  '{"AccountID":{"Id":"123","Type":"Lost Customer"},"OpportunityID":{"Id":"456","StageName":"Closed-Lost"}}';
        
        Test.startTest();
        RestRequest request = new RestRequest();
        request.requestUri ='/services/apexrest/RestOpportunityStage';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueof(myJSON);
        
        RestContext.request = request;
        RestOpportunityStage.doPost();
        Test.stopTest();
    }

}