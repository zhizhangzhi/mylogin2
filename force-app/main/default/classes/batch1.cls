global class batch1 implements Database.Batchable<sObject>,Database.Stateful{
     global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Id, Name FROM Account LIMIT 1]);
        
    }
     global void execute(Database.BatchableContext bc,List<Account> scope){
        Integer i =6;
        bb b = new bb();
        b.cc(i);

    }
    global void finish(Database.BatchableContext bc){
        
    }

}