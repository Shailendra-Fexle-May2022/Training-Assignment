
'use strict';

var core = require('@utam/core');
var _Icon = require('utam-generator/pageObjects/icon');

function _interopDefaultLegacy (e) { return e && typeof e === 'object' && 'default' in e ? e : { 'default': e }; }

var _Icon__default = /*#__PURE__*/_interopDefaultLegacy(_Icon);

async function _utam_get_icon(driver, root) {
    let _element = root;
    const _locator = core.By.css("lightning-icon");
    _element = new core.ShadowRoot(driver, _element);
    return _element.findElement(_locator);
}

/**
 * Page Object: icon
 * generated from JSON __generated__/icon.utam.json
 * @version 2023-04-26T16:07:59.116Z
 * @author my team
 */
class Icon extends core.UtamBasePageObject {
    constructor(driver, element, locator) {
        super(driver, element, locator);
    }

    async __getRoot() {
        const driver = this.driver;
        const root = await this.getRootElement();
        const BaseUtamElement = core.createUtamMixinCtor();
        return new BaseUtamElement(driver, root);
    }
    
    async getIcon() {
        const driver = this.driver;
        const root = await this.getRootElement();
        let element = await _utam_get_icon(driver, root);
        element = await core.createInstance(_Icon__default["default"], driver, element);
        await element.__beforeLoad__();
        return element;
    }
    
}

module.exports = Icon;
