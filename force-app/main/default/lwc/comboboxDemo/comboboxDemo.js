import { LightningElement, track } from 'lwc';
import getAccountList from '@salesforce/apex/ContactController.getAccountDetails';
import getContactList from '@salesforce/apex/ContactController.getRelatedContacts';
const coloumn = [
    {label : 'Contact Name', fieldName : 'FirstName'},
    {label : 'Phone Number', fieldName : 'Phone'}   
    ];
export default class ComboboxDemo extends LightningElement {
    @track value = '';
    @track accOption = [];
    @track data = [];
    @track columnsList = coloumn;
    @track cardVisible = false;
    @track error = '';
    get option(){
      return this.accOption;  
    }

    connectedCallback() {
        getAccountList()
            .then(result =>{
                let arr = [];

                for(let element of result){
                    arr.push({label : element.Name, value : element.Id});
                }
                /*for(var i=0;i<result.length;i++){
                    arr.push({label : result[i].Name, value : result[i].Id});
                }*/
                
                this.accOption = arr;
               
            })
    }

    handleChange(event){
        this.cardVisible = true;
        this.value = event.detail.value;
        
        getContactList({selectedAccountId : this.value})
        .then(result =>{
            this.data = result;
        })
        .catch(error =>{
            this.error = error;
        })
    } 
}