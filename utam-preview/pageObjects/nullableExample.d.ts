
import { Driver as _Driver, Element as _Element, Locator as _Locator, BaseUtamElement as _BaseUtamElement, UtamBaseRootPageObject as _UtamBaseRootPageObject } from '@utam/core';
import _Dummy from 'utam-preview/pageObjects/dummy';

/**
 * generated from JSON src/portal/nullableExample.utam.json
 * @version 2023-05-07T10:59:20.878Z
 * @author UTAM
 */
export default class NullableExample extends _UtamBaseRootPageObject {
    constructor(driver: _Driver, element?: _Element, locator?: _Locator);
    getNullableBasicElement(): Promise<(_BaseUtamElement) | null>;
    getScopedInsideNullable(): Promise<(_BaseUtamElement) | null>;
    getNullableBasicElementList(): Promise<(_BaseUtamElement)[] | null>;
    getNullableCustomElement(): Promise<_Dummy | null>;
    getNullableCustomElementList(): Promise<_Dummy[] | null>;
}