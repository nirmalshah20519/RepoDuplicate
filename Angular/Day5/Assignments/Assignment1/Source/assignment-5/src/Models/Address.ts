export interface Address {
  City: string;
  State: string;
  Country: string;
  Pincode: string;
}

export class AddressClass implements Address {
  public constructor(
    public City: string,
    public State: string,
    public Country: string,
    public Pincode: string
  ) {}
}
