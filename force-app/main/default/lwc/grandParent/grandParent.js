import { LightningElement,track } from 'lwc';
import firsttemplate from './grandParent.html';
import secondtemplate from './template1.html';
export default class GrandParent extends LightningElement {

    @track error;
    @track stack;

    //State variable to control rendering the HTML markup
    @track state =
    {
        initDone : false
    }

    templatenumber = 'temp1';

    constructor() 
    {
        super();
        //console.log('@@@@@ I am in Grand Parent Constructor');
    }

    connectedCallback() 
    {
        this.state.initDone = false;
        //console.log('@@@@@ I am in Grand Parent ConnectedCallback');
        this.state.initDone = true;
    }

    renderedCallback()
    {
        //console.log('@@@@@ I am in Grand Parent RenderedCallback');
    }

    /*errorCallback(error, stack) 
    {
        this.error = error;
        this.stack = stack;
        console.log('@@@@@ I am in Grand Parent ErrorCallback');
        console.log('@@@@@ this.error ' + this.error);
        console.log('@@@@@ this.error JSON ' + JSON.stringify(this.error));
    }*/

    onchangeInGP()
    {
        console.log('Inside change template in GP');
        if(Object.is(this.templatenumber, 'temp1'))
        {
            this.templatenumber='temp2';
        }
        else
        {
            this.templatenumber='temp1';
        }
    }

    render()
    {
        //console.log('Inside render in Grand Parent');
        if(Object.is(this.templatenumber,'temp1')) 
        {
            return firsttemplate;
        }
        else 
        {
            return secondtemplate;
        } 
    }
}