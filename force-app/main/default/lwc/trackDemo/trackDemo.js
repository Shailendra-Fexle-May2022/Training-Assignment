import { LightningElement,track } from 'lwc';

export default class TrackDemo extends LightningElement {

    @track fullName = 
    {
        firstName:"",
        lastName: ""
    };
    
    changeHandler(event)
    {

        const field = event.target.name;

        if(Object.is(field, 'firstName'))
        {
            this.fullName.firstName = event.target.value;
        }
        else if(Object.is(field, 'lastName'))
        {
            this.fullName.lastName = event.target.value;
        }   
    }   
}