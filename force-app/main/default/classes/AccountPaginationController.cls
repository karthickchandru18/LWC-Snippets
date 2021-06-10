public class AccountPaginationController {
public  List<Account> AccountData{get;set;}
public String searchKey{get;set;}
public ApexPages.StandardSetController stCon{
 get{
   if(stCon == null){ 
     stCon = new ApexPages.StandardSetController(Database.getQueryLocator([Select id,Name,Phone,Createddate from Account order by Name limit 1000]));
     stCon.setPageSize(5);        
   }
   return stCon;
 }
 set;
}

 public List<Account> getAccountList(){
     if (searchKey==Null ||searchKey=='')
     {
        return (List<Account>)stCon.getRecords();
     }
     else 
         return AccountData;
 }

public Boolean hasNext {
   get {
            return stCon.getHasNext();
     }
  set;
}

public Boolean hasPrevious {
    get {
       return stCon.getHasPrevious();
}
  set;
}

public Integer pageNumber {
        get {
            return stCon.getPageNumber();
        }
        set;
 }

 public void first() {
        stCon.first();
    }
   
    public void last() {
        stCon.last();
    }

    public void previous() {
        stCon.previous();
    }
    
    public void next() {
        stCon.next();
    }
  
    public void cancel() {
        stCon.cancel();
    }

 public AccountPaginationController() {
        AccountData = new List<Account>();
        AccountData = [SELECT Id,Name,Phone,Createddate FROM Account];
    }
    
     public pageReference searchFunction(){
       // AccountData.clear();
        System.debug('Search Key==='+searchKey);
        if(searchKey!= '' && searchKey != null){
            AccountData = [SELECT Id,Name,Phone,Createddate FROM Account  WHERE  Name =:'ab'AND Phone Like: '%'+searchKey+'%' ];
        }
        else{
             AccountData = [SELECT Id,Name,Phone,Createddate FROM Account WHERE  Name =:'ab' ];
        }
      System.debug('Search Key==='+AccountData);
        return null;
    }
}