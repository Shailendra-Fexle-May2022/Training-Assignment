
import { By as _By, createUtamMixinCtor as _createUtamMixinCtor, createInstance as _createInstance, UtamBaseRootPageObject as _UtamBaseRootPageObject } from '@utam/core';
import _Dummy from 'utam-preview/pageObjects/dummy';

async function _utam_get_nullableBasicElement(driver, root) {
    let _element = root;
    const _locator = _By.css(".idontexist");
    const hasElement = await _element.containsElement(_locator);
    if (!hasElement) { return null; }
    return _element.findElement(_locator);
}

async function _utam_get_scopedInsideNullable(driver, root) {
    let _element = await _utam_get_nullableBasicElement(driver, root);
    if (!_element) { return null; }
    const _locator = _By.css(".idontexist");
    const hasElement = await _element.containsElement(_locator);
    if (!hasElement) { return null; }
    return _element.findElement(_locator);
}

async function _utam_get_nullableBasicElementLists(driver, root) {
    let _element = root;
    const _locator = _By.css(".idontexist");
    const hasElement = await _element.containsElement(_locator);
    if (!hasElement) { return null; }
    return _element.findElements(_locator);
}

async function _utam_get_nullableCustomElement(driver, root) {
    let _element = root;
    const _locator = _By.css(".idontexist");
    const hasElement = await _element.containsElement(_locator);
    if (!hasElement) { return null; }
    return _element.findElement(_locator);
}

async function _utam_get_nullableCustomElementLists(driver, root) {
    let _element = root;
    const _locator = _By.css(".idontexist");
    const hasElement = await _element.containsElement(_locator);
    if (!hasElement) { return null; }
    return _element.findElements(_locator);
}

/**
 * generated from JSON src/portal/nullableExample.utam.json
 * @version 2023-05-07T10:59:20.878Z
 * @author UTAM
 */
export default class NullableExample extends _UtamBaseRootPageObject {
    constructor(driver, element, locator = _By.css("body")) {
        super(driver, element, locator);
    }

    async __getRoot() {
        const driver = this.driver;
        const root = await this.getRootElement();
        const BaseUtamElement = _createUtamMixinCtor();
        return new BaseUtamElement(driver, root);
    }
    
    async getNullableBasicElement() {
        const driver = this.driver;
        const root = await this.getRootElement();
        const BaseUtamElement = _createUtamMixinCtor();
        let element = await _utam_get_nullableBasicElement(driver, root);
        if (!element) { return null; }
        element = new BaseUtamElement(driver, element);
        return element;
    }
    
    async getScopedInsideNullable() {
        const driver = this.driver;
        const root = await this.getRootElement();
        const BaseUtamElement = _createUtamMixinCtor();
        let element = await _utam_get_scopedInsideNullable(driver, root);
        if (!element) { return null; }
        element = new BaseUtamElement(driver, element);
        return element;
    }
    
    async getNullableBasicElementList() {
        const driver = this.driver;
        const root = await this.getRootElement();
        const BaseUtamElement = _createUtamMixinCtor();
        let elements = await _utam_get_nullableBasicElementLists(driver, root);
        if (!elements) { return null; }
        elements = elements.map(function _createElement(element) {
                    return new BaseUtamElement(driver, element);
                });
        return elements;
    }
    
    async getNullableCustomElement() {
        const driver = this.driver;
        const root = await this.getRootElement();
        let element = await _utam_get_nullableCustomElement(driver, root);
        if (!element) { return null; }
        element = await _createInstance(_Dummy, driver, element);
        await element.__beforeLoad__();
        return element;
    }
    
    async getNullableCustomElementList() {
        const driver = this.driver;
        const root = await this.getRootElement();
        let elements = await _utam_get_nullableCustomElementLists(driver, root);
        if (!elements) { return null; }
        elements = await Promise.all(elements.map(function _createElement(element) {
                    return _createInstance(_Dummy, driver, element);
                }));
        await Promise.all(elements.map(el => el.__beforeLoad__()));
        return elements;
    }
    
}