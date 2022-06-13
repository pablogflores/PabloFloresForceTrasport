import { LightningElement,api,track, wire} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getFactura from '@salesforce/apex/AlertaFactura.getFactura';
let count;

export default class AlertaFactura extends LightningElement {
    @track datita;
    @track Error; 
    @api recordId;   
    @track count


   @wire(getFactura,{idObject: '$recordId'})
   wiredAccounts({error,data}){
    if(data){
        count = 0
        this.datita = data;
        console.log(this.datita);
        data.forEach(dato => {
            if (dato.Pagado__c === false) {
                count ++
            }
        });
        if (count>0) {
            let title = `Hay ${count} facturas sin pagar`
            this.showWarningToast(title);
        }else{
            let title = `No hay Facturas pendientes`;
            this.showSuccessToast(title);

        }

         
    }else if(error){
        this.Error = error;
    }
}

showWarningToast(title) {
    const evt = new ShowToastEvent({
        title,
        variant: 'warning',
        mode: 'dismissable'
    });
    this.dispatchEvent(evt);
}

showSuccessToast(title) {
    const evt = new ShowToastEvent({
        title,
        variant: 'success',
        mode: 'dismissable'
    });
    this.dispatchEvent(evt);
}


}