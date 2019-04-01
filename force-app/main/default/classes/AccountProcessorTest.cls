@isTest
public class AccountProcessorTest {
	@isTest
    public static void test1(){
        account acc = new account();
        acc.name='test1';
        insert acc;
        
        contact con1 = new contact();
        con1.lastname = 'test2';
        con1.AccountId = acc.Id;
        insert con1;
        
        contact con2 = new contact();
        con2.lastname = 'test2';
        con2.AccountId = acc.Id;
        insert con2;
        
        List<Id> accIdList = new List<Id>();
        accIdList.add(acc.Id);
        Test.startTest();
        AccountProcessor.countContacts(accIdList);
        Test.stopTest();
        List<account> acclist = new List<account>([select Number_of_Contacts__c from account where id = :acc.Id]);
        System.assertEquals(2,acclist[0].Number_of_Contacts__c);
        
    }
}