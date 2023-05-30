@isTest
private class SumTest {
    @isTest
    static void testDemo(){
        Integer a = 10;
        Integer b= 5;
        Sum obj = new Sum();
        Integer result = obj.doSum(a, b);
        System.assertEquals(15, result);
    }
    @isTest
    static void testDoDivision(){
        Decimal a = 10.5;
        Decimal b= 5;
        Sum obj = new Sum();
        Decimal div = obj.doDivision(a, b);
        System.assertEquals(2.1, div);
    }
}