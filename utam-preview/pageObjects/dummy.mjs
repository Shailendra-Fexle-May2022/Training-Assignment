
import { By as _By, createUtamMixinCtor as _createUtamMixinCtor, UtamBaseRootPageObject as _UtamBaseRootPageObject } from '@utam/core';



/**
 * generated from JSON src/portal/dummy.utam.json
 * @version 2023-05-07T10:59:20.804Z
 * @author UTAM
 */
export default class Dummy extends _UtamBaseRootPageObject {
    constructor(driver, element, locator = _By.css("notexisting")) {
        super(driver, element, locator);
    }

    async __getRoot() {
        const driver = this.driver;
        const root = await this.getRootElement();
        const BaseUtamElement = _createUtamMixinCtor();
        return new BaseUtamElement(driver, root);
    }
    
}