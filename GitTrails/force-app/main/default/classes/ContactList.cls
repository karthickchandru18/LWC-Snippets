public class ContactList {
@AuraEnabled
    Public Static List<contact> getcontact(string accountid)
    {
        List<contact> conlist=new List<contact>();
        conlist=[select Name,Phone,firstname,Lastname,email,id from contact where accountid=:accountid];
        return conlist;
    }
    @AuraEnabled
    Public Static List<sObject> getcontactbyname(string name)
    {
       
        String likeParam = '%' +name+'%';
        String Query = '';
        if(name != null){
           Query  = 'select Name,Phone,firstname,Lastname,email,id from contact  Where Name Like :likeParam LIMIT 50 ';
        }else{
           Query  = 'select Name,Phone,firstname,Lastname,email,id from contact LIMIT 50 '; 
        }
        
        List<SObject> sObjectList = Database.query(Query);
        return sObjectList;
    }
}