global  class AlquilerScheduler  implements Schedulable  {
 
    global void execute(SchedulableContext ctx) {

    List<Alquiler_de_vehiculo__c> listaVe = new List<Alquiler_de_vehiculo__c>();
    List<Vehiculo_de_Carga__c> lf = new List<Vehiculo_de_Carga__c>();
   

    

    for (Alquiler_de_vehiculo__c alqu : [SELECT
                                                Fecha_Final__c,
                                                Vehiculo_de_Carga__r.Name,
                                                Catindad_de_Vehiculos__c,
                                                Vehiculo_de_Carga__r.id
                                                From Alquiler_de_vehiculo__c where Fecha_Final__c = TODAY ]) {
                    
                                                    Vehiculo_de_Carga__c ver = new Vehiculo_de_Carga__c();
                                                    ver.Cantidad_de_Flota__c = alqu.Catindad_de_Vehiculos__c;
       }
      
       System.debug(listaVe);
       

    }

}