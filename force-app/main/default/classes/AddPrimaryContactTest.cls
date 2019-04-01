@isTest
public class AddPrimaryContactTest {
	@isTest
    public static void test1(){
        List<Account> accountList = new List<Account>();
        for(Integer i=0;i<50;i++){
            account a = new account(name = String.valueOf(i),BillingState='NY');
            System.debug('account a = '+a);
            accountList.add(a);
        }
        for(Integer i=0;i<50;i++){
            account a = new account(name = String.valueOf(i),BillingState='CA');
            System.debug('account a = '+a);
            accountList.add(a);
        }
        insert accountList;
        Test.startTest();
        contact c =new contact(lastname = 'alex');
        AddPrimaryContact apc = new AddPrimaryContact(c,'CA');
        System.enqueueJob(apc);
        Test.stopTest();
        System.assertEquals(50, [select count() from contact]);
        System.debug([select count() from contact]);
    }
}