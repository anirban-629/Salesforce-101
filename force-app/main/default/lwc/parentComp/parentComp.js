import { LightningElement } from 'lwc';

export default class ParentComp extends LightningElement {
    handelChangeEvent(event){
        this.template.querySelector('c-child-comp').changeMessage(event.target.value);
    }
}