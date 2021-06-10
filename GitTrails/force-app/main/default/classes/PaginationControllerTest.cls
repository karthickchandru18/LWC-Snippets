@isTest(SeeAllData=true)
public class PaginationControllerTest {
    
        public static testMethod void testSearchAccount() {
        PageReference pageRef = Page.Sample;
        Test.setCurrentPage(pageRef);

        // Instantiate a new controller with all parameters in the page
    
        AccountPaginationController  p=new AccountPaginationController ();
        
        p.getAccountList();
        p.Next();
        p.First();
        p.Last();
        p.Previous();
        p.Cancel();
        p.stCon.getHasPrevious();
        p.stCon.getHasNext();
        p.stCon.getPageNumber();
        p.searchFunction();
       
     }

}