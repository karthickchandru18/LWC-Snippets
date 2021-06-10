@isTest
private class SalesDo_Test{
  @testSetup
  static void setupTestData(){
    test.startTest();
    Account account_Obj = new Account(Name = 'Name224', Top_Account__c = false);
    Insert account_Obj; 
    test.stopTest();
  }
  static testMethod void test_post_UseCase1(){
    List<Account> account_Obj  =  [SELECT Name,Top_Account__c from Account];
    System.assertEquals(true,account_Obj.size()>0);
    SalesDo obj01 = new SalesDo();
    SalesDo.post();
  }
}