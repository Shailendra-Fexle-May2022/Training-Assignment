
import { Driver as _Driver, Element as _Element, Locator as _Locator, BaseUtamElement as _BaseUtamElement, UtamBaseRootPageObject as _UtamBaseRootPageObject, ClickableUtamElement as _ClickableUtamElement } from '@utam/core';

/**
 * generated from JSON src/portal/utamDevHome.utam.json
 * @version 2023-04-26T16:07:56.618Z
 * @author UTAM
 */
export default class UtamDevHome extends _UtamBaseRootPageObject {
    constructor(driver: _Driver, element?: _Element, locator?: _Locator);
    getGrammarMenuItem(): Promise<(_BaseUtamElement & _ClickableUtamElement)>;
    getMenuItems(): Promise<(_BaseUtamElement & _ClickableUtamElement)[]>;
    getContent(): Promise<(_BaseUtamElement)>;
}