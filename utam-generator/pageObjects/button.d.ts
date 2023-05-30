
import { Driver as _Driver, Element as _Element, Locator as _Locator, UtamBasePageObject as _UtamBasePageObject } from '@utam/core';
import _Button from 'utam-generator/pageObjects/button';

/**
 * Page Object: button
 * generated from JSON __generated__/button.utam.json
 * @version 2023-04-26T16:07:59.059Z
 * @author my team
 */
export default class Button extends _UtamBasePageObject {
    constructor(driver: _Driver, element?: _Element, locator?: _Locator);
    getButton(): Promise<_Button>;
}