public class InvoiceUtilities {
    public static String renumberLineItems(String invoiceName){
        Invoice__c invoice = [Select i.Name, (Select Name From Line_Item__r ORDER BY Name)
                              From Invoice__c i
                              Where i.Name = :invoiceName LIMIT 1];
        Integer i = 1;
        for (Line_Item__c item : invoice.Line_Item__r) {
        item.Name = String.valueOf(i);
        System.debug(item.Name);
        i++;
        }
        System.debug('xxx');
        try {
            System.debug('yyy');
            Database.update(invoice.Line_Item__r);	
            System.debug('ssss');
            }catch (DmlException e) {
            return e.getMessage();
            }
            
        return 'Line items renumbered successfully.';
    }
	
}