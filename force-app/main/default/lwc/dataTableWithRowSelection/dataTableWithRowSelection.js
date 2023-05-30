import { LightningElement, track, api } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContactsList';

const item = [
    {label : 'Contact Name', fieldName : 'FirstName'},
    {label : 'Phone Number', fieldName : 'Phone'}
];
export default class DataTableWithRowSelection extends LightningElement {

    @track onClickedButtonLabel = 'Show Contacts';
    columnsList = item;
    @track cardVisible = false;
    @api recordId; // it store the current page recordId
    @track data =[];
    @track error;
    @api searchKey = '';

    //get related list of contact from apex class
    connectedCallback() {

        //calling apex method
        getContacts({lwcRecordId : this.recordId})
            .then(result =>{
                this.data = result;
            })
            .catch(error =>{
                this.error = error;
            });
    }

    //serach functionality
    handleChanged(event){
        this.searchKey = event.target.value;

        //send searchKey and recordId to apex method

        getContacts({searchKeys : this.searchKey, lwcRecordId : this.recordId })
            .then(result =>{
                    this.data = result;
                })
                .catch(error =>{
                    this.error = error;
                });

    }

    //show/hide button toggle functionality
    handleClick(event){

        const label = event.target.label;

        if(Object.is(label,'Show Contacts')){
            this.onClickedButtonLabel = 'Hide Contacts';
            this.cardVisible = true;
        }
        else if(Object.is(label,'Hide Contacts')){
            this.onClickedButtonLabel = 'Show Contacts';
            this.cardVisible = false;
        }
    }

    //get details of selected row 
    getSelectedRows(event){
        const selectedRowDetails = event.detail.selectedRows;
        alert(JSON.stringify(selectedRowDetails));
    }
}