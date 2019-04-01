public without sharing class merController {
    public merController() {
       init();      
    }
    public merController(ApexPages.StandardSetController controller) {
       init();        
    }
    public merController(ApexPages.StandardController controller){
       init(); 
    }
    private void init(){
         queryMer();
    }
    public void querySpeakerByCondition(){
        System.debug('%%%%%%%%%'+keywordmerName);
        queryMer();
    }
    public String keywordmerName{get;set;}
    public List<Merchandise__c> recordList = new List<Merchandise__c>();
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
    public List<Merchandise__c> queryMer(){
        System.debug('ssssssssss');
        System.debug('ffffffff' + keywordmerName);
        String queryStr = 'select id,Name,Price__c,Quantity__c from Merchandise__c where id!=null' ;
        String condition = '';
        if(!String.isEmpty(keywordmerName)){
            condition+=' AND Name LIKE \'%'+keywordmerName+'%\' ';
        }
        String querySql = queryStr + condition;
        recordList = Database.query(querySql);
        System.debug('%%%%%%%%%'+recordList);
        return recordList;
    }
	
}