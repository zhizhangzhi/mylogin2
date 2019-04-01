public without sharing class GoodsHelper {
    public static final String BASE_GOODS_QUERY = 'select id,' + 
        										  'name,' + 
        										  'goodsPrice__c,' + 
        										  'Maxprice__c,' + 
        										  'Status__c,' + 
        										  'item__r.name ' + 
        										  'FROM Goods__c ' + 
        										  'where id!= null';
    public static final String BASE_GOODS_COUNT_QUERY = 'select count(id) from Goods__c where id!= null';
	
}