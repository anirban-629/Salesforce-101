import { LightningElement, wire } from 'lwc';
import id from '@salesforce/user/Id';
import NAME_FIELD from '@salesforce/schema/User.Name';
import { getFieldValue, getRecord } from 'lightning/uiRecordApi';
const fields = [NAME_FIELD]

export default class BikeSelection extends LightningElement {
    userId=id
    @wire(getRecord, {recordId: '$userId', fields}) 
    user;
    get name(){
        return this.user.data? getFieldValue(this.user.data, NAME_FIELD):'NAME_NOT_RETRIEVED';
    }
}