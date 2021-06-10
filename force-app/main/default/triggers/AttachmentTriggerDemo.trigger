trigger AttachmentTriggerDemo on Attachment (after insert) {
   public Blob csvFileBody{get;set;}
    public String csvAsString{get;set;}
    public String[] csvFileLines{get;set;}
    public List<account> accountlist{get;set;}
    for(Attachment atte : trigger.New){
   Attachment att = [Select body From Attachment where id=:atte.id limit 1]; 
        csvAsString=att.body.toString();    
        csvFileLines = csvAsString.split('\n');       
  system.debug('csvFileLines====='+csvFileLines);

for(Integer i=1;i<csvFileLines.size();i++)        {
  account accObj = new account();           
  String[] csvRecordData = csvFileLines[i].split(',');
           
                accObj.name = csvRecordData[0] ;
                accObj.accountnumber = csvRecordData[1];
                accObj.Type = csvRecordData[2];
                accObj.AccountSource = csvRecordData[3];
                accObj.Industry = csvRecordData[4];
    system.debug('accObj====='+accObj);
                accountlist.add(accObj);
            }
            // if all correct then insert Account into Org
            if(accountlist.size()>0)
                insert accountlist;
        }
    }