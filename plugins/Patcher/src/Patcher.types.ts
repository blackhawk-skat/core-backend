import ICCTParams from "@ungate/plugininf/lib/ICCTParams";
import { IFile } from "@ungate/plugininf/lib/IContext";
import { Readable } from "stream";

export interface IPluginParams extends ICCTParams {
    cvTypeStorage?: "riak" | "aws" | "dir";
    cvPath?: string;
    cvS3Bucket?: string;
    cvS3KeyId?: string;
    cvS3SecretKey?: string;
    cvDir: string;
    cvDirColumn: string;
}

export interface IJson {
    service: {
        cv_action: string;
        ck_page: string;
        ck_page_object: string;
    };
    data: {
        ck_id?: string;
        cct_page?: string[];
        cct_message?: string[];
        cct_lang?: string[];
        cct_query?: string[];
        cct_provider?: string[];
        cct_sys_setting?: string[];
        cct_account?: string[];
        cct_action?: string[];
        cct_role?: string[];
        cct_interface?: string[];
        cct_account_info?: string[];
        [key: string]: any;
    };
}

export declare class IStorage {
    public saveFile(
        path: string,
        buffer: Buffer | Readable,
        content: string,
        metaData?: Record<string, string>,
        size?: number,
    ): Promise<void>;
    public deletePath(path: string): Promise<void>;
    public getFile(key: string): Promise<IFile>;
}
