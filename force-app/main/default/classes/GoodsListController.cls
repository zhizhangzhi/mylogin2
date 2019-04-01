public without sharing class GoodsListController extends myPagination{
    public GoodsListController(){
        super();
        init();
    }
    public GoodsListController(ApexPages.StandardSetController controller){
        super(controller);
        init();
    }
    public GoodsListController(ApexPages.StandardController controller){
        super(controller);
        init();
    }
    public List<Goods__c> recordList = new List<Goods__c>();
    public String goodsId{ get; set;}
    public String keyword_goodsName{ get; set;}
    public List<Goods__c> goodsVo{
        get{
            if(recordList!=null){
                return recordList;
            }else{
                return null;
            }
        }
        set;
    } 
    public void init(){
        queryGoods();
        
    }
    public void queryGoods(){
        initGoods();
        recordList=getQueryResult();
    }
    public void initGoods(){
        System.debug('ffffffff' + keyword_goodsName);
        String condition = '';
        if(!String.isEmpty(keyword_goodsName)){
            condition+=' AND Name LIKE \'%'+keyword_goodsName+'%\' ';
        }
        String countStr = GoodsHelper.BASE_GOODS_COUNT_QUERY;
        String queryStr = GoodsHelper.BASE_GOODS_QUERY;
        setQueryCondition(countStr,queryStr,condition,null,null);
    }
    public void queryGoodsByCondition(){
        queryGoods();
    }
    public PageReference redirectToGoods(){
        return Page.detailGoods;
    }
    public PageReference showGoodEdit(){
        return redirectTo('/apex/Edit_Good?isEditView=true&goodsId='+goodsId);
    }
    private PageReference redirectTo(String page){
        PageReference pageRef = new PageReference(page);
        pageRef.setRedirect(true);
        return pageRef ;
    }
    
    public override void first() {
       super.first();
       recordList=getQueryResult();    
    } 
    
    public override void last() {
       super.last();
       recordList=getQueryResult();            
    } 
   
    public override void previous() {
       super.previous();
       recordList=getQueryResult();      
    } 
   
    public override void next() {  
       super.next();
       recordList=getQueryResult();      
    }

}