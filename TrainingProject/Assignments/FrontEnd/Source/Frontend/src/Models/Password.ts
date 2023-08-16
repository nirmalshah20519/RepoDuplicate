export interface Email{
    Email:string
}

export interface Reset{
    NewPassword:string,
    ConfirmNewPassword:string,
    OTP:string
}

export interface Password{
    Email:string,
    NewPassword:string,
    ConfirmNewPassword:string,
    OTP:string
}