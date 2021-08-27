import * as moment from "moment";
import { IRufusLogger } from "rufus";
import { IAuthController } from "./IAuthController";
import ICCTParams from "./ICCTParams";
import { IParamsInfo } from "./ICCTParams";
import IContext from "./IContext";
import IProvider from "./IProvider";
import IQuery, { IGateQuery } from "./IQuery";
import { IResultProvider } from "./IResult";
import Logger from "./Logger";
import { initParams, isEmpty } from "./util/Util";

export interface IParamsProvider extends Record<string, any> {
    defaultNeedSession: boolean;
    defaultType?: number;
    defaultUseMacros: boolean;
    needSession?: boolean;
    type?: number;
    useMacros?: boolean;
    lvl_logger?: string;
}

export default abstract class NullProvider implements IProvider {
    public static getParamsInfo(): IParamsInfo {
        return {
            defaultNeedSession: {
                defaultValue: true,
                name: "По умолчанию необходимость авторизации для запросов",
                type: "boolean",
            },
            defaultType: {
                defaultValue: 0,
                name: "По умолчанию тип запроса",
                type: "integer",
            },
            defaultUseMacros: {
                defaultValue: false,
                name: "По умолчанию разрешены ли входящие макросы",
                type: "boolean",
            },
            needSession: {
                name: "Необходимость авторизации для запросов",
                type: "boolean",
            },
            type: {
                name: "Тип запроса",
                type: "integer",
            },
            useMacros: {
                name: "Разрешены ли входящие макросы",
                type: "boolean",
            },
            lvl_logger: {
                displayField: "ck_id",
                name: "Level logger",
                records: [
                    {
                        ck_id: "NOTSET",
                    },
                    { ck_id: "VERBOSE" },
                    { ck_id: "DEBUG" },
                    { ck_id: "INFO" },
                    { ck_id: "WARNING" },
                    { ck_id: "ERROR" },
                    { ck_id: "CRITICAL" },
                    { ck_id: "WARN" },
                    { ck_id: "TRACE" },
                    { ck_id: "FATAL" },
                ],
                type: "combo",
                valueField: [{ in: "ck_id" }],
            },
        };
    }
    public name: string;
    public params: IParamsProvider;
    public log: IRufusLogger;
    public authController: IAuthController;
    constructor(
        name: string,
        params: ICCTParams,
        authController: IAuthController,
    ) {
        this.name = name;
        this.params = initParams(NullProvider.getParamsInfo(), params);
        this.authController = authController;
        this.log = Logger.getLogger(`Provider ${name}`);
        if (
            typeof this.params === "object" &&
            this.params.lvl_logger &&
            this.params.lvl_logger !== "NOTSET"
        ) {
            const rootLogger = Logger.getRootLogger();
            this.log.setLevel(this.params.lvl_logger);
            for (const handler of rootLogger._handlers) {
                this.log.addHandler(handler);
            }
        }
    }
    public abstract processSql(
        context: IContext,
        query: IGateQuery,
    ): Promise<IResultProvider>;
    public abstract processDml(
        context: IContext,
        query: IGateQuery,
    ): Promise<IResultProvider>;
    public fileInParams(file: Buffer) {
        return file;
    }
    public dateInParams(date: string) {
        return moment(date).toDate();
    }
    public arrayInParams(val: any[]) {
        return val;
    }
    public async destroy(): Promise<void> {
        return;
    }
    public abstract init(reload?: boolean): Promise<void>;
    public async initContext(
        context: IContext,
        query: IQuery = {},
    ): Promise<IQuery> {
        if (isEmpty(query.needSession)) {
            query.needSession = this.params.defaultNeedSession as boolean;
        }
        if (isEmpty(query.type)) {
            query.type = this.params.defaultType as number;
        }
        if (isEmpty(query.useMacros)) {
            query.useMacros = this.params.defaultUseMacros as boolean;
        }
        if (!isEmpty(this.params.needSession)) {
            query.needSession = this.params.needSession as boolean;
        }
        if (!isEmpty(this.params.type)) {
            query.type = this.params.type as number;
        }
        if (!isEmpty(this.params.useMacros)) {
            query.useMacros = this.params.useMacros as boolean;
        }
        return query;
    }
}
