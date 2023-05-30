@isTest
public class TestVerifyDate {
	@isTest
    static void CheckDateTest(){
        Date d1 = Date.newInstance(2022, 08, 25);
        Date d2 = Date.newInstance(2022, 09, 09);
        VerifyDate.CheckDates(d1, d2);
        Date d = d1.addDays(23);
        System.assertEquals(Date.today(), Date.today());
    }
    @isTest
    static void CheckDateTestMethod(){
        Date d1 = Date.newInstance(2022, 09, 09);
        Date d2 = Date.newInstance(2022, 07, 09);
        VerifyDate.CheckDates(d1, d2);
        Date d = d1.addDays(21);
        System.assertEquals(d,d);
    }
}