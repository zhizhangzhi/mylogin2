@isTest
private class TestRestrictContactByName {
    @isTest static void test1(){
        Contact c = new Contact();
        c.LastName = 'INVALIDNAME';
        Test.startTest();
        try{
            insert c;
        }catch(exception e){
            system.debug('error message:'+ e);
        }
        
        Test.stopTest();
    }
    @isTest static void test2(){
        Contact c = new Contact();
        c.LastName = 'Test';
        Test.startTest();
        insert c;
        Test.stopTest();
    }
}