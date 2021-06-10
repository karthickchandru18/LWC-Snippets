trigger ContentVersionTrigger on ContentVersion (after insert) {
    
    /*
    public String csvAsString;
    public String[] csvFileLines;
    List<Account> testData=new List<Account>();
    List<contact> testData1=new List<contact>();
    
    for(ContentVersion conV:Trigger.new){
        if(conV.Title.contains('unsubscribe')){
            csvAsString = conV.VersionData.toString();
            csvFileLines=csvAsString.split('\n');
        }
    }
    for(Integer i=1; i < csvFileLines.size(); i++){
        Account acc=new Account();
        contact con=new contact();
        String[] csvRecordData = csvFileLines[i].split(',');
        acc.Name=csvRecordData[0];
        acc.SLASerialNumber__c	 = csvRecordData[2];
        testData.add(acc);
        con.lastname=csvRecordData[1];
        con.Account	 =  new Account(SLASerialNumber__c =csvRecordData[2]);
        testData1.add(con);
        
    }
    if(testData.size()>0&&testData1.size()>0){
    //SObject[] sobjList = new List<SObject>();
    List<SObject> sobjList=new List<SObject>();
    sobjList.addAll(testData);
    sobjList.addAll(testData1);
    insert sobjList;
    //Database.SaveResult[] results = Database.insert(sobjList);
    }*/
}