global class ViajesIndividuales {
  
     public static void UpdateVehiculos(){
    List<Viajes_individuales__c> lista = new List<Viajes_individuales__c>();
    List<Vehiculo__c> listv = new List<Vehiculo__c>();
    System.debug('hola');
    for (Viajes_individuales__c alquiler : [SELECT 
    Id,
    Vehiculo__r.Id,
    Vehiculo__r.name,
    Vehiculo__r.Estado__c
    From Viajes_individuales__c
    where Fecha_Final__c = TODAY ]) {
    
    Vehiculo__c vahiculo = new Vehiculo__c();
    vahiculo.Id= alquiler.Vehiculo__r.Id;
    vahiculo.Estado__c =true;
    listv.add(vahiculo);
   

        
  }  

  System.debug( listv);

  update listv;
 }
}