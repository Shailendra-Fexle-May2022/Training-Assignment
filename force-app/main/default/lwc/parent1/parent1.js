import { LightningElement,track } from 'lwc';
export default class Parent1 extends LightningElement {

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
        //console.log('@@@@@ I am in Parent1 Constructor');
    }

    connectedCallback() 
    {
        this.state.initDone = false;
        //console.log('@@@@@ I am in Parent1 ConnectedCallback');
        this.state.initDone = true;
        //throw Error('Error in Parent 1');
    }

    /*render()
    {
        console.log('Inside render in Parent 1');
    }*/

    renderedCallback()
    {
        //console.log('@@@@@ I am in Parent1 RenderedCallback');
    }

    /*errorCallback(error, stack) 
    {
        this.error = error;
        this.stack = stack;
        console.log('@@@@@ I am in Parent1 ErrorCallback');
    }*/
}