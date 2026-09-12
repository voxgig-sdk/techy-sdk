import { Context } from './Context';
declare class TechyError extends Error {
    isTechyError: boolean;
    sdk: string;
    code: string;
    ctx: Context;
    status: number;
    get notFound(): boolean;
    constructor(code: string, msg: string, ctx: Context);
}
export { TechyError };
