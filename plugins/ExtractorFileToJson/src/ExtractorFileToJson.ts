import BreakException from "@ungate/plugininf/lib/errors/BreakException";
import ErrorException from "@ungate/plugininf/lib/errors/ErrorException";
import ErrorGate from "@ungate/plugininf/lib/errors/ErrorGate";
import ICCTParams, { IParamsInfo } from "@ungate/plugininf/lib/ICCTParams";
import IContext, { IFile, IFormData } from "@ungate/plugininf/lib/IContext";
import { IPluginRequestContext } from "@ungate/plugininf/lib/IPlugin";
import { IGateQuery } from "@ungate/plugininf/lib/IQuery";
import IResult from "@ungate/plugininf/lib/IResult";
import NullPlugin from "@ungate/plugininf/lib/NullPlugin";
import ResultStream from "@ungate/plugininf/lib/stream/ResultStream";
import { ReadStreamToArray } from "@ungate/plugininf/lib/stream/Util";
import { initParams, isEmpty } from "@ungate/plugininf/lib/util/Util";
import * as fs from "fs";
import { forEach, isObject } from "lodash";
import { Readable } from "stream";
import { v4 as uuidv4 } from "uuid";
import { DirStorage } from "./DirStorage";
import { ExtractorCsv } from "./ExtractorCsv";
import { ExtractorDbf } from "./ExtractorDbf";
import { IJson, IPluginParams } from "./ExtractorFileToJson.types";
import { ExtractorXlsx } from "./ExtractorXlsx";
import { S3Storage } from "./S3Storage";

// tslint:disable: object-literal-sort-keys
export default class ExtractorFileToJson extends NullPlugin {
    public static getParamsInfo(): IParamsInfo {
        return {
            cvTypeStorage: {
                defaultValue: "riak",
                name: "Тип хранилища: dir|aws|riak",
                type: "string",
            },
            cvPath: {
                name: "Адрес Riak|Dir|Aws",
                type: "string",
            },
            cvS3Bucket: {
                name: "Наименование корзины s3",
                type: "string",
            },
            cvS3KeyId: {
                name: "Id key S3 Storage",
                type: "string",
            },
            cvS3SecretKey: {
                name: "Secret key S3 Storage",
                type: "password",
            },
            cnRowSize: {
                name: "Колличество строк при вызове",
                type: "integer",
                defaultValue: 500000,
            },
            clS3ReadPublic: {
                defaultValue: false,
                name:
                    "Устанавливать права доступа public, добавляемым файлам в riak/aws",
                type: "boolean",
            },
            cvCsvDelimiter: {
                defaultValue: ";",
                name: "Разделитель колонок csv",
                type: "string",
            },
        };
    }
    public params: IPluginParams;
    constructor(name: string, params: ICCTParams) {
        super(name, params);
        this.params = initParams(
            ExtractorFileToJson.getParamsInfo(),
            this.params,
        );
        if (isEmpty(this.params.cvTypeStorage)) {
            return;
        }
        if (this.params.cvTypeStorage === "dir") {
            const storage = new DirStorage(this.params, this.logger);
            this.saveFile = storage.saveFile.bind(storage);
            this.deletePath = storage.deletePath.bind(storage);
            this.getFile = storage.getFile.bind(storage);
            return;
        }
        const s3storage = new S3Storage(this.params, this.logger);
        this.saveFile = s3storage.saveFile.bind(s3storage);
        this.deletePath = s3storage.deletePath.bind(s3storage);
        this.getFile = s3storage.getFile.bind(s3storage);
    }

    public async beforeQueryExecutePerform(
        gateContext: IContext,
        PRequestContext: IPluginRequestContext,
        query: IGateQuery,
    ): Promise<IResult | void> {
        if (gateContext.actionName === "upload") {
            if (isEmpty(query.inParams.json)) {
                throw new ErrorException(
                    ErrorGate.compileErrorResult(
                        -1,
                        `Not found require params json`,
                    ),
                );
            }
            if (
                !isObject(gateContext.request.body) ||
                (gateContext.request.body as IFormData).files
            ) {
                throw new ErrorException(
                    ErrorGate.compileErrorResult(
                        -1,
                        `Not found require file body`,
                    ),
                );
            }
            const rows = [];
            const json = JSON.parse(query.inParams.json) as IJson;
            forEach((gateContext.request.body as IFormData).files, (val) => {
                if (val && val.length) {
                    val.forEach((value) => {
                        rows.push(
                            this.extract(gateContext, json, value, query),
                        );
                    });
                }
            });
            return Promise.all(rows).then(
                async (values) =>
                    ({
                        data: ResultStream(
                            values.reduce((obj, arr) => [...obj, ...arr], []),
                        ),
                        type: "success",
                    } as IResult),
            );
        } else if (gateContext.actionName === "dml") {
            if (isEmpty(query.inParams.json)) {
                throw new ErrorException(
                    ErrorGate.compileErrorResult(
                        -1,
                        `Not found require params json`,
                    ),
                );
            }
            const json = JSON.parse(query.inParams.json);
            if (json.service.cv_action.toUpperCase() === "D") {
                await this.deletePath(json.data.cv_file_guid);
                return;
            } else {
                const file = await this.getFile(json.data.cv_file_guid);
                const values = await this.extract(
                    gateContext,
                    json,
                    file,
                    query,
                    false,
                );
                fs.unlinkSync(file.path);
                return {
                    data: ResultStream(values),
                    type: "success",
                } as IResult;
            }
        }
        return;
    }
    /**
     * Распаковываем и сохраняем в хранилище
     * @param gateContext
     * @param json
     * @param file
     * @param query
     */
    public async extract(
        gateContext: IContext,
        json: IJson,
        file: IFile,
        query: IGateQuery,
        isSave: boolean = true,
    ) {
        const cvFileUuid = json.data.cv_file_guid || uuidv4();
        if (isSave) {
            await this.saveFile(
                cvFileUuid,
                fs.createReadStream(file.path),
                file.headers["content-type"],
                {
                    originalFilename: file.originalFilename,
                },
                file.size,
            );
        }
        const newJson = {
            ...json,
            data: {
                ...json.data,
                cv_file_guid: cvFileUuid,
                cv_file_mime: file.headers["content-type"],
                cv_file_name: file.originalFilename,
            },
        } as IJson;
        if (
            file.originalFilename.toLowerCase().endsWith(".csv") ||
            file.headers["content-type"] === "text/csv" ||
            file.headers["content-type"] === "application/csv"
        ) {
            return this.parseCsv(gateContext, newJson, file, query);
        }
        if (
            file.originalFilename.toLowerCase().endsWith(".xlsx") ||
            file.headers["content-type"] ===
                "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        ) {
            return this.parseXlsx(gateContext, newJson, file, query);
        }
        if (
            file.originalFilename.toLowerCase().endsWith(".dbf") ||
            file.headers["content-type"] === "application/dbase" ||
            file.headers["content-type"] === "application/dbf" ||
            file.headers["content-type"] === "application/x-dbf"
        ) {
            return this.parseDbf(gateContext, newJson, file, query);
        }
        throw new ErrorException(
            -1,
            `Неизвестный формат файла ${file.originalFilename} mime ${file.headers["content-type"]}`,
        );
    }
    private parseCsv(
        gateContext: IContext,
        json: IJson,
        file: IFile,
        query: IGateQuery,
    ) {
        return new Promise((resolve, reject) => {
            let result = [];
            const extractCsv = new ExtractorCsv(
                file.path,
                this.params.cnRowSize,
                {
                    encoding: json.data.cv_file_encoding || "utf-8",
                    escape: json.data.cv_csv_escape || '"',
                    delimiter:
                        json.data.cv_csv_delimiter ||
                        this.params.cvCsvDelimiter,
                    quote: Object.prototype.hasOwnProperty.call(
                        json.data,
                        "cv_csv_quote",
                    )
                        ? json.data.cv_csv_quote
                        : '"',
                    objectMode: true,
                    ignoreEmpty: json.data.cv_csv_ignore_empty || false,
                },
            );
            const queues = [];
            let numPack = -1;
            extractCsv.on("error", (err) => reject(err));
            extractCsv.on("end", () =>
                Promise.all(queues)
                    .then(() => resolve(result))
                    .catch((e) => reject(e)),
            );
            extractCsv.on("pack", (pack) => {
                extractCsv.pause();
                queues.push(
                    this.readSheet(
                        gateContext,
                        json,
                        pack,
                        query,
                        1,
                        (numPack += 1),
                    ).then(
                        (res) => {
                            result = [...result, ...res];
                            extractCsv.resume();
                            return res;
                        },
                        (err) => {
                            extractCsv.emit("error", err);
                            extractCsv.resume();
                            throw err;
                        },
                    ),
                );
            });
        });
    }
    private parseXlsx(
        gateContext: IContext,
        json: IJson,
        file: IFile,
        query: IGateQuery,
    ) {
        return new Promise((resolve, reject) => {
            let result = [];
            const extractorXlsx = new ExtractorXlsx(
                file.path,
                this.params.cnRowSize,
            );
            const queues = [];
            let numPack = -1;
            extractorXlsx.on("error", (err) => reject(err));
            extractorXlsx.on("end", () =>
                Promise.all(queues)
                    .then(() => resolve(result))
                    .catch((e) => reject(e)),
            );
            extractorXlsx.on("pack", (pack, id) => {
                extractorXlsx.pause();
                queues.push(
                    this.readSheet(
                        gateContext,
                        json,
                        pack,
                        query,
                        id,
                        (numPack += 1),
                    ).then(
                        (res) => {
                            result = [...result, ...res];
                            extractorXlsx.resume();
                            return res;
                        },
                        (err) => {
                            extractorXlsx.emit("error", err);
                            extractorXlsx.resume();
                            throw err;
                        },
                    ),
                );
            });
            extractorXlsx.process();
        });
    }
    private parseDbf(
        gateContext: IContext,
        json: IJson,
        file: IFile,
        query: IGateQuery,
    ) {
        return new Promise((resolve, reject) => {
            let result = [];
            const queues = [];
            let numPack = -1;
            const extractorDbf = new ExtractorDbf(
                file.path,
                this.params.cnRowSize,
                json.data.cv_file_encoding || "utf-8",
            );
            extractorDbf.on("error", (err) => reject(err));
            extractorDbf.on("end", () =>
                Promise.all(queues)
                    .then(() => resolve(result))
                    .catch((e) => reject(e)),
            );
            extractorDbf.on("pack", (pack) => {
                extractorDbf.pause();
                queues.push(
                    this.readSheet(
                        gateContext,
                        json,
                        pack,
                        query,
                        1,
                        (numPack += 1),
                    ).then(
                        (res) => {
                            result = [...result, ...res];
                            extractorDbf.resume();
                            return res;
                        },
                        (err) => {
                            extractorDbf.emit("error", err);
                            extractorDbf.resume();
                            throw err;
                        },
                    ),
                );
            });
        });
    }
    private saveFile = (
        path: string,
        buffer: Buffer | Readable,
        content: string,
        metaData?: Record<string, string>,
        size?: number,
    ) => Promise.resolve();
    private deletePath = (path: string) => Promise.resolve();
    private getFile = (key: string): Promise<IFile> =>
        Promise.resolve({} as IFile);

    /**
     * Читаем страницы
     *
     * @param gateContext
     * @param json
     * @param sheet
     * @param query
     * @param index
     */
    private readSheet(
        gateContext: IContext,
        json: IJson,
        pack: any[],
        query: IGateQuery,
        index: number = 1,
        numPack: number = 0,
    ) {
        if (this.logger.isDebugEnabled()) {
            this.logger.debug(
                "Num sheet: %s, Num pack: %s\nPack: %j",
                index,
                numPack,
                pack,
            );
        }
        query.inParams.json = JSON.stringify({
            ...json,
            data: {
                ...json.data,
                sheet_index: index,
                extract_rows: pack,
                num_pack: numPack,
            },
        });
        return this.callRows(gateContext, query, index, numPack);
    }
    /**
     * Сохраняем
     *
     * @param gateContext
     * @param query
     */
    private callRows(
        gateContext: IContext,
        query: IGateQuery,
        index: number,
        numPack: number,
    ) {
        return gateContext.provider
            .processDml(gateContext, query)
            .then((res) => ReadStreamToArray(res.stream))
            .then((arr) => {
                if (this.logger.isDebugEnabled()) {
                    this.logger.debug(
                        "Num sheet: %s, Num pack: %s\nResult: %j",
                        index,
                        numPack,
                        arr,
                    );
                }
                const [row] = arr;
                if (row && row.result) {
                    try {
                        const result = isObject(row.result)
                            ? row.result
                            : JSON.parse(row.result);
                        if (!isEmpty(result.cv_error)) {
                            throw new BreakException({
                                data: ResultStream(arr),
                                type: "success",
                            });
                        }
                    } catch (e) {
                        gateContext.error(
                            `Parse error: ${row.result}\n${e.message}`,
                            e,
                        );
                    }
                }
                return arr;
            });
    }
}
