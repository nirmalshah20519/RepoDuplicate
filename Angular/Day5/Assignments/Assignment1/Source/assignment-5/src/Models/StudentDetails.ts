import { Address } from "./Address";
import { EmergencyContact } from "./EmergencyContact";
import { fullname } from "./fullName";
import { parentDetail } from "./parentDetail";

export interface StudentDetail{
    ID:number,
    Name:fullname,
    DOB:Date,
    PlaceOfBirth:string,
    FirstLanguage:string,
    Address:Address,
    FatherDetails:parentDetail,
    MotherDetails:parentDetail,
    EmergencyContact:EmergencyContact[]
}

export class StudentDetailClass implements StudentDetail{
    public constructor(
        public ID:number,
        public Name: fullname,
        public DOB: Date,
        public PlaceOfBirth: string,
        public FirstLanguage: string,
        public Address: Address,
        public FatherDetails: parentDetail,
        public MotherDetails: parentDetail,
        public EmergencyContact: EmergencyContact[]
    ){}    
}