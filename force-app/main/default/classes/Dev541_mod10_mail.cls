global class Dev541_mod10_mail implements Messaging.InboundEmailHandler {
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) 
    {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
        
        //受信したメールをもとに取引先を作成
        Account acc = new Account();
        
        acc.name = email.fromName;
        acc.Description = email.plainTextBody;
        
        insert acc;

        //添付ファイルの処理
        List<Attachment> atts = new List<Attachment>();
        for (Messaging.Inboundemail.Binaryattachment binAtt:
                email.binaryAttachments)
        {
            Attachment att = new Attachment();
            att.ParentId = acc.Id;
            att.Body = binAtt.body;
            att.Name = binAtt.fileName;
            atts.Add(att);
        }
        
        for(Messaging.Inboundemail.Textattachment txtAtt:
                email.textAttachments)
        {
            Attachment att = new Attachment();
            att.ParentId = acc.Id;
            att.Body = Blob.valueOf(txtAtt.body);
            att.Name = txtAtt.fileName;
            atts.Add(att);
        }       
        
        insert atts;
        
        //送信元アドレスにメール送信
        Messaging.Singleemailmessage mes = new Messaging.Singleemailmessage();
        
        mes.setSubject('テストメール');
        mes.setBccAddresses(new String[]{email.fromAddress});
        mes.setPlainTextBody('デモプログラムから送信しています');
        mes.setCharset('UTF-8');
        
        Messaging.SendEmailResult[] mailResults
            = Messaging.sendEmail(new Messaging.Singleemailmessage[]{mes});
            
        for (Messaging.Sendemailresult r:mailResults){
            if (r.isSuccess() == false){
                System.debug('メール送信エラー');
            }
        }
    
        return result;
    }
}