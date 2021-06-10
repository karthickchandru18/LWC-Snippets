@isTest
public class RestLeadConvertTest{

    static testMethod void testHttpGet() {
        Lead l = new Lead();
        l.FirstName = 'First';
        l.LastName = 'Last';
        l.Company = 'Unit Test';
        insert l;
        
        String myJSON =  '{\"LeadID\":'+
		'{'+
		'\"Id\":\"'+l.id+'\"'+
		'}'+
		'}';
        
        Test.startTest();
        RestRequest request = new RestRequest();
        request.requestUri ='/services/apexrest/RestLeadConvert1';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueof(myJSON);
        
        RestContext.request = request;
        RestLeadConvert.doGet();
        Test.stopTest();
    }
    static testMethod void testHttpGetex() {
        Lead l = new Lead();
        l.FirstName = 'First';
        l.LastName = 'Last';
        l.Company = 'Unit Test';
        insert l;
        
        String myJSON =  '{\"LeadID\":'+
		'{'+
		'\"Id\":\"43242\"'+
		'}'+
		'}';
        
        Test.startTest();
        RestRequest request = new RestRequest();
        request.requestUri ='/services/apexrest/RestLeadConvert1';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueof(myJSON);
        
        RestContext.request = request;
        RestLeadConvert.doGet();
        Test.stopTest();
    }

}