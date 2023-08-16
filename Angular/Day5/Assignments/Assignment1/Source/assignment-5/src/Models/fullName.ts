export interface fullname{
    fname:string;
    mname:string;
    lname:string;
}

export class fullNameClass implements fullname{
    public constructor(
        public fname:string,
        public mname:string,
        public lname:string
    ){}
}