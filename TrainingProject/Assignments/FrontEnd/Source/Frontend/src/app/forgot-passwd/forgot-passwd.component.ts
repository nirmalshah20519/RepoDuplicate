import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Email, Password, Reset } from 'src/Models/Password';
import { AccountService } from 'src/Services/account.service';
import { LoaderService } from 'src/Services/loader.service';
import { Collapse, initTE, Ripple, Modal, Input, Dropdown  } from "tw-elements";

@Component({
  selector: 'app-forgot-passwd',
  templateUrl: './forgot-passwd.component.html',
  styleUrls: ['./forgot-passwd.component.css']
})
export class ForgotPasswdComponent {
  ngOnInit(): void {
    initTE({ Collapse, Ripple, Modal, Input, Dropdown  });
  }
  Email!:Email;
  Reset!:Reset;
  resetFlag:boolean=false
  resetForm!:FormGroup
  otpForm!:FormGroup
  ResetData!:Password
  msg:string=''
  red:boolean=false;
  green:boolean=false;
  constructor(private fb:FormBuilder, private load:LoaderService, private auth:AccountService, private router:Router){
    this.resetForm=fb.group({
      Email:['',[Validators.required,Validators.email]]
    })
    this.otpForm=fb.group({
      NewPassword:['',[Validators.required, Validators.minLength(8), Validators.pattern('^(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*()\\-+])[A-Za-z\\d!@#$%^&*()\\-+]{8,}$')]],
      ConfirmNewPassword:[{ value: '', disabled: true },[Validators.required]],
      OTP:['',[Validators.required, Validators.minLength(6), Validators.pattern('^[0-9]{6}$')]]
    })

    const newPasswordControl = this.otpForm.get('NewPassword');
    const confirmNewPasswordControl = this.otpForm.get('ConfirmNewPassword');

    newPasswordControl?.valueChanges.subscribe((value) => {
      if (newPasswordControl.valid) {
        confirmNewPasswordControl?.enable();
      } else {
        confirmNewPasswordControl?.disable();
      }
    });
  }
  
  get passwdFlag(){
    return this.otpForm.get('NewPassword')?.value===this.otpForm.get('ConfirmNewPassword')?.value
  }
  onGetOtp(){
    this.load.setFlag(true);
    this.Email= this.resetForm.value as Email
    this.auth.forgotPassword(this.Email).subscribe({
      next:(resp:any)=>{
        console.log(resp);
        this.msg=resp.message
        this.green=true
        this.load.setFlag(false)
        this.resetFlag=true
        this.resetForm.reset()
      },
      error:(err:any)=>{
        console.log(err);
        this.msg=err.error.message
        this.red=true;
        setTimeout(() => {
          this.msg=''
          this.red=false;
        }, 2000);
      }
    })


    console.log(this.resetForm.value);
    this.resetFlag=true
    this.resetForm.reset()
  }
  onReset(){
    this.green=false
    this.load.setFlag(true);
    this.Reset=this.otpForm.value as Reset
    this.ResetData={
      ...this.Email,
      ...this.Reset
    }
    this.Email= this.resetForm.value as Email
    this.auth.resetPassword(this.ResetData).subscribe({
      next:(resp:any)=>{
        console.log(resp);
        this.msg=resp.message
        this.green=true
        this.resetFlag=true
        this.load.setFlag(false)
        this.otpForm.reset();
        setTimeout(() => {
          this.msg=''
          this.router.navigateByUrl('')
        }, 3000);
      },
      error:(err:any)=>{
        this.load.setFlag(false)
        console.log(err);
        this.red=true
        this.msg=err.error.message
        setTimeout(() => {
          this.red=false
          this.resetFlag=false
          this.otpForm.reset()
        }, 2000);

      }
    })
    console.log(this.ResetData);
  }
  Reg(){}
  
  
}
