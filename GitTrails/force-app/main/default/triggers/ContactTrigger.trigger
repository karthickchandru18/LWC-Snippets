trigger ContactTrigger on Contact (after insert) {
    /*switch on Trigger.operationType {
        when AFTER_INSERT {            
            Set<Id> accountIds = new Set<Id>();
            for (Contact con : trigger.new) {
                if (String.isNotBlank(con.AccountId)) {
                    accountIds.add(con.AccountId);
                }
            }
            List<AggregateResult> results = [SELECT AccountId, COUNT(id) totalContacts FROM Contact
                                             WHERE AccountId IN :accountIds GROUP BY AccountId];
            
            for (AggregateResult result : results) {
                String accId = String.valueOf(result.get('AccountId'));
                Integer totalContacts = Integer.valueOf(result.get('totalContacts'));
               // Account acc = new Account(Id = accId, Active_Contacts__c = totalContacts);
                //accountsToUpdate.add(acc);
            }
            //update accountsToUpdate;
        }
        
    }*/
}