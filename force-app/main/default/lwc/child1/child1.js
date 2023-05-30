import { LightningElement, track} from 'lwc';
export default class Child1 extends LightningElement {

   
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
        console.log('@@@@@ I am in Child1 Constructor');
    }

    connectedCallback() 
    {
        this.state.initDone = false;
        console.log('@@@@@ I am in Child1 ConnectedCallback');
        this.state.initDone = true;
        //throw Error('Error in Child 1');
    }

    renderedCallback()
    {
        console.log('@@@@@ I am in Child1 RenderedCallback');
    }

    errorCallback(error, stack) 
    {
        this.error = error;
        this.stack = stack;
        console.log('@@@@@ I am in Child1 ErrorCallback');
    }
}