/*
*
*  Purpose          :	LWC component to display Data Grid - Content - JS file.
*
*  Created Date     :  	12/12/2022
*
*  Created By       :  	Shailendra Sharma
*
*  Revision Logs    :  	V_1.0 - Created - 12/12/2022
*
*/
import { LightningElement, api, track } from 'lwc';

export default class DataGridContent extends LightningElement 
{
    //Public Properties
    @api flexipageRegionWidth;
    @api objectName;
    @api fieldsName;
    @api limitValue;
    
    //State variable to control rendering the HTML markup
    @track state =
    {
        initDone : false
    }

    connectedCallback() 
    {
        this.state.initDone = true;
    }
}