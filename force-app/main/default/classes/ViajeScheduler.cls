global class ViajeScheduler implements Schedulable {


    global void execute(SchedulableContext ctx) {
        ViajesIndividuales.UpdateVehiculos();
    }

    
}

