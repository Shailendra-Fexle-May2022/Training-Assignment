import { LightningElement,track,api } from 'lwc';
export default class Life extends LightningElement {

    @track error;
    @track stack;
    @api hideGrandChild;
    @api hideGrandChild2;
    @api hideGrandChild3;
    //State variable to control rendering the HTML markup
    @track state =
    {
        initDone : false
    }

    constructor() 
    {
        super();
        console.log('@@@@@ I am in Life Constructor');
    }

    connectedCallback() 
    {
        this.state.initDone = false;
        console.log('@@@@@ I am in Life ConnectedCallback');
        this.state.initDone = true;
        //throw Error('Error in Life 1');
    }

    renderedCallback()
    {
        console.log('@@@@@ I am in Life RenderedCallback');
    }

    disconnectedCallback() {
       console.log('@@@@@ I am in Life DisconnectedCallback');
    }
    /*errorCallback(error, stack) 
    {
        this.error = error;
        this.stack = stack;
        console.log('@@@@@ I am in Life ErrorCallback');
    }*/
}