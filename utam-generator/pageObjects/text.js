
'use strict';

var core = require('@utam/core');
var _FormattedRichText = require('utam-generator/pageObjects/formattedRichText');

function _interopDefaultLegacy (e) { return e && typeof e === 'object' && 'default' in e ? e : { 'default': e }; }

var _FormattedRichText__default = /*#__PURE__*/_interopDefaultLegacy(_FormattedRichText);

async function _utam_get_formattedRichText(driver, root) {
    let _element = root;
    const _locator = core.By.css("lightning-formatted-rich-text");
    _element = new core.ShadowRoot(driver, _element);
    return _element.findElement(_locator);
}

/**
 * Page Object: text
 * generated from JSON __generated__/text.utam.json
 * @version 2023-04-26T16:07:59.157Z
 * @author my team
 */
class Text extends core.UtamBasePageObject {
    constructor(driver, element, locator) {
        super(driver, element, locator);
    }

    async __getRoot() {
        const driver = this.driver;
        const root = await this.getRootElement();
        const BaseUtamElement = core.createUtamMixinCtor();
        return new BaseUtamElement(driver, root);
    }
    
    async getFormattedRichText() {
        const driver = this.driver;
        const root = await this.getRootElement();
        let element = await _utam_get_formattedRichText(driver, root);
        element = await core.createInstance(_FormattedRichText__default["default"], driver, element);
        await element.__beforeLoad__();
        return element;
    }
    
}

module.exports = Text;
