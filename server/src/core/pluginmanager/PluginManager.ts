import ErrorException from "@ungate/plugininf/lib/errors/ErrorException";
import ErrorGate from "@ungate/plugininf/lib/errors/ErrorGate";
import IContextPlugin from "@ungate/plugininf/lib/IContextPlugin";
import IEvents from "@ungate/plugininf/lib/IEvents";
import IPlugin from "@ungate/plugininf/lib/IPlugin";
import IProvider from "@ungate/plugininf/lib/IProvider";
import IScheduler from "@ungate/plugininf/lib/IScheduler";
import Logger from "@ungate/plugininf/lib/Logger";
import NullAuthProvider from "@ungate/plugininf/lib/NullAuthProvider";
import * as fs from "fs";
import Constants from "../Constants";
import IPluginConfig from "../property/IPluginConfig";
import Property from "../property/Property";
const logger = Logger.getLogger("PluginManager");

interface IPluginM extends IPluginConfig {
    plugin: IPlugin;
}

let GatePluginsClass = {};
let GateProviderClass = {};
let GateContextClass = {};
let GateSchedulersClass = {};
let GateEventsClass = {};
let GateProvider: {
    [key: string]: IProvider;
} = {};
let GatePlugins: IPluginM[] = [];
let GateContext: {
    [key: string]: IContextPlugin;
} = {};
const GateEvents: {
    [key: string]: IEvents;
} = {};
const GateSchedulers: {
    [key: string]: IScheduler;
} = {};

class PluginManager {
    public initGate() {
        return Promise.all([
            this.resetGateContextClass(),
            this.resetGatePluginsClass(),
            this.resetGateProviderClass(),
            this.resetEventsClass(),
            this.resetSchedulersClass(),
        ]);
    }
    /**
     * Инициализация Планировщика
     */
    public resetSchedulersClass() {
        GateSchedulersClass = {};
        const rows = [];
        if (!fs.existsSync(Constants.SCHEDULER_PLUGIN_DIR)) {
            logger.error(`Нет папки ${Constants.SCHEDULER_PLUGIN_DIR}`);
            return;
        }
        fs.readdirSync(Constants.SCHEDULER_PLUGIN_DIR).forEach((file) => {
            if (
                !fs.existsSync(
                    `${Constants.SCHEDULER_PLUGIN_DIR}/${file}/index.js`,
                )
            ) {
                return;
            }
            const name = file.replace(".js", "").toLowerCase();
            rows.push(
                new Promise((resolve) => {
                    const Class = require(`${Constants.SCHEDULER_PLUGIN_DIR}/${file}`);
                    GateSchedulersClass[name] = Class.default || Class;
                    logger.info(`Найден класс scheduler ${name}`);
                    return resolve();
                }),
            );
        });
        return Promise.all(rows);
    }

    public getGateAllSchedulersClass() {
        return Object.keys(GateSchedulersClass);
    }

    public getGateSchedulerClass(key: string) {
        if (!GateSchedulersClass[key]) {
            throw new ErrorException(
                ErrorGate.compileErrorResult(
                    301,
                    `Specified ${key} plugin not found`,
                ),
            );
        }
        return GateSchedulersClass[key];
    }

    public getGateScheduler(key: string) {
        return GateSchedulers[key];
    }

    public setGateScheduler(key: string, value: IScheduler) {
        GateSchedulers[key] = value;
    }

    public async removeGateScheduler(key: string) {
        await GateSchedulers[key].destroy();
        delete GateSchedulers[key];
        return true;
    }

    /**
     * Инициализация events
     */
    public resetEventsClass() {
        GateEventsClass = {};
        const rows = [];
        if (!fs.existsSync(Constants.EVENT_PLUGIN_DIR)) {
            logger.error(`Нет папки ${Constants.EVENT_PLUGIN_DIR}`);
            return;
        }
        fs.readdirSync(Constants.EVENT_PLUGIN_DIR).forEach((file) => {
            if (
                !fs.existsSync(`${Constants.EVENT_PLUGIN_DIR}/${file}/index.js`)
            ) {
                return;
            }
            const name = file.replace(".js", "").toLowerCase();
            rows.push(
                new Promise((resolve) => {
                    const Class = require(`${Constants.EVENT_PLUGIN_DIR}/${file}`);
                    GateEventsClass[name] = Class.default || Class;
                    logger.info(`Найден класс events ${name}`);
                    return resolve();
                }),
            );
        });
        return Promise.all(rows);
    }

    public getGateAllEventsClass() {
        return Object.keys(GateEventsClass);
    }

    public getGateEventsClass(key: string) {
        if (!GateEventsClass[key]) {
            throw new ErrorException(
                ErrorGate.compileErrorResult(
                    301,
                    `Specified ${key} plugin not found`,
                ),
            );
        }
        return GateEventsClass[key];
    }

    public getGateEvent(key: string) {
        return GateEvents[key];
    }

    public setGateEvent(key: string, value: IEvents) {
        GateEvents[key] = value;
    }

    public async removeGateEvent(key: string) {
        await GateEvents[key].destroy();
        delete GateEvents[key];
        return true;
    }

    /**
     * Инициализация провайдеров данных
     */
    public async resetGateProviderClass() {
        GateProviderClass = {
            admingate: require("../../http/admingate/AdminGate"),
        };
        const rows = [];
        if (!fs.existsSync(Constants.PROVIDER_PLUGIN_DIR)) {
            logger.error(`Нет папки ${Constants.PROVIDER_PLUGIN_DIR}`);
            return;
        }
        fs.readdirSync(Constants.PROVIDER_PLUGIN_DIR).forEach((file) => {
            if (
                !fs.existsSync(
                    `${Constants.PROVIDER_PLUGIN_DIR}/${file}/index.js`,
                )
            ) {
                return;
            }
            const name = file.replace(".js", "").toLowerCase();
            rows.push(
                new Promise((resolve) => {
                    const Class = require(`${Constants.PROVIDER_PLUGIN_DIR}/${file}`);
                    GateProviderClass[name] = Class.default || Class;
                    logger.info(`Найден класс провайдера ${name}`);
                    return resolve();
                }),
            );
        });
        await Promise.all(rows);
        GateProvider = {};
        await this.removeAllGateProvider();
        const db = await Property.getProviders();
        const docs = await db.find();
        const rowsInit = [];
        if (docs) {
            docs.forEach((doc) => {
                if (doc.cl_autoload) {
                    const PluginClass =
                        GateProviderClass[doc.ck_d_plugin.toLowerCase()];
                    if (PluginClass) {
                        GateProvider[doc.ck_id] = new PluginClass(
                            doc.ck_id,
                            doc.cct_params,
                        );
                        rowsInit.push(
                            GateProvider[doc.ck_id].init().then(
                                () => {
                                    logger.info(
                                        `Загружен провайдер ${doc.ck_id}`,
                                    );
                                    return Promise.resolve();
                                },
                                (err) => {
                                    logger.error(err);
                                    return Promise.resolve();
                                },
                            ),
                        );
                    }
                }
            });
        }
        return Promise.all(rowsInit);
    }

    public getGateProviderClass(key: string) {
        if (!GateProviderClass[key]) {
            throw new ErrorException(
                ErrorGate.compileErrorResult(
                    301,
                    `Specified ${key} plugin not found`,
                ),
            );
        }
        return GateProviderClass[key];
    }

    public getGateAllProvidersClass() {
        return Object.keys(GateProviderClass);
    }

    public getGateProvider(key: string): IProvider {
        return GateProvider[key];
    }

    public getGateAuthProviders() {
        return Object.values(GateProvider).filter(
            (provider: NullAuthProvider) => provider.isAuth,
        );
    }
    public getGateProviders() {
        return Object.values(GateProvider) || [];
    }

    public setGateProvider(key: string, value: IProvider) {
        GateProvider[key] = value;
    }

    public async removeGateProvider(key: string) {
        await GateProvider[key].destroy();
        delete GateProvider[key];
        return true;
    }

    public async removeAllGateProvider() {
        const rows = [];
        Object.values(GateProvider).forEach((pl) => {
            rows.push(pl.destroy());
        });
        await Promise.all(rows);
        GateProvider = {};
        return true;
    }

    /**
     * Инициализация плагинов
     */
    public async resetGatePluginsClass() {
        GatePluginsClass = {};
        const rows = [];
        if (!fs.existsSync(Constants.DATA_PLUGIN_DIR)) {
            logger.error(`Нет папки ${Constants.DATA_PLUGIN_DIR}`);
            return;
        }
        fs.readdirSync(Constants.DATA_PLUGIN_DIR).forEach((file) => {
            if (
                !fs.existsSync(`${Constants.DATA_PLUGIN_DIR}/${file}/index.js`)
            ) {
                return;
            }
            const name = file.replace(".js", "").toLowerCase();
            rows.push(
                new Promise((resolve) => {
                    const Class = require(`${Constants.DATA_PLUGIN_DIR}/${file}`);
                    GatePluginsClass[name] = Class.default || Class;
                    logger.info(`Найден класс плагина ${name}`);
                    return resolve();
                }),
            );
        });
        await Promise.all(rows);
        const plugins = GatePlugins;
        GatePlugins = [];
        return Promise.all(plugins.map((conf) => conf.plugin.destroy()));
    }

    public getGateAllPluginsClass() {
        return Object.keys(GatePluginsClass);
    }

    public getGatePluginsClass(key: string) {
        if (!GatePluginsClass[key]) {
            throw new ErrorException(
                ErrorGate.compileErrorResult(
                    301,
                    `Specified ${key} plugin not found`,
                ),
            );
        }
        return GatePluginsClass[key];
    }

    public getGateAllPlugins() {
        return GatePlugins.map((val) => val.plugin);
    }

    public getGatePlugins(names: string[], provider: string): IPlugin[] {
        return GatePlugins.filter(
            (val) =>
                names.includes(val.cv_name) &&
                ["all", provider].includes(val.ck_d_provider),
        ).map((obj) => obj.plugin);
    }

    public getGatePlugin(name: string, provider: string): IPlugin {
        return GatePlugins.filter(
            (val) =>
                name === val.cv_name &&
                ["all", provider].includes(val.ck_d_provider),
        ).map((obj) => obj.plugin)[0];
    }

    public setGatePlugins(obj: IPluginM) {
        GatePlugins.push(obj);
        GatePlugins.sort((val1, val2) => val1.cn_order - val2.cn_order);
    }

    public async removeAllGatePlugins() {
        const rows = [];
        GatePlugins.forEach((pl) => {
            rows.push(pl.plugin.destroy());
        });
        await Promise.all(rows);
        GatePlugins = [];
        return true;
    }
    /**
     * Инициализация плагинов
     */
    public async resetGateContextClass() {
        GateContextClass = {};
        const rows = [];
        if (!fs.existsSync(Constants.CONTEXT_PLUGIN_DIR)) {
            logger.error(`Нет папки ${Constants.CONTEXT_PLUGIN_DIR}`);
            return;
        }
        fs.readdirSync(Constants.CONTEXT_PLUGIN_DIR).forEach((file) => {
            if (
                !fs.existsSync(
                    `${Constants.CONTEXT_PLUGIN_DIR}/${file}/index.js`,
                )
            ) {
                return;
            }
            const name = file.replace(".js", "").toLowerCase();
            rows.push(
                new Promise((resolve) => {
                    const Class = require(`${Constants.CONTEXT_PLUGIN_DIR}/${file}`);
                    GateContextClass[name] = Class.default || Class;
                    logger.info(`Найден класс плагина контекста ${name}`);
                    return resolve();
                }),
            );
        });
        await Promise.all(rows);
        await this.removeAllGateContext();
        const tContext = await Property.getContext();
        const docs = await tContext.find({});
        const rowContext = [];
        if (docs) {
            docs.forEach((doc) => {
                const PluginClass =
                    GateContextClass[doc.ck_d_plugin.toLowerCase()];
                if (PluginClass) {
                    GateContext[doc.ck_id] = new PluginClass(
                        doc.ck_id,
                        doc.cct_params,
                    );
                    rowContext.push(
                        GateContext[doc.ck_id].init().then(
                            () => {
                                logger.info(`Загружен контекст ${doc.ck_id}`);
                                return Promise.resolve();
                            },
                            (err) => {
                                logger.error(err);
                                return Promise.resolve();
                            },
                        ),
                    );
                }
            });
        }
        return Promise.all(rowContext);
    }

    public getGateContextClass(key: string) {
        if (!GateContextClass[key]) {
            throw new ErrorException(
                ErrorGate.compileErrorResult(
                    301,
                    `Specified ${key} plugin not found`,
                ),
            );
        }
        return GateContextClass[key];
    }

    public getGateAllContextClass() {
        return Object.keys(GateContextClass);
    }

    public getGateContext(key: string) {
        return GateContext[key];
    }

    public setGateContext(key: string, value: IContextPlugin) {
        GateContext[key] = value;
    }

    public async removeGateContext(key: string) {
        await GateContext[key].destroy();
        delete GateContext[key];
        return true;
    }

    public async removeAllGateContext() {
        const rows = [];
        Object.values(GateContext).forEach((pl) => {
            rows.push(pl.destroy());
        });
        await Promise.all(rows);
        GateContext = {};
        return true;
    }

    public getGateContexts() {
        return Object.values(GateContext);
    }
}

export default new PluginManager();
