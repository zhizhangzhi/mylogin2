public with sharing class goodsPicklistController {
    public Goods__c goods {get;set;}
    public String pickListFieldName {get;set;}  
    
    public goodsPicklistController() {
        Map<String, String> req = ApexPages.currentPage().getParameters();
        PageReference ref = ApexPages.currentPage();
        //设置当前的页面开发模式开启
        //ref.getParameters().put('core.apexpages.devmode.url', '1');
        String goodsId = req.get('id');
        this.pickListFieldName = req.get('picklistFieldName'); 
        String recordTypeId = req.get('recordTypeId');
        goods = new Goods__c();
        if(goodsId != null) {
            goods = [SELECT Status__c, RecordTypeId FROM Goods__c where Id=:goodsId limit 1];
        }
        if(goods.RecordTypeId == null) {
            goods.put('RecordTypeId', recordTypeId);
        }
    }
    
    public void showSelectedValue() {
        ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.INFO,goods.Status__c));
    }
}