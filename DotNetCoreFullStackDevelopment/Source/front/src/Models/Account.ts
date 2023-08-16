export interface loginModel{
    userID:string,
    password:string
}

export interface registerModel{
    FirstName:string,
    MiddleName:string
    LastName:string
    Email:string
    Image:string
    FlatNo:string
    Street:string
    City:string
    State:string
    Pincode:string
    InitDate:Date
}

export interface User{
    id:number,
    userId:string
    firstName:string,
    middleName:string
    lastName:string
    email:string
    profileUrl:string
    flatNo:string
    street:string
    city:string
    state:string
    pincode:string
    initDate:Date,
    roleId:number
}

export interface usrs{
    id:number,
    name:string,
    address:string,
    total:number
}

export interface history{
    id:number,
    name:string,
    address:string,
    payments:pymt[]
}

export interface pymt{
    id:number,
    month:number,
    year:number,
    total:number,
    dateOfPayment:Date
}



// "id": 1001,
//     "userId": "admin",
//     "passwordHash": "KDiCsnDi+rcSgcZ/WeLYFgHrRz3MvX6YkF1fhbTaOUY=",
//     "passwordSalt": "02SeR4GGjVT1778lvz3PEbgcwGx8KvxSGRBSbkDqyijiY9oc5D451iw0HlA5+h/UUVeJBd/3shG1OlnEuzb2xQ==",
//     "email": "sampatharshit03@gmail.com",
//     "roleId": 1,
//     "firstName": "admin",
//     "middleName": "admin",
//     "lastName": "admin",
//     "profileUrl": "https://s3.ap-south-1.amazonaws.com/2717-nirmal.s-feb23dotnet/admin.jfif",
//     "flatNo": "0",
//     "street": "admin",
//     "city": "admin",
//     "state": "admin",
//     "pincode": "admin",
//     "lastOtp": null,
//     "initDate": "2023-06-06T15:02:13.88",
//     "payments": [],
//     "role": null

// public string FirstName { get; set; }
//         public string MiddleName { get; set; }
//         public string LastName { get; set; }
//         public string Email { get; set; }
//         public IFormFile Image { get; set; }
//         public string FlatNo { get; set; }
//         public string Street { get; set; }
//         public string City { get; set; }
//         public string State { get; set; }
//         public string Pincode { get; set; }
//         public DateTime InitDate { get; set; }