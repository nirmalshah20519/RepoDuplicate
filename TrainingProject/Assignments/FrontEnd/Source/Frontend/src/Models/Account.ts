export interface Login{
    // public string Email { get; set; }
    //     public string Password { get; set; }
    Email:string,
    Password:string
}

export interface Register{
    // public string firstName { get; set; }
    //     public string lastName { get; set; }
    //     public DateTime DOB { get; set; }
    //     public string Email { get; set; }
    //     public string Password { get; set; }
    //     public string PhoneNo { get; set; }
    //     public int RoleID { get; set; }
    firstName:string,
    lastName:string,
    DOB:Date,
    Email:string,
    Password:string,
    PhoneNo:string,
    RoleID:number
}

export interface JwtPayload{
    primarysid:string,
    unique_name:string[],
    role:string
}