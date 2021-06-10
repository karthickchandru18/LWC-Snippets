@RestResource(urlMapping='/RestLeadConvert/*')
global with sharing class RestLeadConvert{
    global static RestRequest request;
    global static RestRequest getRequest;
    global static  Lead req;
    global id ID;
    
   
  
    @HttpPost
    global static lead doGet() {
        String response = 'fail';
        Lead leadIds;
        getRequest = RestContext.request;
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
                    
                leadIds = [Select Id,ConvertedAccountId,ConvertedContactId,ConvertedOpportunityId from Lead where Id =: leadId1 limit 1];
                
               
                
                
            }
            catch(exception ex){
                system.debug('***NOT CONVERTED**');  
            }
        
        return leadIds;
        
    }   
}