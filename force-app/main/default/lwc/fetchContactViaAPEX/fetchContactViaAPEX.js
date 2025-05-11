import { LightningElement, track, wire } from 'lwc';
import getAllContacts from"@salesforce/apex/ContactManager.getAllContacts";

export default class FetchContactViaAPEX extends LightningElement {
    @track noOfRecords;
    @track contacts;
    @wire(getAllContacts) wiredContacts({ error, data }) {
        if (data) {
            this.contacts = data;
        } else if (error) {
            console.error('Wire error:', error);
        }
    }

    get respnoseRecieved(){
        if(this.contacts){
            this.loading=false;
            return true;
        }
        return false;
    }
    handleNoOfRecordsChange(event){
        this.noOfRecords=event.target.value;
    }
    getContacts(){
        getAllContacts({numberOfRecords:this.noOfRecords}).then(result=>{
            this.contacts=result;
        }).catch(error=>{
            console.log(error);
            console.log('Error in retrieving contacts record - ', error.body.message);
        })
    }
}