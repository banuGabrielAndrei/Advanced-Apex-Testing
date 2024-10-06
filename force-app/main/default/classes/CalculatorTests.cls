@isTest
private class CalculatorTests {

    @isTest
    static void testDivideByZero() {
        try {
            Test.startTest();
            Calculator.divide(10, 0);
            Test.stopTest();
            Assert.fail('Expected divide by zero exception');
        } catch (Calculator.CalculatorException e) {
            Assert.isTrue(e.getMessage().equalsIgnoreCase('You still can\'t divide by zero'));
        }
    }

    @isTest
    static void testNegativeDivision() {
        Decimal returnValue = Calculator.divide(-10, 2);
        try {
            Test.startTest();
            Calculator.divide(-10, 2);
            Test.stopTest();
            Assert.fail('Expected divide by negative number exception');
        } catch (Calculator.CalculatorException e) {
            Assert.isTrue(e.getMessage().equalsIgnoreCase('Division returned a negative value.' + returnValue));
        }
    } 
}