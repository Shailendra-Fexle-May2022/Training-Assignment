import { LightningElement, track} from 'lwc';
export default class Child2 extends LightningElement {

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
        console.log('@@@@@ I am in Child2 Constructor');
    }

    connectedCallback() 
    {
        this.state.initDone = false;
        console.log('@@@@@ I am in Child2 ConnectedCallback');
        this.state.initDone = true;
        //throw Error('Error in Child2');
    }

    renderedCallback()
    {
        console.log('@@@@@ I am in Child2 RenderedCallback');
    }

    errorCallback(error, stack) 
    {
        this.error = error;
        this.stack = stack;
        console.log('@@@@@ I am in Child2 ErrorCallback');
    }
}