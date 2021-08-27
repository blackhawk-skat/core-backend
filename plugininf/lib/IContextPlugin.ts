/**
 * Created by artemov_i on 04.12.2018.
 */
import Connection from "./db/Connection";
import { IAuthController } from "./IAuthController";
import ICCTParams from "./ICCTParams";
import IContext, { TAction } from "./IContext";
import IQuery, { IGateQuery } from "./IQuery";
import IResult from "./IResult";
import { IMetaData } from "./IResult";

export interface IContextPluginResult {
    actionName?: TAction;
    defaultActionName?: TAction;
    providerName?: string;
    defaultProviderName?: string;
    query?: IQuery;
    connection?: Connection;
    queryName?: string;
    defaultQueryName?: string;
    pluginName?: string[];
    defaultPluginName?: string[];
    loginQuery?: string;
    metaData?: IMetaData;
}

export interface IContextParams extends ICCTParams {
    attachmentType: string;
    enableCors: boolean;
    maxFileSize: number;
    maxLogParamLen: number;
    maxPostSize: number;
    lvl_logger: string;
    cors?: {
        origin: string | RegExp | boolean | Array<string | RegExp>;
        methods?: string | string[];
        allowedHeaders?: string | string[];
        exposedHeaders?: string | string[];
        credentials?: boolean;
        maxAge?: number;
        preflightContinue?: boolean;
        optionsSuccessStatus?: number;
    };
    paramSession?: {
        name?: string;
        proxy?: boolean;
        resave: boolean;
        rolling: boolean;
        saveUninitialized: boolean;
        secret: string;
        unset: "keep" | "destroy";
        typeStore: "nedb" | "typeorm";
        typeorm: {
            type: string;
            name: string;
            host: string;
            port: number;
            username: string;
            password: string;
            database: string;
            typeOrmExtra: string;
        };
        cookie: {
            secure: boolean | string;
            sameSite?: boolean | "lax" | "none" | "strict" | string;
            path: string;
            maxAge: number;
            httpOnly: boolean;
            expires?: string;
            domain?: string;
        };
    };
}

export default interface IContextPlugin {
    name: string;
    maxPostSize: number;
    maxFileSize: number;
    maxLogParamLen: number;
    attachmentType: string;
    params: IContextParams;
    authController: IAuthController;
    init(reload?: boolean): Promise<void>;
    initContext(gateContext: IContext): Promise<IContextPluginResult>;
    checkQueryAccess(
        gateContext: IContext,
        query: IGateQuery,
    ): Promise<boolean>;
    handleResult(gateContext: IContext, result: IResult): Promise<IResult>;
    maskResult(): Promise<IResult>;
    destroy(): Promise<void>;
}
