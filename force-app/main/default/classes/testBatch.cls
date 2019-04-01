global class testBatch implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator('select id,name from user');
    }
    global void execute(Database.BatchableContext BC, List<sObject> scope){
        if(System.isScheduled()){
            system.debug('[executeUnSync from batch]');
        }else{
            system.debug('[executeSync from batch]');
        }
    }
    global void finish(Database.BatchableContext info){
        
    }
        
}