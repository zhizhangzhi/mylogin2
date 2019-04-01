public without sharing class fileUploadController {
    public transient Blob fileUploadBody{get;set;}
    public String fileUploadName{get;set;}
    public void uploadFile(){
        Document uploadFileDocument = new Document();
        Boolean needInsert = false;
        if(fileUploadBody != null && fileUploadBody.size()>0){
            uploadFileDocument.body = fileUploadBody;
            needInsert = true;
        }
        if(fileUploadName!=null){
            uploadFileDocument.Name = fileUploadName;
            needInsert = true;
        }
        if(needInsert){
            try{
                uploadFileDocument.FolderId = '00l28000001X2a0';
                insert uploadFileDocument;
                Apexpages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,'上传成功'));
            }catch(DmlException e){
                Apexpages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'上传失败'));
            }
        }else{
             ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING,'无上传内容'));
        }
    }

}