/*
*
*  Purpose          :  Main JS File for binding apex class method.
*
*  Created Date     :  	06/11/2022
*
*  Created By       :  	Shailendra Sharma
*
*  Revision Logs    :  	V_1.0 - Created - 06/11/2022
*
*/
// import module elements
import { LightningElement, wire, track } from 'lwc';

//import method from the Apex Class
import fetchAccounts from '@salesforce/apex/RecordCreationController.fetchAccountRecords';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class ArrangeRecordInTabluarForm extends LightningElement {

    myTitle = 'Hello Guys!';

    handleClick(){
        this.showToast(this.myTitle);
    }

    showToast(firstArgument){
        const event = new ShowToastEvent({
            title: firstArgument,
            message:'Want to display Toast Demo',
            variant: 'success'
        })
        this.dispatchEvent(event);
    }

}