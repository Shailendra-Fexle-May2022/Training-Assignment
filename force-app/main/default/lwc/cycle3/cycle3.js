import { LightningElement, track, api } from 'lwc';
export default class Cycle3 extends LightningElement {

    @track error;
    @track stack;

    //State variable to control rendering the HTML markup
    @track state =
    {
        initDone : false
    }
    @api hideGrandChild3;

    constructor() 
    {
        super();
        console.log('@@@@@ I am in Cycle3 Constructor');
    }

    connectedCallback() 
    {
        this.state.initDone = false;
        console.log('@@@@@ I am in Cycle3 ConnectedCallback');
        this.state.initDone = true;
        //throw Error('Are you kidding');
    }

    renderedCallback()
    {
        console.log('@@@@@ I am in Cycle3 RenderedCallback');
    }

    disconnectedCallback() {
        console.log('@@@@@ I am in Cycle3 DisconnectedCallback');
        throw new Error('Are you kidding');
       
    }
    /*errorCallback(error) 
    {
        this.error = error;
        console.log('Are you kidding');
    }*/
}