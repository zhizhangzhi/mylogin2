@isTest
public class AccountManagerTest {
    @isTest static void testGetAccount(){
        Id recordId = createTestRecord();
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://ap7.salesforce.com/services/apexrest/Accounts/'
            + recordId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account accountTest = AccountManager.getAccount();
        System.debug(accountTest);
        //System.debug([select id,accountId,name from contact where accountId =:recordId ]);
        //System.debug([select id,name,(select id,name from contacts) from account where id = :recordId]);
        System.assertEquals('salesforce Exam', accountTest.name);
        
        
    }
    static Id createTestRecord(){
            Account accTest = new Account(Name='salesforce Exam');
            insert accTest;
            Contact contactTest = new Contact(accountId = accTest.Id,FirstName='FirstName',LastName='LastName');
            insert contactTest;
            return accTest.Id;
        }
}