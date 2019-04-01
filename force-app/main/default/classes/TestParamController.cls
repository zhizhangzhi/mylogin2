public with sharing class TestParamController {
    public String param{get;set;}
    
    public PageReference redirectToBlankPage() {
        system.debug('=============param : ' + param);
        PageReference ref = new PageReference('/apex/detailGoodsTotal');       
        ref.setRedirect(true);        
        return ref;
        //return Page.detailGoodsTotal;
        
    }

	
}