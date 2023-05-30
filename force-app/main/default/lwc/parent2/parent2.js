import { LightningElement, track } from 'lwc';
export default class Parent2 extends LightningElement {

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
        console.log('@@@@@ I am in Parent2 Constructor');
    }

    connectedCallback() 
    {
        this.state.initDone = false;
        console.log('@@@@@ I am in Parent2 ConnectedCallback');
        this.state.initDone = true;
        //throw Error('Error in Parent2');
    }

    renderedCallback()
    {
        console.log('@@@@@ I am in Parent2 RenderedCallback');
    }

    errorCallback(error, stack) 
    {
        this.error = error;
        this.stack = stack;
        console.log('@@@@@ I am in Parent2 ErrorCallback');
    }
}