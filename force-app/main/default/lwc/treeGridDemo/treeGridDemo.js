import { LightningElement, track } from 'lwc';
import doRecordsQuery from '@salesforce/apex/AccountController.getAccountRelatedList';
export default class TreeGridDemo extends LightningElement {

    @track gridColumns = [
        {
            type:'text',
            fieldName:'Name',
            label:'Name'
        },
        {
            type:'text',
            fieldName:'FirstName',
            label:'First Name'
        },
        {
            type:'text',
            fieldName:'LastName',
            label:'Last Name'
        },
    ];

    
    @track gridData;

     connectedCallback(){

         //imperative method
        doRecordsQuery()
        .then(result =>{

            //console.log('@@@Result'+JSON.stringify(result));

            //clone of received object
            var tempContact = JSON.parse(JSON.stringify(result));
            //console.log('@@@tempContact'+JSON.stringify(tempContact));
            
            for(var i=0; i<=tempContact.length; i++){

                var newContact = tempContact[i]['Contacts'];
                console.log('@@@newContact'+JSON.stringify(newContact)); 
              
                if(newContact){

                    tempContact[i]._children = newContact;
                    console.log('@@@tempContact[i]._children'+JSON.stringify(tempContact[i]._children)); 

                    delete tempContact[i].Contacts;
                }
            }
            this.gridData = tempContact;
            console.log('@@@gridData'+JSON.stringify(this.gridData)); 
        })
        .catch(error =>{
            console.error('@@@Error'+ JSON.stringify(error));
        });
    }
    getSelectedRows(event){

        const selectedRows = event.detail.selectedRows;
        for(var i=0;i<=selectedRows.length; i++){
        console.log('First Name:'+ selectedRows[i].FirstName);
        console.log('Last Name:'+ selectedRows[i].LastName);
        }
    }
}