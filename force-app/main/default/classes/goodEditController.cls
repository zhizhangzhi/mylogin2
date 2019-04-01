public without sharing class goodEditController {
    public goodEditController(){
        init();
    }
    public void init(){
        Map<String,String> parameters=ApexPages.currentPage().getParameters();
        goodsId = parameters.get('goodsId');
        loadGoodInfo();
    }
    public String goodsId {get;set;}
    public String goodNameCrypto{get;set;}
    public String goodnameShort{get;set;}
    public Goods__c goods = new Goods__c();
    public Goods__c getgoods(){
        return goods;
    }
    public void setgoods(Goods__c goods){
        this.goods = goods;
    }
    public void loadGoodInfo(){
        String query = 'select id,name from Goods__c where id = :goodsId';
        goods = Database.query(query);
        String goodname = goods.name;
        String prefix = '';
        if(goodname != null && goodname.length() > 4) {
        	for(Integer i=0;i<goodname.length()-4;i++) {
        		prefix += '*';
        	}
        }
        if(goodname != null && goodname.length() > 4) {
    		goodname = prefix + goodname.right(4);
        } else if(goodname != null){
        	goodname = prefix + goodname;
        }
        goodnameShort = goodname;
        if(goods.name != null){
            Blob hashGoodName = Crypto.generateDigest('SHA1',Blob.valueOf(goods.name)); 
			goodNameCrypto = EncodingUtil.convertToHex(hashGoodName);
        }
    }

}