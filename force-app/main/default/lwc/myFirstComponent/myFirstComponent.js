/*
*
*  Purpose          :	My First LWC Component - Main JS File
*
*  Created Date     :  	06/11/2022
*
*  Created By       :  	Shailendra Sharma
*
*  Revision Logs    :  	V_1.0 - Created - 06/11/2022
*
*/
import { LightningElement, api } from 'lwc';

export default class MyFirstComponent extends LightningElement {

    @api myObjectName = 'Account';
    localObjectName = '';

    //Constructor to reuse the properties of class
    connectedCallback() 
    {
        this.localObjectName = 'Click Here - ' + this.myObjectName ;
    }
}