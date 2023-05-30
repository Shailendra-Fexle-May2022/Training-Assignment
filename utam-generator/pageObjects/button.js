
'use strict';

var core = require('@utam/core');
var _Button = require('utam-generator/pageObjects/button');

function _interopDefaultLegacy (e) { return e && typeof e === 'object' && 'default' in e ? e : { 'default': e }; }

var _Button__default = /*#__PURE__*/_interopDefaultLegacy(_Button);

async function _utam_get_button(driver, root) {
    let _element = root;
    const _locator = core.By.css("lightning-button");
    _element = new core.ShadowRoot(driver, _element);
    return _element.findElement(_locator);
}

/**
 * Page Object: button
 * generated from JSON __generated__/button.utam.json
 * @version 2023-04-26T16:07:59.059Z
 * @author my team
 */
class Button extends core.UtamBasePageObject {
    constructor(driver, element, locator) {
        super(driver, element, locator);
    }

    async __getRoot() {
        const driver = this.driver;
        const root = await this.getRootElement();
        const BaseUtamElement = core.createUtamMixinCtor();
        return new BaseUtamElement(driver, root);
    }
    
    async getButton() {
        const driver = this.driver;
        const root = await this.getRootElement();
        let element = await _utam_get_button(driver, root);
        element = await core.createInstance(_Button__default["default"], driver, element);
        await element.__beforeLoad__();
        return element;
    }
    
}

module.exports = Button;
