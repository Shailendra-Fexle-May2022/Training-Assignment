
'use strict';

var core = require('@utam/core');

/**
 * generated from JSON src/portal/dummy.utam.json
 * @version 2023-05-07T10:59:20.804Z
 * @author UTAM
 */
class Dummy extends core.UtamBaseRootPageObject {
    constructor(driver, element, locator = core.By.css("notexisting")) {
        super(driver, element, locator);
    }

    async __getRoot() {
        const driver = this.driver;
        const root = await this.getRootElement();
        const BaseUtamElement = core.createUtamMixinCtor();
        return new BaseUtamElement(driver, root);
    }
    
}

module.exports = Dummy;
