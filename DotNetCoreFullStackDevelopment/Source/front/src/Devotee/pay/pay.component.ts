import { Component } from '@angular/core';
import { User, history } from 'src/Models/Account';
import { AuthService } from 'src/Services/auth.service';
import { UserService } from 'src/Services/user.service';

@Component({
  selector: 'app-pay',
  templateUrl: './pay.component.html',
  styleUrls: ['./pay.component.css']
})
export class PayComponent {
  years:number[]=[2022,2023,2024,2025,2026,2027]
  months:number[]=[1,2,3,4,5,6,7,8,9,10,11,12]
  successFlag:boolean=false;
  data:history={} as history
  otp!:string
  month!:number;
  year!:number;
  amount!:number;
  user!:User
  otpflag:boolean=false;
  constructor(private auth:AuthService, private usr:UserService){
    this.user=this.auth.currentUser as User
    this.getHistory()

  }

  getHistory(){
    this.auth.getUserdata().subscribe({
      next:(resp:any)=>{
        this.data=resp[0]
        console.log(this.data);
      }
    })
  }

  getOTP(){
    this.usr.setLoadFlag(true)    
    this.auth.getOtp().subscribe({
      next:(data)=>{
        console.log(data);
        this.usr.setLoadFlag(false)
        this.otpflag=true
      },
      error:(error)=>{
        console.log(error);
        this.usr.setLoadFlag(false)
      }
    })
  }

  onPay(){
    this.usr.setLoadFlag(true)
    console.log(this.otp);
    if(this.month && this.year && this.amount>100){
      let pay = {
        "month":this.month,
        "year":this.year,
        "amount":this.amount,
        "userID":this.user.id,
        "otp":this.otp.toString()
      }
      console.log(pay);
      this.auth.pay(pay).subscribe({
        next:(data)=>{
          console.log(data);
          this.otpflag=false
          this.successFlag=true;
          this.month=0;
          this.amount=0
          this.getHistory()
          this.usr.setLoadFlag(false)
          setTimeout(() => {
            this.successFlag=false
          }, 3000);
        },
        error:(error)=>{
          console.log(error);
          this.usr.setLoadFlag(false)
        }
      })
    }else{
      alert("Please fill the payment form properly")
    }
  }

}
