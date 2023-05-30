
import { Driver as _Driver, Element as _Element, Locator as _Locator, UtamBasePageObject as _UtamBasePageObject } from '@utam/core';
import _Icon from 'utam-generator/pageObjects/icon';

/**
 * Page Object: icon
 * generated from JSON __generated__/icon.utam.json
 * @version 2023-04-26T16:07:59.116Z
 * @author my team
 */
export default class Icon extends _UtamBasePageObject {
    constructor(driver: _Driver, element?: _Element, locator?: _Locator);
    getIcon(): Promise<_Icon>;
}