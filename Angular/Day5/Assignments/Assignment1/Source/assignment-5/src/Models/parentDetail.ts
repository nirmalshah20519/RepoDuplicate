import { fullname } from './fullName';

export interface parentDetail {
  Name: fullname;
  email: string;
  education: string;
  profession: string;
  designation: string;
  phone: string;
}

export class parentDetailClass implements parentDetail {
  public constructor(
    public Name: fullname,
    public email: string,
    public education: string,
    public profession: string,
    public designation: string,
    public phone: string
  ) {}
}
