import { LightningElement, track } from 'lwc';

export default class ParentComp2 extends LightningElement {
    @track message;

    // WAY 2
    constructor(){
        super();
        // Instead of HTML Using JAVASCRIPT
        this.template.addEventListener('messagefromchild', this.handleCustomEvent.bind(this));
    }
    // WAY 2

    handleCustomEvent(event){
        this.message=event.detail;
    }
}