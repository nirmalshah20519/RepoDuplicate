import { Component } from '@angular/core';
import { usrs } from 'src/Models/Account';
import { AuthService } from 'src/Services/auth.service';
import { UserService } from 'src/Services/user.service';

@Component({
  selector: 'app-donation',
  templateUrl: './donation.component.html',
  styleUrls: ['./donation.component.css']
})
export class DonationComponent {
  data:usrs[]=[];

  constructor(private auth:AuthService, private load:UserService){
    this.getAllUsers()
  }

  getAllUsers(){
    this.auth.getAllUserData().subscribe({
      next:(resp:usrs[])=>{
        this.data=resp;
      },
      error:(err)=>{
        console.log(err);
      }
    })
  }

  delete(id:number){
    this.load.setLoadFlag(true)
    this.auth.deleteUser(id).subscribe({
      next:(resp)=>{
        console.log(resp);
        this.getAllUsers();
        this.load.setLoadFlag(false)
      },
      error:(err:any)=> {
          console.log(err);
          this.load.setLoadFlag(false)
      }
    })
  }
}
