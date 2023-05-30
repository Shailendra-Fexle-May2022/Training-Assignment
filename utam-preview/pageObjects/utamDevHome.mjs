
import { By as _By, createUtamMixinCtor as _createUtamMixinCtor, UtamBaseRootPageObject as _UtamBaseRootPageObject, ClickableUtamElement as _ClickableUtamElement } from '@utam/core';

async function _utam_get_persistentHeader(driver, root) {
    let _element = root;
    const _locator = _By.css("header");
    return _element.findElement(_locator);
}

async function _utam_get_menu(driver, root) {
    let _element = await _utam_get_persistentHeader(driver, root);
    const _locator = _By.css(".menu");
    return _element.findElement(_locator);
}

async function _utam_get_grammarMenuItem(driver, root) {
    let _element = await _utam_get_menu(driver, root);
    const _locator = _By.css("[data-navbar-id='grammar']");
    return _element.findElement(_locator);
}

async function _utam_get_menuItemss(driver, root) {
    let _element = await _utam_get_menu(driver, root);
    const _locator = _By.css("li");
    return _element.findElements(_locator);
}

async function _utam_get_content(driver, root) {
    let _element = root;
    const _locator = _By.css("main.content");
    return _element.findElement(_locator);
}

/**
 * generated from JSON src/portal/utamDevHome.utam.json
 * @version 2023-04-26T16:07:56.618Z
 * @author UTAM
 */
export default class UtamDevHome extends _UtamBaseRootPageObject {
    constructor(driver, element, locator = _By.css("body")) {
        super(driver, element, locator);
    }

    async __getRoot() {
        const driver = this.driver;
        const root = await this.getRootElement();
        const BaseUtamElement = _createUtamMixinCtor();
        return new BaseUtamElement(driver, root);
    }
    
    async __getPersistentHeader() {
        const driver = this.driver;
        const root = await this.getRootElement();
        const BaseUtamElement = _createUtamMixinCtor();
        let element = await _utam_get_persistentHeader(driver, root);
        element = new BaseUtamElement(driver, element);
        return element;
    }
    
    async __getMenu() {
        const driver = this.driver;
        const root = await this.getRootElement();
        const BaseUtamElement = _createUtamMixinCtor();
        let element = await _utam_get_menu(driver, root);
        element = new BaseUtamElement(driver, element);
        return element;
    }
    
    async getGrammarMenuItem() {
        const driver = this.driver;
        const root = await this.getRootElement();
        const ClickableUtamElement = _createUtamMixinCtor(_ClickableUtamElement);
        let element = await _utam_get_grammarMenuItem(driver, root);
        element = new ClickableUtamElement(driver, element);
        return element;
    }
    
    async getMenuItems() {
        const driver = this.driver;
        const root = await this.getRootElement();
        const ClickableUtamElement = _createUtamMixinCtor(_ClickableUtamElement);
        let elements = await _utam_get_menuItemss(driver, root);
        elements = elements.map(function _createElement(element) {
                    return new ClickableUtamElement(driver, element);
                });
        return elements;
    }
    
    async getContent() {
        const driver = this.driver;
        const root = await this.getRootElement();
        const BaseUtamElement = _createUtamMixinCtor();
        let element = await _utam_get_content(driver, root);
        element = new BaseUtamElement(driver, element);
        return element;
    }
    
}