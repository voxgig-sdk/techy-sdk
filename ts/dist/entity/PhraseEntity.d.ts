import { TechyEntityBase } from '../TechyEntityBase';
import type { TechySDK } from '../TechySDK';
import type { Control } from '../types';
import type { Phrase, PhraseLoadMatch } from '../TechyTypes';
declare class PhraseEntity extends TechyEntityBase<Phrase> {
    constructor(client: TechySDK, entopts: any);
    make(this: PhraseEntity): PhraseEntity;
    load(this: any, reqmatch?: PhraseLoadMatch, ctrl?: Control): Promise<PhraseEntity>;
}
export { PhraseEntity };
