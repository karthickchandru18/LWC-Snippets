@isTest

public class RestTest{

    static testMethod void testHttpGet() {

        Lead l = new Lead();

        l.FirstName = 'First';

        l.LastName = 'Last';

        insert l;

        Test.startTest();

        RestRequest req = new RestRequest();

        RestResponse res = new RestResponse();

        req.requestURI = '/Lead/' + l.Id;

        req.httpMethod = 'GET';

        RestContext.request = req;

        RestContext.response= res;

        RestLeadConvert.doGet();

        Test.stopTest();

    }

}