global class leadConversion {
    
    String leadrecId;
    public leadConversion(ApexPages.StandardController controller) {
        leadrecId = controller.getRecord().Id;
        System.debug('Current Lead ID=='+leadrecId);
    }
    
    public void updateflaginLead(){
        string passedParam1 = Apexpages.currentPage().getParameters().get('id');
        System.debug('Current Lead ID=='+passedParam1);
        Lead leadRec=new Lead();
        leadRec.id=passedParam1;
        leadRec.update_flag__c = true;
        update leadRec;
     
    }
    
    @future
    global static void opportunitycreation(Id recordID)
    {
        string uid = userinfo.getUserId();
        String Ldid ,Emailaddr ,cntname;
        Id AccID ,contId ,cntemailid ,leadId;
        Database.LeadConvert lc = new Database.LeadConvert();
        Database.LeadConvertResult lcr;
        Lead updLead = new Lead();
        
        List<Lead> rec = [Select Id,OwnerId,Email from Lead where Id =: recordID];
        
        for(Lead l:rec){
            Emailaddr = l.Email;
            leadId = l.Id;
        }
        System.debug('Contact Email address is '+Emailaddr);
        List<Contact> cntemaillist = new List<Contact>([Select Id,Name from Contact where email=:Emailaddr order by lastmodifieddate desc limit 1]);
        for(Contact c:cntemaillist){
            cntemailid = c.Id;
            cntname = c.Name;
        }
        
        if(cntemailid!=NULL){
            
            updLead.Id = leadId;
            
            update updLead;
        }
        
        system.debug('Contact Email Id is '+cntemailid);
        for(Lead l:rec){
            
            if(String.valueof(l.ownerId).substring(0,3) == '00G'){
                l.OwnerId = uid;
                
                //l.Previous_Customer_Name__c = cntemailid;
                update l;
                System.debug('updated Lead is '+l);
            }
        }        
        System.debug('Print LDID for this Lead'+ldid);
        
        
        
        List<Contact> cntlist = new List<Contact>([Select AccountId from Contact Where Id =: ContId]);
        for(Contact ct:cntList){
            accID = ct.AccountId;
        }
        
        System.debug('Contact record Id '+ContId);
        System.debug('Account record Id'+accId);
        
        if(lc!=NULL){
            System.debug('Print Lc '+lc);
            lcr = Database.convertLead(lc);
            System.assert(lcr.isSuccess());
        }
        
        System.debug('Converted contact is '+lcr.getContactId());
  }      
}