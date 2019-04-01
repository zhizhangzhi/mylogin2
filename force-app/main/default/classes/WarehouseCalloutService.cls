public with sharing class WarehouseCalloutService {

    private static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment';
    
    // complete this method to make the callout (using @future) to the
    // REST endpoint and update equipment on hand.
    @future(callout = true)
    public static void runWarehouseEquipmentSync(){
        List<Product2> upsertList = new List<Product2>();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(WAREHOUSE_URL);
        req.setMethod('GET');
        Http http = new Http();
        HttpResponse res = http.send(req);
        
        String JSONContent = res.getBody().replaceAll('_id','equipmentId');
        System.debug(JSONContent);
        JSONParser parser = JSON.createParser(JSONContent);
        while(parser.nextValue() == JSONToken.START_ARRAY){
            if(parser.getCurrentToken() == JSONToken.START_ARRAY){
                while (parser.nextToken() != null){
                    if (parser.getCurrentToken() == JSONToken.START_OBJECT){
                        Equipment inv = (Equipment)parser.readValueAs(Equipment.class);
                        upsertList.add(new Product2(Lifespan_Months__c=inv.lifespan,
                                                   Cost__c=inv.cost,
                                                   Replacement_Part__c = inv.replacement,
                                                   Maintenance_Cycle__c = inv.maintenanceperiod,
                                                   Warehouse_SKU__c = inv.sku,
                                                   Current_Inventory__c = inv.quantity,
                                                   name = inv.name));
                        parser.skipChildren();
                    }
                }
			}
        }
        upsert upsertList Warehouse_SKU__c;
        System.debug([select id,name,Cost__c,Replacement_Part__c from Product2  where name='Generator 1000 kW' ]);
    }
    public class Equipment{
        public String equipmentId;
        public Boolean replacement;
        public Integer quantity;
        public String name;
        public Integer maintenanceperiod;
        public Integer lifespan;
        public Integer cost;
        public String sku;
	}

}