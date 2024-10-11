public with sharing class SampleMainApexClass implements Queueable{

    public static void execute(QueueableContext qc){
        SampleMainApexClass.synchroniseInventory();
    }

    @future(callout=true)
    public static void synchroniseInventory() {
        try {
            Http http=new Http();
            HttpRequest request=new HttpRequest();
            request.setEndpoint('https://th-superbadge-apex.herokuapp.com/equipment');
            request.setMethod('GET');

            List<Product2> upsertedProduct=new List<Product2>();

            HttpResponse response = http.send(request);

            if (response.getStatusCode()==200){
                List<Object> inventoryItems=(List<Object>)JSON.deserializeUntyped(response.getBody());
                for (Object inventoryItem : inventoryItems) {
                    Map<String,Object> destructItem=(Map<String, Object>)inventoryItem;
                    Product2 pd=new Product2(
                        Replacement_Part__c=true,
                        Cost__c=Integer.valueOf(destructItem.get('cost')),
                        Current_Inventory__c=Integer.valueOf(destructItem.get('quantity')),
                        Lifespan_Months__c=Integer.valueOf(destructItem.get('lifespan')),
                        Maintenance_Cycle__c=Integer.valueOf(destructItem.get('maintenanceperiod')),
                        Warehouse_SKU__c=(String) destructItem.get('sku'),
                        Name=(String) destructItem.get('name')
                    );
                    upsertedProduct.add(pd);
                }
            }
            else {
                throw new CalloutException('Sync failed: StatusCode:'+response.getStatusCode()+' Status:'+response.getStatus()+' Message:'+response.getBody());
            }
            System.debug(upsertedProduct);
            if (!upsertedProduct.isEmpty()){
                upsert upsertedProduct;
            }
        } catch (Exception e) {
            System.debug(e.getMessage());   
        }
    }
}