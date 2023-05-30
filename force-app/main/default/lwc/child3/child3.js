import { LightningElement, track } from 'lwc';
export default class Child3 extends LightningElement {

    @track error;
    @track stack;

    //State variable to control rendering the HTML markup
    @track state =
    {
        initDone : false
    }

    constructor() 
    {
        super();
        console.log('@@@@@ I am in Child3 Constructor');
    }

    connectedCallback() 
    {
        this.state.initDone = false;
        console.log('@@@@@ I am in Child3 ConnectedCallback');
        this.state.initDone = true;
        //throw Error('Error in Child3');
    }

    renderedCallback()
    {
        console.log('@@@@@ I am in Child3 RenderedCallback');
    }

    errorCallback(error, stack) 
    {
        this.error = error;
        this.stack = stack;
        console.log('@@@@@ I am in Child3 ErrorCallback');
    }
}