@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        //String accountId = request.requestURI.substring(
          //request.requestURI.lastIndexOf('/')+1);
        String accountId= request.requestURI.substringBetween('Accounts/','/contacts');
        List<Account> a = [select id,name,(select id,name from contacts) from account where id = :accountId];
        List<Contact> c = [select id,name from contact where account.Id = :accountId];
        return a[0];
    }
}