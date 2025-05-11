import { LightningElement, track } from 'lwc';

export default class Calculator extends LightningElement {
    @track currentInput = '';
    @track previousInput = '';
    @track currentOperation = '';
    @track displayValue = '';

    appendNumber(event) {
        const number = event.target.label;
        this.currentInput += number;
        this.displayValue = `${this.previousInput} ${this.currentOperation} ${this.currentInput}`;
    }

    appendOperation(event) {
        if (this.currentInput === '') return;
        if (this.previousInput !== '') {
            this.calculate();
        }
        this.currentOperation = event.target.label;
        this.previousInput = this.currentInput;
        this.currentInput = '';
        this.displayValue = `${this.previousInput} ${this.currentOperation}`;
    }

    calculate() {
        if (this.previousInput === '' || this.currentInput === '') return;

        const prev = parseFloat(this.previousInput);
        const curr = parseFloat(this.currentInput);
        let result;

        switch (this.currentOperation) {
            case '+':
                result = prev + curr;
                break;
            case '-':
                result = prev - curr;
                break;
            case '*':
                result = prev * curr;
                break;
            case '/':
                result = curr !== 0 ? prev / curr : 'Error';
                break;
            default:
                return;
        }

        this.currentInput = result.toString();
        this.previousInput = '';
        this.currentOperation = '';
        this.displayValue = this.currentInput;
    }

    clearDisplay() {
        this.currentInput = '';
        this.previousInput = '';
        this.currentOperation = '';
        this.displayValue = '';
    }
}
