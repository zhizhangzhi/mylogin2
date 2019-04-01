public with sharing class ZipController {
    
    public transient Blob fileUploadBody1{get;set;}
    
    public String fileUploadName1{get;set;}
    
    public transient Blob fileUploadBody2{get;set;}
    
    public String fileUploadName2{get;set;}
    
    public transient Blob fileUploadBody3{get;set;}
    
    public String fileUploadName3{get;set;}
    
    public transient Map<String,Blob> fileNameToBody{get;set;}
    
    public PageReference reference{get;set;}
    
    public PageReference downloadZip() {
        String zipName = 'testZip.zip';
        String prefixFolder = 'folder/';
        fileNameToBody = new Map<String,Blob>();
        if(fileUploadName1 != null && fileUploadBody1 != null) {
            fileNameToBody.put(fileUploadName1,fileUploadBody1);
        }
        if(fileUploadName2 != null && fileUploadBody2 != null) {
            fileNameToBody.put(fileUploadName2,fileUploadBody2);
        }
        if(fileUploadName3 != null && fileUploadBody3 != null) {
            fileNameToBody.put(fileUploadName3,fileUploadBody3);
        }
        Zippex zip = new Zippex();
        for(String fileName : fileNameToBody.keySet()) {
            zip.addFile(prefixFolder + fileName, fileNameToBody.get(fileName),null);
        }
        try{
          Document doc = new Document();
          doc.FolderId = UserInfo.getUserId();
          doc.Name = zipName;
          doc.Body = zip.getZipArchive();
          insert doc;
          return new PageReference('/servlet/servlet.FileDownload?file=' + doc.Id);
        } catch ( Exception ex ) {
          ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.ERROR,'生成zip失败'));
        }
        return null;
    }
}