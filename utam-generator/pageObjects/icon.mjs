
import { By as _By, ShadowRoot as _ShadowRoot, createUtamMixinCtor as _createUtamMixinCtor, createInstance as _createInstance, UtamBasePageObject as _UtamBasePageObject } from '@utam/core';
import _Icon from 'utam-generator/pageObjects/icon';

async function _utam_get_icon(driver, root) {
    let _element = root;
    const _locator = _By.css("lightning-icon");
    _element = new _ShadowRoot(driver, _element);
    return _element.findElement(_locator);
}

/**
 * Page Object: icon
 * generated from JSON __generated__/icon.utam.json
 * @version 2023-04-26T16:07:59.116Z
 * @author my team
 */
export default class Icon extends _UtamBasePageObject {
    constructor(driver, element, locator) {
        super(driver, element, locator);
    }

    async __getRoot() {
        const driver = this.driver;
        const root = await this.getRootElement();
        const BaseUtamElement = _createUtamMixinCtor();
        return new BaseUtamElement(driver, root);
    }
    
    async getIcon() {
        const driver = this.driver;
        const root = await this.getRootElement();
        let element = await _utam_get_icon(driver, root);
        element = await _createInstance(_Icon, driver, element);
        await element.__beforeLoad__();
        return element;
    }
    
}