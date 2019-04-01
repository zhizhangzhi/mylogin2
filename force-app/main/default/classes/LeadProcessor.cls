global class LeadProcessor implements Database.Batchable<sObject>,Database.Stateful {
	global Integer count = 0;
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select Id,LeadSource from lead');
    }
    global void execute(Database.BatchableContext bc, List<Lead> leadList){
        List<Lead> leadUpdate = new List<Lead>();
        for(Lead l : leadList){
           l.LeadSource = 'Dreamforce';
           leadUpdate.add(l);
           count+=1;
        }
        update leadUpdate;
    }
    global void finish(Database.BatchableContext bc){
        System.debug('count='+count);
    }
}