public without sharing class selectController {
    public selectController(ApexPages.StandardController selectController){}
    
    public Job_Application__c jobApplication = new  Job_Application__c();    
    public Job_Application__c getJobApplication (){return jobApplication ; }    
    public void setJobApplication (Job_Application__c jobApplication){this.jobApplication=jobApplication ; }
    public List<Selectoption> getJobStatusOpts(){
        List<Selectoption> StatusOpts = new List<Selectoption>();
        StatusOpts.add(new Selectoption('','--无--'));
    	StatusOpts.add(new Selectoption('New','New'));
    	StatusOpts.add(new Selectoption('Extend an Offer','Extend an Offer'));
        return StatusOpts;
    }
    
    public void loadS(){
        System.debug('target_status');
    }
    
    
	
}