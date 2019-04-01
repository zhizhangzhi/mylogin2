global class batchClassTraining implements Database.Batchable<sObject>{
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('select id,name,description,Phone from account where name = \'Testzz\'' );
    }
    global void execute(Database.BatchableContext bc,List<Account> scope){
        List<Account> accsToUpdate = new List<Account>();
        for(Account acc : scope){
            acc.description = '123';
            accsToUpdate.add(acc);
        }
        update accsToUpdate;
    }
    global void finish(Database.BatchableContext bc){
        AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,
		TotalJobItems, CreatedBy.Email
		FROM AsyncApexJob WHERE Id = :BC.getJobId()];
        System.debug('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.');
    }
}