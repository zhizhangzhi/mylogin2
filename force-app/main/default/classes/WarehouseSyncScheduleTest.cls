@isTest
public class WarehouseSyncScheduleTest {
    public static String CRON_EXP = '0 0 1 * * ? 2020';
    static testmethod void testScheduledJob() {
        
    	Test.startTest();
        Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());
    	System.schedule('Test', CRON_EXP, new WarehouseSyncSchedule());
    	Test.stopTest();
    }
	
}