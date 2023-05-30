import { LightningElement, api} from 'lwc';

export default class ChildComponent extends LightningElement {

    @api myTitle = "Child";

    @api handleChangeValue(){

        this.myTitle = "Parent to Child Component"
    }
}