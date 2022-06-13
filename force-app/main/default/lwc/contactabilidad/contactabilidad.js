import { LightningElement,api, track, wire } from 'lwc';

import getContactos from '@salesforce/apex/Contactabilidad.getContactos';

const columns = [
    { label: 'Account name',fieldName: 'Name',type: 'text',sortable: true },
    { label: 'Phone', fieldName: 'Phone', type: 'phone',sortable: true },
    { label: 'Email', fieldName: 'Email', type: 'email',sortable: true }
];

export default class Contactabilidad extends LightningElement {

 // reactive variables

 columns = columns;
 @track errorData;
 @track accList;
 @api recordId;
 
    @wire(getContactos,{idObject: '$recordId'})
    wiredContact({error,data}){
        if(data){
            this.accList = data;
            console.log(data)
           
        }else if(error){
            this.Error = error;
        }
    }






}