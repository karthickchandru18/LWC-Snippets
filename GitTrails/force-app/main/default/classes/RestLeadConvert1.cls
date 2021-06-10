@RestResource(urlMapping='/RestLeadConvert1/*')
global with sharing class RestLeadConvert1{
    global static RestRequest request;
    global static RestRequest getRequest;
    global static  Lead req;
    global static  RestResponse res = RestContext.response;
    global Lead LeadID;
    
    global class ResponseWrapper{
        global string AccountID;
        global string ContactID;
        global string OpportunityID;
    }
    @HttpPost
    global static string doGet() {
        String response = 'fail';
        getRequest = RestContext.request;
        ResponseWrapper error=new ResponseWrapper();
        req=  (Lead) System.JSON.deserialize(getRequest.requestBody.toString(), Lead.class);
        System.debug('REQUESTed raw data=='+req);
        
            try{
                Lead leadI = [Select Id from Lead where Id =: req.Id limit 1]; 
                string leadId1= leadI.id;
                Database.LeadConvert lc = new Database.LeadConvert();
                lc.setLeadId(leadId1);
                LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
                lc.setConvertedStatus(convertStatus.MasterLabel);           
                Database.LeadConvertResult lcr ;
                lcr = Database.convertLead(lc);
                system.debug('*****lcr.isSuccess()'+lcr.isSuccess()); 
                    
                Lead leadIds = [Select Id,ConvertedAccountId,ConvertedContactId,ConvertedOpportunityId from Lead where Id =: leadId1 limit 1];
                
               
                
                ResponseWrapper exc=new ResponseWrapper();
                exc.AccountID =leadIds.ConvertedAccountId;
                exc.ContactID = leadIds.ConvertedContactId;
                exc.OpportunityID = leadIds.ConvertedOpportunityId;
                error=exc;
                system.debug(JSON.serialize(exc));
                response = Json.serialize(error);  
/* 				System.JSONGenerator gen = JSON.createGenerator(true);
        		gen.writeStartObject();
        		gen.writeStringField('AccountID', leadIds.ConvertedAccountId);
        		gen.writeStringField('ContactID', leadIds.ConvertedContactId);
        		gen.writeStringField('OpportunityID', leadIds.ConvertedOpportunityId);
        		gen.writeEndObject();
	    
    
   
     			response = gen.getAsString();
                 */
               
    			System.debug('response-' + response);


            }
            catch(exception ex){
                system.debug('***NOT CONVERTED**'+ex.getMessage());  
              response=Json.serialize(ex.getMessage());
            }
        
          return response;


    }   
}