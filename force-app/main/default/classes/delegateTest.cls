public without sharing class delegateTest {
    public delegateTest(ApexPages.StandardController controller){}
    
    public String mer_id{ get; set;}
    public String keyword_merName{ get; set;}
    public MerchanVo merVo{get;set;}
    public ID[] lineIdList= new ID[]{};
    public String lineItemIdList { get; set;}    
    public String lineItemNameList { get; set;}
    public String lineInputValue { get; set;}
    public List<SelectOption> lineIdListOptions { get; set;}
    public List<SelectOption> lineIdListBackupOptions { get; set;}
    public List<Merchandise__c> recordList = new List<Merchandise__c>();
    public List<Line_Item__c> lineList = new List<Line_Item__c>();
    private Map<String, MerchanVo> mer_vo_map = new  Map<String, MerchanVo>();
    public List<Merchandise__c> hcps{
        get{
            if(recordList!=null){
                return recordList;
            }else{
                return null;
            }
        }
        set;
    }
    public String[] getLineIdList() {
        return lineIdList;
    }

    public void setLineIdList(ID[] lineIdList) {
        this.lineIdList= lineIdList;
    }
    
    
    
    
    public void queryMerByCondition(){
        String queryStr = 'select id,Name,Price__c,Quantity__c from Merchandise__c where id!=null';
        if(!String.isEmpty(keyword_merName)){
            queryStr+=' AND Name LIKE \'%'+keyword_merName+'%\' ';
        }
        recordList = Database.query(queryStr);
        for(Merchandise__c mer : recordList){
    		MerchanVo me = new MerchanVo();
            me.meId = mer.Id;
            me.merName = mer.Name;
            me.merPrice = mer.Price__c;
            me.merQuantity = mer.Quantity__c;
            mer_vo_map.put(me.meId,me);
        
    	}
    }
    public void loadMerInfo(){
        //System.debug('*************'+merId);
        merVo = (MerchanVo)mer_vo_map.get(mer_id);
        //System.debug('@@@@@@@@@@@@@'+recordLis);
        loadLineList();
    }
    public void loadLineList(){
        lineIdListOptions = new List<SelectOption>();
        lineIdListBackupOptions = new List<SelectOption>();
        String query = 'select id,Name from Line_Item__c';
        lineList = Database.query(query);
        for(Line_Item__c line : lineList){
            lineIdList.add(line.Id);
            lineIdListOptions.add(new SelectOption((String)(line.ID),(String)(line.Name)));
        }
        lineIdListBackupOptions = lineIdListOptions;
    }
    
    public void lineFilter(){
        lineIdListOptions = new List<SelectOption>();
        if(lineInputValue == null || lineInputValue == ''){
            lineIdListOptions = lineIdListBackupOptions;
        }else{
            for(Integer i=0;i<lineIdListBackupOptions.size();i++) {
	    		SelectOption option = lineIdListBackupOptions.get(i);
	    		system.debug('============option label' + option.getLabel());
	    		if(option.getLabel().startsWithIgnoreCase(lineInputValue)) {
	    			lineIdListOptions.add(option);
	    		}
	    	}
        }
    }
	
}