global class Dev541_batchapex implements Database.Batchable<sObject>, Database.Stateful{

    global final String query;
    global List<account> alist;
  
    global Dev541_batchapex(String q){
        query=q;
    }

    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
   
    global void execute(Database.BatchableContext BC, List<sObject> scope){        
        alist = new List<Account>();
        for(sObject so : scope)
        {
            Account acc = (Account)so;
            if (acc.AnnualRevenue != null){
                acc.AnnualRevenue *= 1.2;
            }
            alist.add(acc);
        }
        update alist;
        
    }

    global void finish(Database.BatchableContext BC)
    {
    }
}