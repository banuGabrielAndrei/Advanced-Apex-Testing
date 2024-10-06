@isTest
private class MyDataGenerationTests {

    @TestSetup
    static void makeData(){
        List<SObject> testRecords = Test.loadData(Account.SObjectType, 'Mock_Accounts');
    }

    @isTest
    static void testLoadOtherAccountsFromStaticResource() {
        List<Account> accnts = [SELECT ID FROM Account];
        Assert.isTrue(accnts.size() == 15, 'Expected 15 accounts');
    }
}