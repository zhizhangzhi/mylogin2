@isTest
public class TestVerifyDate {
    @isTest static void testCheckDates(){
        Date d2 = System.today();
        Date d1 = d2.addDays(10);
        Date dt = VerifyDate.CheckDates(d1,d2);
        Date testDt = Date.newInstance(2018, 11, 30);
        System.assertEquals(testDt, dt);
    }
    @isTest static void testDateWithin30Days(){
        Date d1 = System.today();
        Date d2 = d1.addDays(10);
        Date dt = VerifyDate.CheckDates(d1,d2);
        System.assertEquals(d2, dt);
    }
}