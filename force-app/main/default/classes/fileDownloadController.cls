public without sharing class fileDownloadController {
    public String documentId = '';
    public Boolean showDownload {get;set;}
    public fileDownloadController(){
        init();
    }
    public void init(){
        Map<String,String> paramMap = ApexPages.currentPage().getParameters();
        if(paramMap.get('documentId')!=null){
            documentId = paramMap.get('documentId');
            showDownload = true;
        }else{
            showDownload = false;
        }
    }
    public String getDownloadUrl(){
        
            String url = '/servlet/servlet.FileDownload?file=' + documentId;
            return url;
        
    }

}