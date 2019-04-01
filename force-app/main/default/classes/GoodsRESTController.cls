@RestResource(UrlMapping='/Goods/*')
global class GoodsRESTController {
    global static final Integer PAGE_SIZE = 20;
    @HttpGet
        global static List<Goods__c> getGoodsByIdOrGoodsList() {
        RestRequest request = RestContext.request;
        // grab the goodsId from the end of the URL
        String currentPage = request.params.get('currentPage') != null ? request.params.get('currentPage') : '0';
        Integer offsetNumber = Integer.valueOf(currentPage) * PAGE_SIZE;
        String goodsId = request.params.get('goodsId');
        //String goodsId = request.requestURI.substring(
            //request.requestURI.lastIndexOf('/')+1);
        String fetchSql;
        if(goodsId != null) {
            fetchSql = 'SELECT CreatedById, CreatedDate, id, Name,' +
            ' goodsPrice__c, Maxprice__c, Status__c,' +
            ' LastModifiedDate, LastModifiedById,OwnerId FROM Goods__c' +
            ' where Id = :goodsId';
        } else {
            fetchSql = 'SELECT CreatedById, CreatedDate, id, Name,' +
            ' goodsPrice__c, Maxprice__c, Status__c,' +
            ' LastModifiedDate, LastModifiedById,OwnerId FROM Goods__c limit :PAGE_SIZE offset :offsetNumber';
        }
        List<Goods__c> goodsList = Database.query(fetchSql);
        return goodsList;
    }
    @HttpPost
        global static Id insertGoods(String goodsName,String goodsPrice,String goodsMaxPrice,String goodsStatus) {
        System.debug('---------goodsName-------------' + goodsName);
        Goods__c goods = new Goods__c();
        if(goodsPrice != null && goodsPrice.isNumeric()) {
            goods.goodsPrice__c = Double.valueOf(goodsPrice);
        }
        if(goodsMaxPrice != null && goodsMaxPrice.isNumeric()) {
            goods.Maxprice__c = Double.valueOf(goodsMaxPrice);
        }
        goods.Name = goodsName;
        goods.Status__c = goodsStatus;
        insert goods;
        return goods.Id;
    }
    
    @HttpDelete
    global static void deleteGoods() {
        RestRequest request = RestContext.request;
        String goodsId = request.requestURI.substring(
            request.requestURI.lastIndexOf('/')+1);
        Goods__c needDeleteGoods = [select Id from Goods__c where Id = :goodsId];
        if(needDeleteGoods != null) {
            delete needDeleteGoods;
        }
    }
    @HttpPut
    global static ID upsertGoods(String id,String goodsName,String goodsPrice,String goodsMaxPrice,String goodsStatus) {
        Goods__c goods = new Goods__c();
        goods.Id = id;
        goods.Name = goodsName;
        goods.Status__c = goodsStatus;
        if(goodsPrice != null && goodsPrice.isNumeric()) {
            goods.goodsPrice__c = Double.valueOf(goodsPrice);
        }
        if(goodsMaxPrice != null && goodsMaxPrice.isNumeric()) {
            goods.Maxprice__c = Double.valueOf(goodsMaxPrice);
        }
        upsert goods;
        return goods.Id;
    }
    @HttpPatch
    global static ID updateGoods() {
        RestRequest request = RestContext.request;
        String goodsId = request.requestURI.substring(
            request.requestURI.lastIndexOf('/')+1);
        Goods__c goods = [select Id from Goods__c where Id= :goodsId];
        // Deserialize the JSON string into name-value pairs
        Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(request.requestbody.tostring());
        // Iterate through each parameter field and value
        System.debug('zzzzzzzzzzzzzzzzzzzzzzz');
        System.debug(params);
        System.debug(request.requestbody);
        System.debug(request.requestbody.tostring());
        
        goods.Name = String.valueOf(params.get('goodsName'));
        goods.goodsPrice__c = Double.valueOf(params.get('goodsPrice'));
        goods.Maxprice__c = Double.valueOf(params.get('goodsMaxPrice'));
        goods.Status__c = String.valueOf(params.get('goodsStatus'));
        update goods;
        return goods.Id;
    } 
}