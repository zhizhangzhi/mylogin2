public class merController1 {
    public Merchandise__c merchandise {get;set;}
    public merController1(ApexPages.StandardSetController controller) {
        this.merchandise = (Merchandise__c)controller.getRecord();     
    }
    public ApexPages.StandardSetController merRecords{
        get{
            if(merRecords == null) {
                merRecords=new ApexPages.StandardSetController(Database.getQueryLocator([select id,Name,Price__c,Quantity__c from Merchandise__c where id!=null]));
            }
            return merRecords;
        }
        set;
    }
    public List<Merchandise__c> getMer(){
        return (List<Merchandise__c>)merRecords.getRecords();
    }
	
}