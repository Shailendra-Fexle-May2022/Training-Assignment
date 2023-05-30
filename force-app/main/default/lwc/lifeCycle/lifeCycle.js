import { LightningElement,track } from 'lwc';
import doRecordsQuery from '@salesforce/apex/ContactController.getAccountDetails';
const DELAY_OF_2_SECOND = 2000;
export default class LifeCycle extends LightningElement {

    @track errors = [];
    @track error;
    @track accounts =[];
    @track cardVisible = true;
    hideGrandChild1 = true;
    hideGrandChild2  = true;
    hideGrandChild3  = true;

    //State variable to control rendering the HTML markup
    @track state =
    {
        initDone : false,
    }

    constructor() 
    {
        super();
        console.log('@@@@@ I am in LifeCycle Constructor');
    }

    connectedCallback() 
    {   
        //calling apex method
        console.log('@@@@@ I am in LifeCycle connectedCallback');
        doRecordsQuery()
            .then(result =>{
                this.accounts = result;
                console.log(this.accounts);
            })
            .catch(error =>{
                this.error = error;
            })
            .finally(() =>
            {
                setTimeout(() => 
                { 
                    this.state.initDone = true;
                }, DELAY_OF_2_SECOND
                );
            });
    }

    renderedCallback()
    {
        console.log('@@@@@ I am in LifeCycle ErrorCallback errors ' + JSON.stringify(this.errors));
        console.log('@@@@@ I am in LifeCycle RenderedCallback');
    }

    disconnectComponent(){

        this.cardVisible = !this.cardVisible;
        //console.log('@@@@@ I am in LifeCycle(All) DisconnectedCallback');
    }
    disconnectCycle1(){
        this.hideGrandChild1 = !this.hideGrandChild1;
        //console.log('@@@@@ I am in LifeCycle(Cycle1) DisconnectedCallback');
    }
    disconnectCycle2(){
      this.hideGrandChild2 = !this.hideGrandChild2; 
      //console.log('@@@@@ I am in LifeCycle(Cycle2) DisconnectedCallback');
    }
    disconnectCycle3(){
      this.hideGrandChild3 = !this.hideGrandChild3; 
      //console.log('@@@@@ I am in LifeCycle(Cycle3) DisconnectedCallback');
    }
    errorCallback(error) 
    {
        this.errors = error;
        alert(this.errors);
    }
}