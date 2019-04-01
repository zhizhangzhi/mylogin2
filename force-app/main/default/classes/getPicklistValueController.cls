public without sharing class getPicklistValueController {
    public getPicklistValueController(ApexPages.StandardController controller){
        init();
    }
    public Goods__c goods = new Goods__c();
    public Goods__c getGoods(){
        return goods;
    }
    public void setGoods(Goods__c goods){
        this.goods = goods;
    }
    public List<Selectoption> statuss{get;set;}
    public void init(){
        statuss = getStatusValues();
        Id id = ApexPages.currentPage().getParameters().get('id');
        goods = (id == null) ? new Goods__c() : [SELECT id, Name,goodsPrice__c, Status__c FROM Goods__c WHERE Id = :id];
    }
    
    public static List<Selectoption> getStatusValues(){
        List<Selectoption> fieldPickListValues = new List<Selectoption>();
    	Schema.DescribeFieldResult fieldDescribe = Goods__c.Status__c.getDescribe();
    	List<Schema.PicklistEntry> lPickEntryList = fieldDescribe.getPicklistValues();
    	for (Schema.PicklistEntry tPicklistEntry : lPickEntryList) {
    		fieldPickListValues.add(new SelectOption(tPicklistEntry.getValue(),tPicklistEntry.getValue()));
        }
        return fieldPickListValues;
    }
    public PageReference saveGood(){
        try{
            upsert(goods);
        }catch(System.DMLException e){
            ApexPages.addMessages(e);
            return null;
        }
        return null;
    }
}