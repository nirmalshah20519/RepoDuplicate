export interface EmergencyContact{
    relation:string;
    number:string;
}

export class EmergencyContactClass implements EmergencyContact{
    public constructor(
        public relation:string,
        public number:string
    ){}
}