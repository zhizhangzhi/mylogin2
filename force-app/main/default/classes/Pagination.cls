public virtual without sharing class Pagination {
    public static final Integer DEFAULT_PAGE_SIZE=5;
    public Pagination(){
        
    }
    public Pagination(ApexPages.StandardSetController controller){
        
    }
    public Pagination(ApexPages.StandardController controller){
        
    }
    private String countStr;
    private String queryStr;
    private String queryCondition;
    private String groupBy;
    private String orderBy;
    private Integer offset=0;
    
    
    public virtual void setQueryCondition(String countStr,String queryStr){
        setQueryCondition(countStr,queryStr,null,null,null);
    }
    public virtual void setQueryCondition(String countStr,String queryStr,String queryCondition){
        setQueryCondition(countStr,queryStr,queryCondition,null,null);
    }
    public virtual void setQueryCondition(String countStr,String queryStr,String queryCondition,String groupBy,String orderBy){
        this.countStr=countStr;
        this.queryStr=queryStr;
        this.queryCondition=queryCondition;
        this.groupBy=groupBy;
        this.orderBy=orderBy;
        buildQuery();
    }
    public void buildQuery(){
        List<String> queryArgs = new List<String>();
        List<String> countArgs = new List<String>();
        if(String.isNotBlank(countStr)){
            countArgs.add(countStr);
        }
        if(String.isNotBlank(queryStr)){
           queryArgs.add(queryStr); 
        }
        if(String.isNotBlank(queryCondition)){
            queryArgs.add(queryCondition);
            countArgs.add(queryCondition);
        }
        if(String.isNotBlank(groupBy)){
            queryArgs.add(groupBy);
            countArgs.add(groupBy);
        } 
        if(String.isNotBlank(orderBy)){
            queryArgs.add(orderBy);
        }
        initTotalNum(countArgs);
        queryStr=String.join(queryArgs,' ');
        offset=0;
        
    }
    public void initTotalNum(List<String> countArgs){
        String countqueryStr=String.join(countArgs,' ');
        if(String.isNotBlank(countqueryStr)){
            if(countqueryStr.indexOf('GROUP BY')>-1){
                List<sObject> records=Database.query(countqueryStr);
               	totalNumber=records==null?0:records.size();
            }else{
                List<sObject> records=Database.query(countqueryStr);
                totalNumber=records==null||records.isEmpty()?0:Integer.valueOf(records.get(0).get('expr0'));
            }
        }else{
             totalNumber=0;
        }
        if(totalNumber != null) {
            pageNumber=1;
       }
    }
    public virtual List<sObject> getQueryResult(){       
        if(String.isBlank(queryStr)){
            return new List<sObject>();
        }else{
            String querySql=queryStr+' limit '+pageSize+' offset '+offset;            
            System.Debug('%%%%%%%%%%$$$$$$$$$$$$$$querySql:'+querySql);
            return Database.query(querySql);
        }      
    }
    public virtual Integer getCountResult(){       
        return totalNumber;
    }
    public virtual void changePageSize(Integer pageSize) {        
        if (pageSize!=null){                    
            this.pageSize=pageSize;                     
        }       
    }
    public Boolean hasNext {
        get {
            return pageSize*pageNumber<totalNumber;               
        }
        set;
    }
    public Boolean hasPrevious {
        get {
            return pageSize*(pageNumber-1)>0;            
        }
        set;
    }
    public Integer totalNumber{
        get{
            if(totalNumber==null){
                totalNumber=0;
            }
            return totalNumber;
        }
        set;
    }
    public Integer pageNumber {
        get {
            if(pageNumber==null){
                pageNumber=0;
            }
            return pageNumber;                 
        }
        set;
    }
    public Integer pageSize{
        get{
            if(pageSize==null){
                pageSize=DEFAULT_PAGE_SIZE;               
            } 
            return pageSize;          
        }
        set;
    }
    public Integer totalPage{
        get{
                if(totalNumber==0 || math.mod(totalNumber,pageSize)!=0){                       
                    return totalNumber/pageSize+1;                        
                }else{
                    return totalNumber/pageSize;
                }          
        }
        set;
    }
    public Boolean hasRecord{
        get {
            if(totalNumber!=0){
                return true;
            }else{
                return false;
            }           
        }
        set;
    } 
    
    public virtual void  first() {
        offset=0;
        pageNumber=1;       
    }
     public virtual  void  last() {
        offset=(totalPage-1)*pageSize;
        pageNumber=totalPage;                       
    }
    public virtual void  previous() {
        pageNumber--;
        if(pageNumber<0){
            pageNumber=0;
            offset=0;
        }else{
            offset=(pageNumber-1)*pageSize;
        }          
    } 
   
    public virtual void  next() {             
        pageNumber++;       
        if(pageNumber>totalPage){
            pageNumber=totalPage;
        }      
        offset=(pageNumber-1)*pageSize;        
    }
    
    public virtual Integer getOffset(){
            return offset;
    }

    public virtual Integer getSize(){
            return pageSize;
    }
    
        
}