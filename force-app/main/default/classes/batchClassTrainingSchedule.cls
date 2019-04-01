global class batchClassTrainingSchedule implements Schedulable{
    global void execute(SchedulableContext ctx) {
        batchClassTraining batch = new batchClassTraining();
        Database.executeBatch(batch,2);
        CronTrigger ct =
		[SELECT TimesTriggered, NextFireTime
		FROM CronTrigger WHERE Id = :ctx.getTriggerId()];
        System.debug('The scheduled batch Apex job has processed ' + ct.TimesTriggered + ' times,the next scheduled run time is:' + ct.NextFireTime );
    }
}