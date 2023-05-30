
import { Driver as _Driver, Element as _Element, Locator as _Locator, UtamBasePageObject as _UtamBasePageObject } from '@utam/core';
import _FormattedRichText from 'utam-generator/pageObjects/formattedRichText';

/**
 * Page Object: text
 * generated from JSON __generated__/text.utam.json
 * @version 2023-04-26T16:07:59.157Z
 * @author my team
 */
export default class Text extends _UtamBasePageObject {
    constructor(driver: _Driver, element?: _Element, locator?: _Locator);
    getFormattedRichText(): Promise<_FormattedRichText>;
}