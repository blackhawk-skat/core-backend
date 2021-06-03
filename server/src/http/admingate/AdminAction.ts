import ILocalDB from "@ungate/plugininf/lib/db/local/ILocalDB";
import ErrorException from "@ungate/plugininf/lib/errors/ErrorException";
import ErrorGate from "@ungate/plugininf/lib/errors/ErrorGate";
import ICCTParams, { IParamInfo } from "@ungate/plugininf/lib/ICCTParams";
import IContext from "@ungate/plugininf/lib/IContext";
import {
    filterFilesData,
    isEmpty,
    sortFilesData,
} from "@ungate/plugininf/lib/util/Util";
import { isObject } from "lodash";
import { uuid as uuidv4 } from "uuidv4";
import PluginManager from "../../core/pluginmanager/PluginManager";
import Property from "../../core/property/Property";
import resetAction from "./ResetAction";
import RiakAction from "./RiakAction";

export default class AdminAction {
    public params: ICCTParams;
    public name: string;
    public riakAction: RiakAction;
    public dbUsers: ILocalDB;
    public dbContexts: ILocalDB;
    public dbEvents: ILocalDB;
    public dbSessions: ILocalDB;
    public dbProviders: ILocalDB;
    public dbSchedulers: ILocalDB;
    public dbPlugins: ILocalDB;
    public dbQuerys: ILocalDB;
    public dbServers: ILocalDB;
    constructor(name: string, params: ICCTParams) {
        this.name = name;
        this.params = params;
        this.riakAction = new RiakAction(params);
    }

    public async init(): Promise<void> {
        this.dbUsers = await Property.getUsers();
        this.dbContexts = await Property.getContext();
        this.dbEvents = await Property.getEvents();
        this.dbSessions = await Property.getSessions();
        this.dbProviders = await Property.getProviders();
        this.dbSchedulers = await Property.getSchedulers();
        this.dbPlugins = await Property.getPlugins();
        this.dbQuerys = await Property.getQuery();
        this.dbServers = await Property.getServers();
    }
    /* tslint:disable:object-literal-sort-keys */
    public get handlers() {
        return {
            gtresetdefaultconfig: (gateContext: IContext) =>
                gateContext.gateContextPlugin.init(true).then(() =>
                    Promise.resolve([
                        {
                            ck_id: undefined,
                            cv_error: null,
                        },
                    ]),
                ),
            gtrestartgate: (gateContext) =>
                resetAction(
                    gateContext,
                    "ck_id",
                    "restartCluster",
                    "master",
                    "ck_id",
                ),
            gtrestartfullgate: (gateContext) =>
                resetAction(
                    gateContext,
                    "ck_id",
                    "restartAll",
                    "master",
                    "ck_id",
                ),
            gtgetusers: (gateContext: IContext) =>
                this.dbUsers.find().then((docs) =>
                    Promise.resolve(
                        docs
                            .map((val) => ({
                                ...val,
                                ...Object.entries(val.data).reduce(
                                    (obj, arr) => ({
                                        ...obj,
                                        [`data_${arr[0]}`]: arr[1],
                                    }),
                                    {},
                                ),
                                cv_actions:
                                    val.data && val.data.ca_actions
                                        ? val.data.ca_actions.join(", ")
                                        : "",
                                cv_departments:
                                    val.data && val.data.ca_department
                                        ? val.data.ca_department.join(", ")
                                        : "",
                            }))
                            .sort(sortFilesData(gateContext))
                            .filter(filterFilesData(gateContext)),
                    ),
                ),
            gtgetsessions: (gateContext: IContext) =>
                this.dbSessions.find().then((docs) =>
                    Promise.resolve(
                        docs
                            .map((val) => ({
                                ...val,
                                data: undefined,
                                ...Object.entries(val.data).reduce(
                                    (obj, arr) => ({
                                        ...obj,
                                        [`data_${arr[0]}`]: arr[1],
                                    }),
                                    {},
                                ),
                            }))
                            .sort(sortFilesData(gateContext))
                            .filter(filterFilesData(gateContext)),
                    ),
                ),
            gtgetservers: (gateContext: IContext) =>
                this.dbServers
                    .find()
                    .then((docs) =>
                        Promise.resolve(
                            docs
                                .sort(sortFilesData(gateContext))
                                .filter(filterFilesData(gateContext)),
                        ),
                    ),
            gtgetconfproviders: (gateContext: IContext) => {
                const json = JSON.parse(gateContext.query.inParams.json, (key, value) => {
                    if (value === null) {
                        return undefined;
                    }
                    return value;
                });
                return this.dbProviders.find().then((docs) =>
                    Promise.resolve(
                        [...(json?.filter?.g_providers_add_all === 'all' ? [{
                            ck_id: 'all',
                        }] : []), ...docs]
                            .map((val) => (json?.filter?.g_providers_add_all === 'all' ? {ck_id: val.ck_id} : {
                                ...val,
                                cv_params: this.ParamsToString(
                                    PluginManager.getGateProviderClass,
                                    val.ck_d_plugin,
                                    val.cct_params,
                                ),
                                cct_params: undefined,
                                ck_d_plugin: val.ck_d_plugin.toLowerCase(),
                            }))
                            .sort(sortFilesData(gateContext))
                            .filter(filterFilesData(gateContext)),
                    ),
                )
            },
            gtgetevent: (gateContext: IContext) =>
                this.dbEvents.find().then((docs) =>
                    Promise.resolve(
                        docs
                            .map((val) => ({
                                ...val,
                                cv_params: this.ParamsToString(
                                    PluginManager.getGateEventsClass,
                                    val.ck_d_plugin,
                                    val.cct_params,
                                ),
                                cct_params: undefined,
                                ck_d_plugin: val.ck_d_plugin.toLowerCase(),
                            }))
                            .sort(sortFilesData(gateContext))
                            .filter(filterFilesData(gateContext)),
                    ),
                ),
            gtgetconfigs: (gateContext: IContext) =>
                this.dbContexts.find().then((docs) =>
                    Promise.resolve(
                        docs
                            .map((val) => ({
                                ...val,
                                cv_params: this.ParamsToString(
                                    PluginManager.getGateContextClass,
                                    val.ck_d_plugin,
                                    val.cct_params,
                                ),
                                cct_params: undefined,
                                ck_d_plugin: val.ck_d_plugin.toLowerCase(),
                            }))
                            .sort(sortFilesData(gateContext))
                            .filter(filterFilesData(gateContext)),
                    ),
                ),
            gtgetconfplugins: (gateContext: IContext) =>
                this.dbPlugins.find().then((docs) =>
                    Promise.resolve(
                        docs
                            .map((val) => ({
                                ...val,
                                cv_params: this.ParamsToString(
                                    PluginManager.getGatePluginsClass,
                                    val.ck_d_plugin,
                                    val.cct_params,
                                ),
                                cct_params: undefined,
                                ck_d_plugin: val.ck_d_plugin.toLowerCase(),
                            }))
                            .sort(sortFilesData(gateContext))
                            .filter(filterFilesData(gateContext)),
                    ),
                ),
            gtgetconfquery: (gateContext: IContext) =>
                this.dbQuerys.find().then((docs) =>
                    Promise.resolve(
                        docs
                            .map((val) => ({
                                ...val,
                            }))
                            .sort(sortFilesData(gateContext))
                            .filter(filterFilesData(gateContext)),
                    ),
                ),
            gtgetschedulers: (gateContext: IContext) =>
                this.dbSchedulers.find().then((docs) =>
                    Promise.resolve(
                        docs
                            .map((val) => ({
                                ...val,
                                cv_params: this.ParamsToString(
                                    PluginManager.getGateSchedulerClass,
                                    val.ck_d_plugin,
                                    val.cct_params,
                                ),
                                cct_params: undefined,
                                ck_d_plugin: val.ck_d_plugin.toLowerCase(),
                            }))
                            .sort(sortFilesData(gateContext))
                            .filter(filterFilesData(gateContext)),
                    ),
                ),
            gtgetpluginsclass: (gateContext: IContext) =>
                Promise.resolve(
                    PluginManager.getGateAllPluginsClass()
                        .map((val) => ({ ck_id: val }))
                        .sort(sortFilesData(gateContext))
                        .filter(filterFilesData(gateContext)),
                ),
            gtgetprovidersclass: (gateContext: IContext) =>
                Promise.resolve(
                    PluginManager.getGateAllProvidersClass()
                        .map((val) => ({ ck_id: val }))
                        .sort(sortFilesData(gateContext))
                        .filter(filterFilesData(gateContext)),
                ),
            gtgetconfigclass: (gateContext: IContext) =>
                Promise.resolve(
                    PluginManager.getGateAllContextClass()
                        .map((val) => ({ ck_id: val }))
                        .sort(sortFilesData(gateContext))
                        .filter(filterFilesData(gateContext)),
                ),
            gtgetschedulerclass: (gateContext: IContext) =>
                Promise.resolve(
                    PluginManager.getGateAllSchedulersClass()
                        .map((val) => ({ ck_id: val }))
                        .sort(sortFilesData(gateContext))
                        .filter(filterFilesData(gateContext)),
                ),
            gtgeteventclass: (gateContext: IContext) =>
                Promise.resolve(
                    PluginManager.getGateAllEventsClass()
                        .map((val) => ({ ck_id: val }))
                        .sort(sortFilesData(gateContext))
                        .filter(filterFilesData(gateContext)),
                ),
            gtreloadpluginsclass: (gateContext: IContext) =>
                resetAction(
                    gateContext,
                    "ck_id",
                    "resetPluginClass",
                    "cluster",
                ),
            gtreloadprovidersclass: (gateContext: IContext) =>
                resetAction(
                    gateContext,
                    "ck_id",
                    "resetProviderClass",
                    "cluster",
                ),
            gtreloadconfigclass: (gateContext: IContext) =>
                resetAction(
                    gateContext,
                    "ck_id",
                    "resetContextClass",
                    "cluster",
                ),
            gtresetprovider: (gateContext: IContext) =>
                resetAction(gateContext, "ck_id", "reloadProvider", "cluster"),
            gtresetallprovider: (gateContext: IContext) =>
                resetAction(
                    gateContext,
                    "ck_id",
                    "reloadAllProvider",
                    "cluster",
                ),
            gtresetconfig: (gateContext: IContext) =>
                resetAction(gateContext, "ck_id", "reloadContext", "cluster"),
            gtresetallconfig: (gateContext: IContext) =>
                resetAction(
                    gateContext,
                    "ck_id",
                    "reloadAllContext",
                    "cluster",
                ),
            gtresetscheduler: (gateContext: IContext) =>
                resetAction(
                    gateContext,
                    "ck_id",
                    "reloadScheduler",
                    "schedulerNode",
                ),
            gtresetallscheduler: (gateContext: IContext) =>
                resetAction(
                    gateContext,
                    "ck_id",
                    "reloadAllScheduler",
                    "schedulerNode",
                ),
            gtgetriakbuckets: (...arg) =>
                this.riakAction.gtgetriakbuckets.apply(this.riakAction, arg),
            gtgetriakfiles: (gateContext: IContext) =>
                this.riakAction.loadRiakFiles(gateContext),
            gtgetriakfileinfo: (gateContext: IContext) =>
                this.riakAction.loadRiakFileInfo(gateContext),
            gtdownloadriakfile: (gateContext: IContext) =>
                this.riakAction.downloadRiakFile(gateContext),
            gtgetprovidersetting: (gateContext: IContext) =>
                this.loadSetting(
                    gateContext,
                    "ck_id",
                    PluginManager.getGateProviderClass,
                    this.dbProviders,
                ),
            gtgetcontextsetting: (gateContext: IContext) =>
                this.loadSetting(
                    gateContext,
                    "ck_id",
                    PluginManager.getGateContextClass,
                    this.dbContexts,
                ),
            gtgetpluginsetting: (gateContext: IContext) =>
                this.loadSetting(
                    gateContext,
                    "ck_id",
                    PluginManager.getGatePluginsClass,
                    this.dbPlugins,
                ),
            gtgetschedulersetting: (gateContext: IContext) =>
                this.loadSetting(
                    gateContext,
                    "ck_id",
                    PluginManager.getGateSchedulerClass,
                    this.dbSchedulers,
                ),
            gtgeteventsetting: (gateContext: IContext) =>
                this.loadSetting(
                    gateContext,
                    "ck_id",
                    PluginManager.getGateEventsClass,
                    this.dbEvents,
                ),
            gtgetboolean: () =>
                Promise.resolve([
                    {
                        ck_id: true,
                    },
                    {
                        ck_id: false,
                    },
                ]),
        };
    }

    public ParamsToString(method: any, ckDPlugin: string, cctParams = {}) {
        const PClass = method(ckDPlugin.toLowerCase());
        let params = {};
        if (PClass && PClass.getParamsInfo) {
            params = PClass.getParamsInfo();
        }
        return Object.entries(cctParams).reduce((str, arr) => {
            if (params[arr[0]] && params[arr[0]].type === "password") {
                return `${str}${arr[0]}=***<br/>`;
            }
            return `${str}${arr[0]}=${
                isObject(arr[1]) ? JSON.stringify(arr[1]) : arr[1]
            }<br/>`;
        }, "");
    }
    /**
     * Загрузка меню настроек
     * @param gateContext
     * @param method
     * @param db
     * @returns
     */
    public async loadSetting(
        gateContext: IContext,
        column: string,
        method,
        db,
    ): Promise<Record<string, any>[]> {
        if (isEmpty(gateContext.query.inParams.json)) {
            throw new ErrorException(ErrorGate.JSON_PARSE);
        }
        const json = JSON.parse(
            gateContext.query.inParams.json,
            (key, value) => {
                if (value === null) {
                    return undefined;
                }
                return value;
            },
        );
        if (isEmpty(json.master.ck_id)) {
            return [];
        }
        const PClass = method(json.master.ck_id);
        if (PClass && PClass.getParamsInfo) {
            const params = PClass.getParamsInfo();
            const doc = await (json.filter.cv_name
                ? db.findOne({
                      [column]: json.filter.cv_name,
                  })
                : Promise.resolve({}));
            const cctParam = Object.entries(params).reduce(
                (res, [key, obj]) => {
                    res[key] = this.checkData(
                        key,
                        obj as IParamInfo,
                        doc.cct_params || (obj as IParamInfo).defaultValue,
                    );
                    return res;
                },
                {},
            );
            return [
                {
                    childs: Object.entries(params)
                        .map((arr) =>
                            this.createFields(
                                gateContext,
                                arr[0],
                                json.filter.ck_page,
                                (json.filter.ca_childs || [])[0],
                                arr[1] as IParamInfo,
                                doc.cct_params,
                            ),
                        )
                        .filter((val) => !isEmpty(val)),
                    ck_page: json.filter.ck_page,
                    ck_page_object: uuidv4(),
                    initvalue: cctParam,
                    defaultvalue: cctParam,
                    column: "cct_params",
                    contentview: "vbox",
                    type: "FORM_NESTED",
                },
            ];
        }
        return Promise.resolve([]);
    }

    private checkData(name: string, conf: IParamInfo, params = {}) {
        switch (conf.type) {
            case "string":
            case "long_string": {
                return isObject(params[name])
                    ? JSON.stringify(params[name])
                    : params[name] || conf.defaultValue;
            }
            case "form_nested": {
                return Object.entries(conf.childs).reduce((res, [key, obj]) => {
                    res[key] = this.checkData(
                        key,
                        obj as IParamInfo,
                        params[name] || conf.defaultValue,
                    );
                    return res;
                }, {});
            }
            case "password": {
                return isEmpty(params[name])
                    ? ""
                    : "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8";
            }
            case "integer": {
                return isEmpty(params[name]) ? conf.defaultValue : params[name];
            }
            case "boolean": {
                if (isEmpty(conf.defaultValue)) {
                    return params[name] || conf.defaultValue;
                }
                return `${+(params[name] || conf.defaultValue)}`;
            }
            case "combo": {
                return params[name] || conf.defaultValue;
            }
            default: {
                return params[name] || conf.defaultValue;
            }
        }
    }
    /**
     * Создаем поля ввода
     * @param gateContext
     * @param name
     * @param ckPage
     * @param [child]
     * @param conf
     * @param [params]
     * @returns
     */
    public createFields(
        gateContext: IContext,
        name: string,
        ckPage: number | string,
        child = {
            ck_page_object: uuidv4(),
        },
        conf: IParamInfo,
        params = {},
    ) {
        /* tslint:disable:object-literal-sort-keys */
        const defaultAttr = {
            ck_page: ckPage,
            ck_page_object: uuidv4(),
            setglobal: conf.setGlobal,
            getglobal: conf.getGlobal,
            hiddenrules: conf.hiddenRules,
            disabledrules: conf.disabledRules,
            column: name,
            disabled: conf.disabled || false,
            hidden: conf.hidden || false,
            cv_displayed: conf.name,
            info: conf.description,
            required: conf.required || false,
        };
        switch (conf.type) {
            case "string": {
                return {
                    ...defaultAttr,
                    datatype: "text",
                    initvalue: isObject(params[name])
                        ? JSON.stringify(params[name])
                        : params[name] || conf.defaultValue,
                    defaultvalue: isObject(params[name])
                        ? JSON.stringify(params[name])
                        : params[name] || conf.defaultValue,
                    type: "IFIELD",
                };
            }
            case "form_nested": {
                return {
                    ...defaultAttr,
                    childs: Object.entries(conf.childs).map(([key, obj]) =>
                        this.createFields(
                            gateContext,
                            key,
                            ckPage,
                            child,
                            obj,
                            params[name] || {},
                        ),
                    ),
                    type: "FORM_NESTED",
                };
            }
            case "long_string": {
                return {
                    ...defaultAttr,
                    datatype: "textarea",
                    initvalue: isObject(params[name])
                        ? JSON.stringify(params[name])
                        : params[name] || conf.defaultValue,
                    defaultvalue: isObject(params[name])
                        ? JSON.stringify(params[name])
                        : params[name] || conf.defaultValue,
                    type: "IFIELD",
                };
            }
            case "password": {
                return {
                    ...defaultAttr,
                    datatype: "password",
                    initvalue: isEmpty(params[name])
                        ? ""
                        : "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8",
                    defaultvalue: isEmpty(params[name])
                        ? ""
                        : "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8",
                    type: "IFIELD",
                };
            }
            case "integer": {
                return {
                    ...defaultAttr,
                    datatype: "integer",
                    maxvalue: conf.maxValue,
                    minvalue: conf.minValue,
                    initvalue: isEmpty(params[name])
                        ? conf.defaultValue
                        : params[name],
                    defaultvalue: isEmpty(params[name])
                        ? conf.defaultValue
                        : params[name],
                    type: "IFIELD",
                };
            }
            case "boolean": {
                if (isEmpty(conf.defaultValue)) {
                    return {
                        ...defaultAttr,
                        autoload: "true",
                        ck_page_object: child.ck_page_object,
                        cl_dataset: 1,
                        datatype: "combo",
                        initvalue: params[name] || conf.defaultValue,
                        defaultvalue: params[name] || conf.defaultValue,
                        displayfield: "cv_name",
                        type: "IFIELD",
                        localization: "static",
                        records: [
                            {
                                ck_id: 1,
                                cv_name: "dacf7ab025c344cb81b700cfcc50e403",
                            },
                            {
                                ck_id: 0,
                                cv_name: "f0e9877df106481eb257c2c04f8eb039",
                            },
                        ],
                        valuefield: [{ in: "ck_id" }],
                    };
                }
                return {
                    ...defaultAttr,
                    datatype: "checkbox",
                    initvalue: `${+(params[name] || conf.defaultValue)}`,
                    defaultvalue: `${+(params[name] || conf.defaultValue)}`,
                    type: "IFIELD",
                };
            }
            case "combo": {
                return {
                    ...defaultAttr,
                    autoload: "true",
                    ck_page_object: child.ck_page_object,
                    ck_query: conf.query,
                    getglobaltostore: conf.getGlobalToStore,
                    cl_dataset: 1,
                    datatype: "combo",
                    initvalue: params[name] || conf.defaultValue,
                    defaultvalue: params[name] || conf.defaultValue,
                    displayfield: conf.displayField,
                    type: "IFIELD",
                    valuefield: conf.valueField,
                    querymode: conf.querymode,
                    queryparam: conf.queryparam,
                    allownew: conf.allownew,
                    pagesize: conf.pagesize,
                    records: conf.records,
                };
            }
            default: {
                gateContext.warn(name, conf.type);
                return undefined;
            }
        }
        /* tslint:enable:object-literal-sort-keys */
    }
}
