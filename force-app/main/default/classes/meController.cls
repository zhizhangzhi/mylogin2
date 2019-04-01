public without sharing class meController extends Pagination{
    public meController(){        
        super(); 
        
        init();
    }

    public meController(ApexPages.StandardSetController controller) {
        super(controller);
        init();        
    }
    
    public meController(ApexPages.StandardController controller){
        super(controller);
        init();  
    }
    private void init(){
         
    }
    public void querySpeakerByCondition(){
        System.debug('%%%%%%%%%'+keywordmerName);
        queryMer();
    }
    public String keywordmerName{get;set;}
    public String merId { get; set;}
    public List<Merchandise__c> recordList = new List<Merchandise__c>();
    public List<Merchandise__c> recordLis = new List<Merchandise__c>();
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
    public List<Merchandise__c> hcp{
        get{
            if(recordLis!=null){
                return recordLis;
            }else{
                return null;
            }
        }
        set;
    }
    public void loadSpeakerInfo(){
        System.debug('*************'+merId);
        String str = 'select id,Name,Price__c,Quantity__c from Merchandise__c where id =: merId ';
        recordLis = Database.query(str);
        System.debug('@@@@@@@@@@@@@'+recordLis);
        
    }
    public void deletefromhcp(){
        for(integer i =0;i<recordLis.size();i++){
            if(recordLis.get(i).id == merId){
                recordLis.remove(i);
            }
        }
    }
    public void queryMer(){
        initMerInfo();
        recordList=getQueryResult();
        System.debug('@@@@@@@@@@@@@@@@'+recordList);
    }
    
    public PageReference showMerView(){
        return redirectTo('/apex/Edit_Mer?isEditView=false&merrId='+merId);  
    }
    
    public PageReference showMerEdit(){
        return redirectTo('/apex/Edit_Mer?isEditView=true&merrId='+merId);  
    }
    private PageReference redirectTo(String page){
        PageReference pageRef = new PageReference(page);
        pageRef.setRedirect(true);	
        return pageRef ;
    }
    
    public void initMerInfo(){
        String queryStr = 'select id,Name,Price__c,Quantity__c from Merchandise__c where id!=null';
        String countStr = 'select count(id) from Merchandise__c where id!=null';
        String condition='';
        if(!String.isEmpty(keywordmerName)){
            condition+=' AND Name LIKE \'%'+keywordmerName+'%\' ';
        }
        setQueryCondition(countStr,queryStr,condition);
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