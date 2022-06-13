public with sharing class AlertaFactura {
    @AuraEnabled(cacheable=true)
    public static List<Factura__c> getFactura(string idObject){
    
        list <Factura__c> factura = new list<Factura__c>();
      
        for (Factura__c fc  :[SELECT Pagado__c from Factura__c where Account__c =:idObject])  {
            factura.add(fc);
            
         }

         return factura;
    }
}