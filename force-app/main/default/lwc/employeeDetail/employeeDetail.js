import { api, LightningElement } from 'lwc';

export default class EmployeeDetail extends LightningElement {
    @api empDetail={
        empName:'John',
        empAddress:'TX'
    }
}