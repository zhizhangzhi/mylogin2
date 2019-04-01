public without sharing class  comparedGoods implements Comparable{
    private Goods__c goods{get;set;}
    
    private static final String GOODS_STATUS = '直线经理审批';
    
    public comparedGoods(Goods__c obj) {
        goods = obj;
    }
    
    public Integer compareTo(Object objectToCompareTo) {
            Goods__c compareGoods = (Goods__c)objectToCompareTo;
            Integer comparedResult = 0;
            if(compareGoods.Status__c == GOODS_STATUS) {
                if(goods.goodsPrice__c  > compareGoods.goodsPrice__c) {
                    comparedResult = -1;
                } else if(goods.goodsPrice__c  < compareGoods.goodsPrice__c ) {
                    comparedResult = 1;
                }
            } 
            return comparedResult;
    }
}