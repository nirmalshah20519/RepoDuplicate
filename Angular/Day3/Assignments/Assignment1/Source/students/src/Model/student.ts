export interface Student{
    ID:number,
    Name:string,
    Age:number,
    Average:number,
    Grade:string,
    Active:boolean
}

export class StudentClass implements Student{
    public constructor(
        public ID:number,
        public Name:string,
        public Age:number,
        public Average:number,
        public Grade:string,
        public Active:boolean
    ){}
}