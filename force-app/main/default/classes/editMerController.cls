public without sharing class editMerController extends Pagination {
    public editMerController(){
        super();
        init();
    }

    public editMerController(ApexPages.StandardSetController controller) {
        super(controller);
        init();        
    }
    
    public editMerController(ApexPages.StandardController controller){
        super(controller);
        init();  
    }
    public void init(){
        Map<String,String> parameters=ApexPages.currentPage().getParameters();
        System.debug('***************'+parameters);
        isEditView= Boolean.valueOf(parameters.get('isEditView'));
        merId = parameters.get('merrId');
        loadMerInfo();
    }
    
    class MerVo{
        public ID id{get;set;}
        public String merName{get;set;}
        public Date merDeadline{get;set;}
        public Double merPrice{get;set;}
        public Integer merQuantity{get;set;}
    }
    public Boolean isEditView {get;set;}
    public String merId {get;set;}
    public MerVo merVo {get;set;}
    public Merchandise__c merchandise = new Merchandise__c();
    public Merchandise__c getMerchandise(){return merchandise;}
    public void setMerchandise(Merchandise__c merchandise){this.merchandise=merchandise;}
    public Document afile{
        get{
            if(afile == null){
                afile = new Document();                
            }
            return afile;
        }
        set;
    }
    public void loadMerInfo(){
        merVo = new MerVo();
        merchandise = [select Id,name,deadline__c,Price__c,Quantity__c from Merchandise__c where Id = :merId];
        merVo.id = merchandise.Id;
        merVo.merName = merchandise.name;
        merVo.merDeadline = Date.valueOf(merchandise.deadline__c);
        merVo.merPrice = merchandise.Price__c;
        merVo.merQuantity = Integer.valueOf(merchandise.Quantity__c);
    }
    public PageReference showMerList(){
        return redirectTo('/apex/sea');
    }
    public PageReference showEdit(){
        String para = 'isEditView=true';
        if(merId!=null && !''.equals(merId)){
            para += '&merrId=' + merId;
        }
        return redirectTo('/apex/Edit_Mer?' + para);
    }
    private PageReference redirectTo(String page){
        PageReference pageRef = new PageReference(page);
        pageRef.setRedirect(true);
        return pageRef;
    }
    public PageReference updateMer(){
        try{
            update merchandise;
        }catch(System.DMLException e){
            ApexPages.addMessages(e);
			return null;
        }
        PageReference redirectSuccess = new ApexPages.StandardController(merchandise).view();
        return(redirectSuccess);
        //return redirectTo('/apex/sea');
    }
	
}