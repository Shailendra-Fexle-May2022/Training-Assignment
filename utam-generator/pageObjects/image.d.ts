
import { Driver as _Driver, Element as _Element, Locator as _Locator, UtamBasePageObject as _UtamBasePageObject } from '@utam/core';

/**
 * Page Object: image
 * generated from JSON __generated__/image.utam.json
 * @version 2023-04-26T16:07:59.130Z
 * @author my team
 */
export default class Image extends _UtamBasePageObject {
    constructor(driver: _Driver, element?: _Element, locator?: _Locator);
    /**
     * method getTitleTextContent
     * get text for my field
     */
    getTitleTextContent(): Promise<string>;
    
}