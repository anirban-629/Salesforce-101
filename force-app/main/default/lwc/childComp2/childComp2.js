import { LightningElement, track } from 'lwc';

export default class ChildComp2 extends LightningElement {
    handelChangeEvent(event){
        const message= event.target.value;
        // NAME SHOULD BE onmessagefromchild in parent
        const newEvent=new CustomEvent('messagefromchild',{
            detail:message,
            bubbles:true // WAY 2 Check parentComp2.js
        });
        this.dispatchEvent(newEvent);
    }
}