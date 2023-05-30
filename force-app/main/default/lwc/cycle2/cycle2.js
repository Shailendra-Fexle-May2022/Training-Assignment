import { LightningElement,track,api } from 'lwc';
export default class Cycle2 extends LightningElement {

    @track error;
    @track stack;
    @api hideGrandChild2;
    //State variable to control rendering the HTML markup
    @track state =
    {
        initDone : false
    }

    constructor() 
    {
        super();
        console.log('@@@@@ I am in Cycle2 Constructor');
    }

    connectedCallback() 
    {
        this.state.initDone = false;
        console.log('@@@@@ I am in Cycle2 ConnectedCallback');
        this.state.initDone = true;
        //throw Error('Error in Cycle2');
    }

    renderedCallback()
    {
        console.log('@@@@@ I am in Cycle2 RenderedCallback');
    }

    disconnectedCallback() {
       console.log('@@@@@ I am in Cycle2 DisconnectedCallback');
    }
   /* errorCallback(error, stack) 
    {
        this.error = error;
        this.stack = stack;
        console.log('@@@@@ I am in Cycle2 ErrorCallback');
    }*/
}