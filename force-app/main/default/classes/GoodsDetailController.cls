public without sharing class GoodsDetailController {
    public GoodsDetailController(){
        init();
    }
    public GoodsDetailController(ApexPages.StandardController controller){
        init();
    }
    public void init(){	
        String goodsId = ApexPages.currentPage().getParameters().get('goodsId');
        if(goodsId!=null){
            String queryGoods = 'select id,name,goodsPrice__c,Maxprice__c,item__r.name,Status__c from Goods__c where id = :goodsId';
            String queryGoodsVendor = 'select id,name,Vendor_Name__c,Goods__c from GoodVendor__c where Goods__c = :goodsId';
            List<Goods__c> goodsList = Database.query(queryGoods);
            if(goodsList !=null && goodsList.size()>0){
                goods = goodsList.get(0);
            }
            List<GoodVendor__c>  goodsVendorList = Database.query(queryGoodsVendor);
            if(goodsVendorList !=null && goodsVendorList.size()>0){
                goodsVendor = goodsVendorList.get(0);
            }
        }
        
    }
    public Goods__c goods{
        get{
            if(goods == null){
                goods = new Goods__c();
            }
            return goods;
            
        }
        set;
    }
    public GoodVendor__c goodsVendor{
        get{
            if(goodsVendor == null){
                goodsVendor = new GoodVendor__c();
            }
            return goodsVendor;
            
        }
        set;
    }
    public PageReference Cancel(){
        return redirectToGoodsList();
    }
    public PageReference redirectToGoods(){
        return Page.detailGoods;
    }
    public PageReference redirectToVendor(){
        return Page.detailVendor;
    }
    public PageReference redirectToTotal(){
        return Page.detailTotal;
    }
    public PageReference SaveFinally(){
        Savepoint sp = Database.setSavepoint();
        try{
            upsert goods;
            //goodsVendor.Goods__c = goods.id;
            upsert goodsVendor;
        }catch(DMLException e){
            Database.rollback(sp);
            ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.ERROR,e.getMessage()));
            return null;
	
        }
        return redirectToGoodsList();
    }
    public PageReference redirectToGoodsList(){
        PageReference ref = new PageReference('/apex/GoodsListPage');
        ref.setRedirect(true);
        return ref;
        
    }

}