public class AccountProcessor {
	@future
    public static void countContacts(List<Id> accountIdLists){
        Map<Id,Integer> countContactMap = new Map<Id,Integer>();
        List<Account> accountList = new List<Account>([select id,(select id from contacts) from account]);
        for(Account a : accountList){
            countContactMap.put(a.Id,a.contacts.size());
        }
        List<Account> updateAccountList = new List<Account>();
        for(Id accountId : accountIdLists){
            if(countContactMap.containsKey(accountId)){
                account acc = new account();
                acc.Id = accountId;
                acc.Number_of_Contacts__c = countContactMap.get(accountId);
                updateAccountList.add(acc);
            }
        }
        upsert updateAccountList;
    }
}