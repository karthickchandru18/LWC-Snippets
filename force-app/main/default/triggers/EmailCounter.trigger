trigger EmailCounter on Contact (before insert,before update) {
    for(Contact c:trigger.new){
        list<Contact> consize=new list<Contact>();
        consize=[select id from contact where email=:c.email];
        //c.numofcons__c=consize.size()+1;
    }
}