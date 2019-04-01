@isTest
public class testfor {
    static testMethod void testUpsert001() {
        Test.startTest();
        Integer i =6;
        bb b = new bb();
        try{
            System.debug('ggg');
           b.cc(i); 
        }catch(Exception e){
            System.debug('fff');
            System.debug(e.getMessage());
        }
        Test.stopTest();
        
        
    }
    static testMethod void testUpsert002() {
        Account acc = new Account( name='Acme', billingCity='Edinburgh');
        insert acc;
        Test.startTest();
        try{
          System.debug('ggg');
          //batch bat = new batch();
          //Database.executebatch(bat, 1);
          System.schedule('TestScheduledApex', '0 0 11 * * ?', new batchschedule());
            System.debug('xxx');
            
        }catch(Exception e){
            System.debug('fff');
            System.debug(e.getMessage());
        }
        Test.stopTest();
        
        
        
    }
        
	
}