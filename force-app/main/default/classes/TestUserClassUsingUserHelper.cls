@isTest
private class TestUserClassUsingUserHelper {
    static testMethod void myUnitTest(){
        User testUser = TestUserHelper.createUserByPermission('');
        System.RunAs(testUser){
            Test.startTest();
            Test.stopTest();
        }
        
    }

}