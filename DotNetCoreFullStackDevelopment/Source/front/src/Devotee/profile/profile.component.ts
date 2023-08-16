import { Component } from '@angular/core';
import { User, registerModel } from 'src/Models/Account';
import { AuthService } from 'src/Services/auth.service';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.css']
})
export class ProfileComponent {
  user!:User;
  constructor(private auth:AuthService){
    if(auth.currentUser){
      this.user=auth.currentUser
    }
    console.log(this.user);
  }
}
