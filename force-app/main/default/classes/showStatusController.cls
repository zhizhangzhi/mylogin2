public without sharing class showStatusController {
    public showStatusController(ApexPages.StandardController controller){
        initData();
    }
    
    public List<Goods__c> goodsList{get;set;}
    public void initData(){
        goodsList = [select id,Name,goodsPrice__c,Status__c from Goods__c limit 5];
    }
    

}