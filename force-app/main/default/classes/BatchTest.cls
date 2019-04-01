global class BatchTest implements DataBase.Batchable<sObject> {
    
    global DataBase.QueryLocator start(DataBase.BatchableContext BC) {
        System.debug('----in BatchTest start');
        System.debug('----BatchTest DataBase.BatchableContext'+BC);
        System.debug('----out BatchTest start');
        return DataBase.getQueryLocator('SELECT id FROM Account');
    }
    
    global void execute(DataBase.BatchableContext BC, List<Account> scope) {
        System.debug('----in BatchTest execute');
        System.debug('----BatchTest execute DataBase.BatchableContext:'+BC);
        System.debug('----BatchTest execute List<Account>'+scope);
        System.debug('----out BatchTest execute');
    }
    
    global void finish(DataBase.BatchableContext BC) {
        System.debug('----in BatchTest finish');
        System.debug('----in BatchTest DataBase.BatchableContext:'+BC);
        System.debug('----out BatchTest finish');
    }
}