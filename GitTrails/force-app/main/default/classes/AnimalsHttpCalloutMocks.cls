@isTest
global class AnimalsHttpCalloutMocks implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('[{"Message": "Number of pincode(s) found:15","Status": "Success","PostOffice": [{"Name":"Bodhanga","Description": null,"BranchType": "Branch Post Office","DeliveryStatus": "Delivery","Circle": "Odisha","District": "Cuttack","Division": "Cuttack North","Region": "Bhubaneswar HQ","Block": "Salipur","State": "Odisha","Country": "India","Pincode": "754207"}]}]');
        response.setStatusCode(200);
        return response; 
    }
}