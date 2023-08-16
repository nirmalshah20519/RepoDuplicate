import { subject } from "./subject";

export interface student{
    ID:number;
    Name:string;
    Image:string;
    Address:string;
    DOB:Date;
    Subjects:subject[]
}

// export class Student implements student{
//     public constructor(
//         public ID:number,
//         public Name:string,
//         public Image:string,
//         public Address:string,
//         public DOB:Date,
//         public Subjects:subject[]        
//     ){}
// }