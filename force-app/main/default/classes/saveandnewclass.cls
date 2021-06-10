public with sharing class saveandnewclass {
    
    APEX_Invoice__c wpc;  
    ApexPages.StandardController sController;  
    
    public saveandnewclass(ApexPages.StandardController controller) 
    {
        sController = controller;
        wpc = (APEX_Invoice__c)controller.getRecord();
    }
    
    public PageReference saveAndNew() {
        
        // Custom Save code here...
        
        sController.save();
        PageReference pageRef = new PageReference('/apex/AccountGraphicsCustomerIntelligence');
        pageRef.setredirect(true);
        return pageRef ;
    }
    
    
}