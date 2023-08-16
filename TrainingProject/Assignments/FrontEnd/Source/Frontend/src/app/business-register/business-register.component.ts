import { Component } from '@angular/core';
import { AbstractControl, FormBuilder, FormGroup, ValidationErrors, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Register } from 'src/Models/Account';
import { Roles } from 'src/Models/Enums';
import { AccountService } from 'src/Services/account.service';
import { LoaderService } from 'src/Services/loader.service';
import { Collapse, initTE, Ripple, Modal, Dropdown, Input } from "tw-elements";

@Component({
  selector: 'app-business-register',
  templateUrl: './business-register.component.html',
  styleUrls: ['./business-register.component.css']
})
export class BusinessRegisterComponent {
  registerForm!:FormGroup
  response:any;
  msg:string="";
  invalidFlag:boolean=false
  validFlag:boolean=false
  constructor(private fb:FormBuilder, private accountServ:AccountService, private loader:LoaderService, private router:Router){
    this.registerForm = this.fb.group({
      firstName:['',[Validators.required]],
      lastName:['',[Validators.required]],
      Email:['',[Validators.required, Validators.email]],
      Password:['',[Validators.required]],
      ConfirmPassword:['',[Validators.required]],
      DOB:['',[Validators.required]],
      PhoneNo:['',[Validators.required, Validators.pattern(/^\d{10}$/)]]
    }, {
      validator: this.passwordMatchValidator
    });
  }

  ngOnInit(): void {
    initTE({ Collapse, Ripple, Modal, Input, Dropdown  });
  }
  loginFlag:boolean=false;

  Reg(){
    this.loginFlag=true
  }

  Log(){
    this.loginFlag=false
  }

  onLogout(){
this.accountServ.logout();
  }


  onRegister(){
    this.loader.setFlag(true)
    let register:Register=this.registerForm.value
    register.RoleID=Roles.TheatreAdmin
    this.accountServ.register(register).subscribe({
      next:(resp:any)=>{
        console.log(resp);
        this.loader.setFlag(false)
        this.validFlag=true;
        this.msg=resp.message;
        this.registerForm.reset();
        setTimeout(() => {
          this.validFlag=false;
          this.msg='';
          (document.getElementById("ModalCloseBtn") as HTMLButtonElement).click();
          
        }, 2000);
      },
      error:(err:any)=>{
        console.log(err);
        this.loader.setFlag(false)
      }
    })
  }

  passwordMatchValidator(control: AbstractControl): ValidationErrors | null {
    const password = control.get('password');
    const confirmPassword = control.get('confirmPassword');

    if (password?.value !== confirmPassword?.value) {
      return { passwordMismatch: true };
    }

    return null;
  }
}
