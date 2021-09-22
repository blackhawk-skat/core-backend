import { IRufusLogger } from "rufus";
import BreakException from "./errors/BreakException";
import ErrorException from "./errors/ErrorException";
import ICCTParams, { IParamsInfo } from "./ICCTParams";
import IContext from "./IContext";
import IObjectParam from "./IObjectParam";
import IPlugin, { IPluginRequestContext } from "./IPlugin";
import IQuery, { IGateQuery } from "./IQuery";
import IResult from "./IResult";
import Logger from "./Logger";
import { IAuthResult } from "./NullAuthProvider";

export default abstract class NullPlugin implements IPlugin {
    public name: string;
    public params: ICCTParams;
    public logger: IRufusLogger;
    public static getParamsInfo(): IParamsInfo {
        return {};
    }
    constructor(name: string, params: ICCTParams) {
        this.name = name;
        this.params = params;
        this.logger = Logger.getLogger(`Plugin ${name}`);
        if (
            typeof this.params === "object" &&
            this.params.lvl_logger &&
            this.params.lvl_logger !== "NOTSET"
        ) {
            const rootLogger = Logger.getRootLogger();
            this.logger.setLevel(this.params.lvl_logger);
            for (const handler of rootLogger._handlers) {
                this.logger.addHandler(handler);
            }
        }
    }
    public async init(reload?: boolean): Promise<void> {
        return;
    }
    public async beforeInitQueryPerform(
        gateContext: IContext,
        PRequestContext: IPluginRequestContext,
        query?: IQuery,
    ): Promise<IQuery | void> {
        return;
    }
    public async afterInitQueryPerform(
        gateContext: IContext,
        PRequestContext: IPluginRequestContext,
        query: IGateQuery,
    ): Promise<void> {
        return;
    }
    public async beforeQueryExecutePerform(
        gateContext: IContext,
        PRequestContext: IPluginRequestContext,
        query: IGateQuery,
    ): Promise<IResult | void> {
        return;
    }
    public async afterQueryExecutePerform(
        gateContext: IContext,
        PRequestContext: IPluginRequestContext,
        result: IResult,
    ): Promise<IResult | void> {
        return;
    }
    public async beforeSession(
        gateContext: IContext,
        PRequestContext: IPluginRequestContext,
    ): Promise<IAuthResult | void> {
        return;
    }
    public async beforeSaveSession(
        gateContext: IContext,
        PRequestContext: IPluginRequestContext,
        data: IObjectParam,
    ): Promise<boolean> {
        return true;
    }
    public async handleError(
        gateContext: IContext,
        PRequestContext: IPluginRequestContext,
        err: BreakException | ErrorException | Error,
    ): Promise<BreakException | ErrorException | Error | void> {
        return;
    }
    public async destroy(): Promise<void> {
        return;
    }
}
