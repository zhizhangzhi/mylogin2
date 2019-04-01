global class GoodsBatch implements Database.Batchable<sObject>,Database.Stateful{
    Integer queryCount = 0;
    String query;
    String myEmailAddress = 'ilikeeatsleep@163.com';
    global GoodsBatch(){
        query = 'select id,goodsPrice__c from Goods__c';
    }
    global Database.QueryLocator start(Database.BatchableContext bc){
        System.debug(Database.getQueryLocator(query));
        return Database.getQueryLocator(query);
        
    }
    
    global void execute(Database.BatchableContext bc,List<sObject> batch){
        List<Goods__c> good = new List<Goods__c>();
        for(sObject sobj : batch){
            Goods__c goods = (Goods__c)sobj;
            goods.goodsPrice__c +=1;
            
            
            queryCount+=1;
            good.add(goods);

        }
        upsert good;
    }
    global void finish(Database.BatchableContext bc){
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setToAddresses(new String[]{myEmailAddress});
        email.setSubject('show count');
        email.setHtmlBody('query Count' + queryCount);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
    }

}