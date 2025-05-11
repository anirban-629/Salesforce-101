import { api, LightningElement, track } from 'lwc';

export default class ChildComp extends LightningElement {
    @track  message = '_________________';
    @api
    changeMessage(str){
        this.message = str ? str.toUpperCase():'_________________';
    }
}