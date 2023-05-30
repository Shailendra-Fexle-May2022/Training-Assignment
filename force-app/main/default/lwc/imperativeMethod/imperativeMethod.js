/**
*
*  Purpose          :   Class to import contact field using apex class method.
*
*  Created Date     :   14/12/2022
*
*  Created By       :   Shailendra Sharma
*
*  Revision Logs    :   V_1.0 - Created
*
**/
import { LightningElement, wire, track} from 'lwc';
import getContactsList from '@salesforce/apex/ContactController.getContacts';
const items = [
    {label : "Contact Name", fieldName : "FirstName"},
    {label : "Contact Record Id", fieldName : "Id"}
];
export default class ImperativeMethod extends LightningElement {
    
    @track data =[];
    @track columns = items;
    @track error;
    @track onClickedButtonLabel = "Show";
    @track cardVisible = false;
    myName = "Shaielndra Sharma";
    
    @wire(getContactsList)
    records;
    
    fillDataTable(){
        getContactsList()
            .then(result =>{
                this.data = result;
            })
            .catch(error =>{
                this.error = error;
            });
    }

    handleOnClicked(event){
        const label = event.target.label;

        if(Object.is(label, "Show")){
            this.onClickedButtonLabel = "Hide";
            this.cardVisible = true;
        }
        else if(Object.is(label, "Hide")){
            this.onClickedButtonLabel = "Show";
            this.cardVisible = false;
        }
    }

   

}