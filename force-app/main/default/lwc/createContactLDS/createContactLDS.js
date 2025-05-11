import { createRecord, getRecord } from 'lightning/uiRecordApi';
import { LightningElement, track, wire } from 'lwc';

const FIELDS_ARRAY = ["Contact.Name", "Contact.Email", "Contact.Phone"];

export default class CreateContactLDS extends LightningElement {
    @track name='';
    @track email='';
    @track phone='';
    @track nameError='';
    @track emailError='';
    @track phoneError='';
    @track errorOnInsert='';
    @track successOnInsert='';
    @track isSubmitted=false;
    
    @track recordId='';
    @wire(getRecord, {recordId:'$recordId', fields:FIELDS_ARRAY}) contactRecord;
    
    handleInputChange(event){
        let inputToBeChanged=event.target.name;
        switch (inputToBeChanged) {
            case 'name':
                this.name=event.target.value;
                this.nameError=this.nameError?'':this.nameError;
                break;
            case 'email':
                this.email=event.target.value;
                this.emailError=this.emailError?'':this.emailError;
                break;
            case 'phone':
                this.phone=event.target.value;
                this.phoneError=this.phoneError?'':this.phoneError;
                break;
            default:
                break;
        }
    }

    handleSubmit(){
        if (!this.name||!this.email||!this.phone){
            this.nameError=!this.name?'Name is required':'';
            this.emailError=!this.email?'Email is required':'';
            this.phoneError=!this.phone?'Phone is required':'';
            return;
        }
        const fields={
            'LastName':this.name,
            'Email':this.email,
            'Phone':this.phone
        }
        const recordToInsert={
            apiName:'Contact',
            fields
        }
        createRecord(recordToInsert)
        .then((res)=>{
            this.recordId=res.id;
            this.errorOnInsert=this.errorOnInsert?'':this.errorOnInsert;
            this.successOnInsert=`Contact Uploaded Successfully - ${res.id}`;
            this.isSubmitted=true;
        }).catch((err)=>{
            this.successOnInsert=this.successOnInsert?'':this.successOnInsert;
            this.errorOnInsert=`Error Occurred - ${err.body.message? err.body.message: ''}`;
        })
        return;
    }

    get contactName() {
        if (this.contactRecord && this.contactRecord.data && this.contactRecord.data.fields) {
            return this.contactRecord.data.fields.Name.value || '';
        }
        return 'RECORD_NOT_AVAILABLE';
    }

    get contactPhone() {
        if (this.contactRecord && this.contactRecord.data && this.contactRecord.data.fields) {
            return this.contactRecord.data.fields.Phone.value || '';
        }
        return 'RECORD_NOT_AVAILABLE';
    }

    get contactEmail() {
        if (this.contactRecord && this.contactRecord.data && this.contactRecord.data.fields) {
            return this.contactRecord.data.fields.Email.value || '';
        }
        return 'RECORD_NOT_AVAILABLE';
    }
}
