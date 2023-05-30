
import { By as _By, ShadowRoot as _ShadowRoot, createUtamMixinCtor as _createUtamMixinCtor, UtamBasePageObject as _UtamBasePageObject } from '@utam/core';

async function _utam_get_title(driver, root) {
    let _element = root;
    const _locator = _By.css(".slds-image__title");
    _element = new _ShadowRoot(driver, _element);
    return _element.findElement(_locator);
}

async function _utam_get_titleText(driver, root) {
    let _element = await _utam_get_title(driver, root);
    const _locator = _By.css(".slds-image__text");
    return _element.findElement(_locator);
}

/**
 * Page Object: image
 * generated from JSON __generated__/image.utam.json
 * @version 2023-04-26T16:07:59.130Z
 * @author my team
 */
export default class Image extends _UtamBasePageObject {
    constructor(driver, element, locator) {
        super(driver, element, locator);
    }

    async __getRoot() {
        const driver = this.driver;
        const root = await this.getRootElement();
        const BaseUtamElement = _createUtamMixinCtor();
        return new BaseUtamElement(driver, root);
    }
    
    async __getTitle() {
        const driver = this.driver;
        const root = await this.getRootElement();
        const BaseUtamElement = _createUtamMixinCtor();
        let element = await _utam_get_title(driver, root);
        element = new BaseUtamElement(driver, element);
        return element;
    }
    
    async __getTitleText() {
        const driver = this.driver;
        const root = await this.getRootElement();
        const BaseUtamElement = _createUtamMixinCtor();
        let element = await _utam_get_titleText(driver, root);
        element = new BaseUtamElement(driver, element);
        return element;
    }
    
    /**
     * method getTitleTextContent
     * get text for my field
     */
    async getTitleTextContent() {
        const _statement0 = await this.__getTitleText();
        const _result0 = await _statement0.getText();
        return _result0;
    }
    
}