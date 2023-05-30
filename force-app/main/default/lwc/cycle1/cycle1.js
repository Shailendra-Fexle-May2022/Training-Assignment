import { LightningElement, track,api} from 'lwc';
export default class Cycle1 extends LightningElement {

    @track error;
    @track stack;
    @api hideGrandChild1;

    //State variable to control rendering the HTML markup
    @track state =
    {
        initDone : false
    }

    constructor() 
    {
        super();
        console.log('@@@@@ I am in Cycle1 Constructor');
    }

    connectedCallback() 
    {
        this.state.initDone = false;
        console.log('@@@@@ I am in Cycle1 ConnectedCallback');
        this.state.initDone = true;
        //throw Error('Error in Cycle1');
    }

    renderedCallback()
    {
        console.log('@@@@@ I am in Cycle1 RenderedCallback');
    }

    disconnectedCallback() {
       console.log('@@@@@ I am in Cycle1 DisconnectedCallback');
    }
    /*errorCallback(error, stack) 
    {
        this.error = error;
        this.stack = stack;
        console.log('@@@@@ I am in Cycle1 ErrorCallback');
    }*/
}