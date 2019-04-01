@isTest
private class WarehouseCalloutServiceTest {
    // implement your mock callout test here
    @isTest static  void testWarehouseCalloutService(){
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());
    	WarehouseCalloutService.runWarehouseEquipmentSync();
        Test.stopTest();
        //System.debug([select id,name,Cost__c,Replacement_Part__c from Product2  where name='Generator 1000 kW' ]);
    }
    
}