import { createElement } from 'lwc';
import MyFirstComponent from 'c/myFirstComponent';

describe('message', () => {

    beforeEach(() =>{
         const element = createElement('c-my-first-component', 
         {
             is: MyFirstComponent
         });
         document.body.appendChild(element);
    })
   
    it('TODO: test case generated by CLI command, please fill in test logic', () =>
    {
         const element = document.querySelector('c-my-first-component');
        const pTag = element.shadowRoot.querySelector('.clickhere');
        expect(pTag.textContext).toBe('Slaesforce');
    });
});