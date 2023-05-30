/* ERROR HANDLING */
//https://developer.salesforce.com/blogs/2020/08/error-handling-best-practices-for-lightning-web-components

//Boundary Component
//https://developer.salesforce.com/docs/component-library/documentation/en/lwc/lwc.create_lifecycle_hooks_error

import { LightningElement, track } from 'lwc';
export default class Boundary extends LightningElement 
{
    @track errors = [];

    //State variable to control rendering the HTML markup
    @track state =
    {
        initDone : false,
        errorExists : false
    }

    constructor() 
    {
        super();
        //console.log('@@@@@ I am in Boundary Constructor');
    }

    connectedCallback() 
    {
        this.errors = [];
        this.state.initDone = true;
    }

    renderedCallback()
    {
        //console.log('@@@@@ I am in Boundary ErrorCallback errors ' + JSON.stringify(this.errors));
        console.log('@@@@@ I am in Boundary RenderedCallback');
    }

    /*errorCallback(error) 
    {
        this.errors.push(error.message);
        this.state.errorExists = true;
    }*/
}