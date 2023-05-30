import { LightningElement, track } from 'lwc';

export default class EventPracticeDemo extends LightningElement {

  @track greeting = 'Hello World';

  changeHandler(event) {
    this.greeting = event.target.value;
  }

}