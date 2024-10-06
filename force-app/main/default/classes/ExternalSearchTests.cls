@isTest
private class ExternalSearchTests {

   @IsTest
  static void testPositiveMocking() {
    // GIVEN
    HTTPMockFactory mock = new HTTPMockFactory(
      200,
      'OK',
      'I found it!',
      new Map<String, String>()
    );
    Test.setMock(HttpCalloutMock.class, mock);
    // WHEN
    Test.startTest();
      String result = ExternalSearch.googleIt('epic search');
    Test.stopTest();
    // THEN
    Assert.areEqual('I found it!', result, 'Expected to receive mock response');
  }

  @isTest
  static void testNegativeMocking() {
    // GIVEN
    HTTPMockFactory mock = new HTTPMockFactory(500, 
                'OK', 'I couldn\'t find it :(', new Map<String, String>());

    Test.setMock(HttpCalloutMock.class, mock);
    // WHEN
    try {
      Test.startTest();
        String result = ExternalSearch.googleIt('epic search');
      Test.stopTest();
    } catch (Exception e) {
      // THEN
      Assert.areEqual('Google search did not work.', e.getMessage(),
        'Expected exception message to be Google search did not work.');
    }
  }
}