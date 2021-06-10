public class ParentChildSample {
    public static void InsertParentChild() {
        Date dt = Date.today();
        dt = dt.addDays(7);
        List<Opportunity> opp = new List<Opportunity>();
        List<Account> acc = new List<Account>();

        for(Integer i = 0; i < 3; i++){

            Opportunity newOpportunity = new Opportunity(Name='OpportunityWithAccountInsert ' +i,StageName='Prospecting',CloseDate=dt);        
            Account accountReference = new Account(SLASerialNumber__c='SAP111111'+i); 
            newOpportunity.Account = accountReference;
            Account parentAccount = new Account(Name='Hallie '+i);
            system.debug('DDDDDDDDDDDDDDDDDD'+newOpportunity.Account);
            opp.add(newOpportunity);
            acc.add(parentAccount);


        }


SObject[] sobjList = new List<SObject>();
sobjList.addAll(acc);
sobjList.addAll(opp);
Database.SaveResult[] results = Database.insert(sobjList);

      


        for (Integer i = 0; i < results.size(); i++) {
            if (results[i].isSuccess()) {
                System.debug('Successfully created ID: '+ results[i].getId());
            } else {
                System.debug('Error: could not create sobject '+ 'for array element ' + i + '.');
                System.debug(' The error reported was: '+ results[i].getErrors()[0].getMessage() + '\n');
            }
        }
    }
}