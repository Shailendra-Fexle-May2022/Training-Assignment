/**
*
*  Purpose          :   Class to import contact field using apex class method.
*
*  Created Date     :   06/12/2022
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
export default class WireApexDemo extends LightningElement {
    
    @track data =[];
    @track columns = items;

   @wire(getContactsList)
    contactsRecord({data, error}){ //data/error
        if(data){
            this.data = data;
        }
        else if(error){
            console.log("There is undefined error");
        }
    } 
}