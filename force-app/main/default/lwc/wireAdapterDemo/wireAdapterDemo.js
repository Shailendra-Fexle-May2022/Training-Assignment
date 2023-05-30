/**
*
*  Purpose          :   Class to import account field through reference.
*
*  Created Date     :   06/12/2022
*
*  Created By       :   Shailendra Sharma
*
*  Revision Logs    :   V_1.0 - Created
*
**/
import { LightningElement, api, wire } from 'lwc';
import { getRecord, getFiledValue } from "lightning/uiRecordApi";
//import NAME_FIELD from "@salesforce/schema/Account.Name";
//import PHONE_FIELD from "@salesforce/schema/Account.Phone";
/*const FIELDS{
    'Account.Name',
    'Account.Phone',
}*/
export default class WireAdapterDemo extends LightningElement {
    @api recordId;

    //@wire(getRecord, {recordId:'$recordId', fields: [NAME_FIELD, PHONE_FIELD]})
    //@wire(getRecord, {recordId:'$recordId', fields: FIELDS})
    @wire(getRecord, {recordId:'$recordId', fields: ['Account.Name', 'Account.Phone']})
   
    record; // data/error

    get Name(){

       // return this.record.data ? getFiledValue(this.record.data, NAME_FIELD): '';
       return this.record.data ? getFiledValue(this.record.data, 'Account.Name') : '';

    }

    get Phone(){

        // return this.record.data ? getFiledValue(this.record.data, PHONE_FIELD): '';
        return this.record.data ? getFiledValue(this.record.data, 'Account.Phone') : '';
    }
}