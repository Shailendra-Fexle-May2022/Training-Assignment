
import { By as _By, ShadowRoot as _ShadowRoot, createUtamMixinCtor as _createUtamMixinCtor, createInstance as _createInstance, UtamBasePageObject as _UtamBasePageObject } from '@utam/core';
import _FormattedRichText from 'utam-generator/pageObjects/formattedRichText';

async function _utam_get_formattedRichText(driver, root) {
    let _element = root;
    const _locator = _By.css("lightning-formatted-rich-text");
    _element = new _ShadowRoot(driver, _element);
    return _element.findElement(_locator);
}

/**
 * Page Object: text
 * generated from JSON __generated__/text.utam.json
 * @version 2023-04-26T16:07:59.157Z
 * @author my team
 */
export default class Text extends _UtamBasePageObject {
    constructor(driver, element, locator) {
        super(driver, element, locator);
    }

    async __getRoot() {
        const driver = this.driver;
        const root = await this.getRootElement();
        const BaseUtamElement = _createUtamMixinCtor();
        return new BaseUtamElement(driver, root);
    }
    
    async getFormattedRichText() {
        const driver = this.driver;
        const root = await this.getRootElement();
        let element = await _utam_get_formattedRichText(driver, root);
        element = await _createInstance(_FormattedRichText, driver, element);
        await element.__beforeLoad__();
        return element;
    }
    
}