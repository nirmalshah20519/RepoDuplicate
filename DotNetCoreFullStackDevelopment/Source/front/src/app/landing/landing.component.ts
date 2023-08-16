import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { loginModel } from 'src/Models/Account';
import { AuthService } from 'src/Services/auth.service';
import { UserService } from 'src/Services/user.service';

@Component({
  selector: 'app-landing',
  templateUrl: './landing.component.html',
  styleUrls: ['./landing.component.css']
})
export class LandingComponent {
  login!:FormGroup;
  constructor(private fb:FormBuilder, private auth:AuthService, private route:Router, private usr:UserService){
    this.login=fb.group({
      userID:['',[Validators.required]],
      password:['',[Validators.required]]
    })
  }

  onLogin(){
    this.usr.setLoadFlag(true)
    let login:loginModel=this.login.value;
    this.auth.login(login).subscribe({
      next:(resp:any)=>{
        console.log(resp);
        this.auth.currentUser=resp.user
        this.usr.setLoadFlag(false)
        if(resp.user.roleId===1){
          this.route.navigate(['admin'])
        }
        else if(resp.user.roleId===2){
          this.route.navigate(['devotee'])
        }
        // resp.
        // this.route.navigate([])
      },
      error:(resp:any)=>{
        this.usr.setLoadFlag(false)
        console.log(resp);
      }
    })

  }

}
        // public string userID { get; set; }
        // public string password { get; set; }