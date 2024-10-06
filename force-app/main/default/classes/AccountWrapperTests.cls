@IsTest
private class AccountWrapperTests {
  @TestSetup
  static void loadTestData() {
    Account acct = new Account(Name = 'ACME');
    insert acct;
    List<Opportunity> opps = TestFactory.generateOppsForAccount(acct.id, 1000.00, 5);
    insert opps;

  }

  @IsTest
  static void testPositiveRoundedAveragePrice() {
    Account acct = [SELECT Id FROM Account LIMIT 1];
    AccountWrapper acctWrapper = new AccountWrapper(acct);
    Test.startTest();
    Assert.areEqual(
      acctWrapper.getRoundedAvgPriceOfOpps(),
      1000.00,
      'Expected to get 1000.00');
    Test.stopTest();
  }

  @IsTest
  static void testIsHighPriority(){
    Account acct = [SELECT Id FROM Account LIMIT 1];
    AccountWrapper acctWrapper = new AccountWrapper(acct);
    Boolean p = acctWrapper.isHighPriority();
    Test.startTest();
    Assert.areEqual(acctWrapper.isHighPriority(), false,'Expected false');
    Test.stopTest();
  }
}
