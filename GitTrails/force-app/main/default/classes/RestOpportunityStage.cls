@RestResource(urlMapping='/RestOpportunityStage/*')
global with sharing class RestOpportunityStage{
    global static RestRequest request;
    global static RestRequest getRequest;
    global static requestWrapper req;
    
    global class requestWrapper{
        global Account AccountID;
        global Opportunity OpportunityID;
    }
    
    global class ResponseWrapper{
        global string AccountID;
        global string Type;
        global string OpportunityID;
        global string StageName;
    }
    @HttpPost
    global static requestWrapper doPost() {
        requestWrapper rj=new requestWrapper();
       /* String response = 'fail';
        getRequest = RestContext.request;
        ResponseWrapper error=new ResponseWrapper();
        req=  (requestWrapper) System.JSON.deserialize(getRequest.requestBody.toString(), requestWrapper.class);
        System.debug('REQUESTed raw data=='+req);
        
            try{
                if (req.AccountID.Type=='Lost Customer'||req.AccountID.Type==null)
                {
                    req.AccountID.Type='Lost Customer';
                }
                else if(req.AccountID.Type=='Customer') 
                {
                     req.AccountID.Type='Customer';
                }
                update req.AccountID;
                
              //  Opportunity Opp = [Select Id,Stagename from Opportunity where Id =: req.OpportunityID.Id limit 1];
                if (req.OpportunityID.StageName=='Closed-Lost')
                {
                    req.OpportunityID.StageName='Closed-Lost';
                    
                }
                else if(req.OpportunityID.StageName=='Closed-Won') 
                {
                     req.OpportunityID.StageName='Closed-Won';
                }
                update req.OpportunityID;
                ResponseWrapper exc=new ResponseWrapper();
                exc.AccountID =req.AccountID.ID;
                exc.Type = req.AccountID.Type;
                exc.OpportunityID =  req.OpportunityID.ID;
                exc.StageName = req.OpportunityID.StageName;
                error=exc;
                system.debug(JSON.serialize(exc));
                response = Json.serialize(error);  
               
            }
            catch(exception ex){
                system.debug('***Exception**'+ex.getMessage());
             //   error.add(ex);
                response=Json.serialize(ex.getMessage());  
            }
        */
        
        return rj;
        
    }   
}