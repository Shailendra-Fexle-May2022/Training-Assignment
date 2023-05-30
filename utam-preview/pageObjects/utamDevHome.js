
'use strict';

var core = require('@utam/core');

async function _utam_get_persistentHeader(driver, root) {
    let _element = root;
    const _locator = core.By.css("header");
    return _element.findElement(_locator);
}

async function _utam_get_menu(driver, root) {
    let _element = await _utam_get_persistentHeader(driver, root);
    const _locator = core.By.css(".menu");
    return _element.findElement(_locator);
}

async function _utam_get_grammarMenuItem(driver, root) {
    let _element = await _utam_get_menu(driver, root);
    const _locator = core.By.css("[data-navbar-id='grammar']");
    return _element.findElement(_locator);
}

async function _utam_get_menuItemss(driver, root) {
    let _element = await _utam_get_menu(driver, root);
    const _locator = core.By.css("li");
    return _element.findElements(_locator);
}

async function _utam_get_content(driver, root) {
    let _element = root;
    const _locator = core.By.css("main.content");
    return _element.findElement(_locator);
}

/**
 * generated from JSON src/portal/utamDevHome.utam.json
 * @version 2023-04-26T16:07:56.618Z
 * @author UTAM
 */
class UtamDevHome extends core.UtamBaseRootPageObject {
    constructor(driver, element, locator = core.By.css("body")) {
        super(driver, element, locator);
    }

    async __getRoot() {
        const driver = this.driver;
        const root = await this.getRootElement();
        const BaseUtamElement = core.createUtamMixinCtor();
        return new BaseUtamElement(driver, root);
    }
    
    async __getPersistentHeader() {
        const driver = this.driver;
        const root = await this.getRootElement();
        const BaseUtamElement = core.createUtamMixinCtor();
        let element = await _utam_get_persistentHeader(driver, root);
        element = new BaseUtamElement(driver, element);
        return element;
    }
    
    async __getMenu() {
        const driver = this.driver;
        const root = await this.getRootElement();
        const BaseUtamElement = core.createUtamMixinCtor();
        let element = await _utam_get_menu(driver, root);
        element = new BaseUtamElement(driver, element);
        return element;
    }
    
    async getGrammarMenuItem() {
        const driver = this.driver;
        const root = await this.getRootElement();
        const ClickableUtamElement = core.createUtamMixinCtor(core.ClickableUtamElement);
        let element = await _utam_get_grammarMenuItem(driver, root);
        element = new ClickableUtamElement(driver, element);
        return element;
    }
    
    async getMenuItems() {
        const driver = this.driver;
        const root = await this.getRootElement();
        const ClickableUtamElement = core.createUtamMixinCtor(core.ClickableUtamElement);
        let elements = await _utam_get_menuItemss(driver, root);
        elements = elements.map(function _createElement(element) {
                    return new ClickableUtamElement(driver, element);
                });
        return elements;
    }
    
    async getContent() {
        const driver = this.driver;
        const root = await this.getRootElement();
        const BaseUtamElement = core.createUtamMixinCtor();
        let element = await _utam_get_content(driver, root);
        element = new BaseUtamElement(driver, element);
        return element;
    }
    
}

module.exports = UtamDevHome;
