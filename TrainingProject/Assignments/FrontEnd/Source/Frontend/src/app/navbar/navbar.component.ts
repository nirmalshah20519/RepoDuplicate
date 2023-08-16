import { Component, OnInit } from '@angular/core';
import { AbstractControl, FormBuilder, FormGroup, ValidationErrors, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Login, Register } from 'src/Models/Account';
import { Roles } from 'src/Models/Enums';
import { AccountService } from 'src/Services/account.service';
import { LoaderService } from 'src/Services/loader.service';
import { Collapse, initTE, Ripple, Modal, Input, Dropdown  } from "tw-elements";

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {
  loginForm!:FormGroup
  registerForm!:FormGroup
  response:any;
  msg:string="";
  invalidFlag:boolean=false
  validFlag:boolean=false

  get statusFlag(){
    return localStorage.getItem("encToken")!==null
  }

  constructor(private fb:FormBuilder, private accountServ:AccountService, private loader:LoaderService, private router:Router){
    this.loginForm = this.fb.group({
      Email:['',[Validators.required, Validators.email]],
      Password:['',[Validators.required]]
    });

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

  onSubmit(){
    this.loader.setFlag(true)    
    let login:Login=this.loginForm.value
    this.accountServ.login(login).subscribe({      
      next:(resp:any)=>{
        console.log(resp);
        this.loader.setFlag(false);
        (document.getElementById("ModalCloseBtn") as HTMLButtonElement).click();
        const t = resp.token
        this.accountServ.decryptAndSaveTokenPayload(t)
        this.loginForm.reset()
        let pyload = this.accountServ.getPayload()
        if(pyload){
          if(pyload.role.toLowerCase()==='admin'){
            this.router.navigate(['admin','movie']).catch((err)=>{console.log(err);})
          }
          if(pyload.role.toLowerCase()==='theatreadmin'){
            this.router.navigate(['theatre-admin','add-theatre']).catch((err)=>{console.log(err);})
          }
        }
        
      },
      error:(err:any)=>{
        console.log(err);
        this.loader.setFlag(false),
        this.invalidFlag=true,
        this.msg=err.error.message
        this.loginForm.reset();
        setTimeout(() => {
          this.invalidFlag=false;
          (document.getElementById("ModalCloseBtn") as HTMLButtonElement).click();
          
        }, 1000);
      }
    })
  }

  onRegister(){
    this.loader.setFlag(true)
    let register:Register=this.registerForm.value
    register.RoleID=Roles.User
    this.accountServ.register(register).subscribe({
      next:(resp:any)=>{
        console.log(resp);
        this.loader.setFlag(false)
        this.validFlag=true;
        this.msg=resp.message;
        this.registerForm.reset();
        setTimeout(() => {
          this.validFlag=false;
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

  onBusinessClick(){
    (document.getElementById("ModalCloseBtn") as HTMLButtonElement).click();
  }

  
    
}
