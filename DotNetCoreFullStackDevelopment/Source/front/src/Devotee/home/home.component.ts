import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from 'src/Services/auth.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent {

  constructor(private auth:AuthService, private route:Router) {
    route.navigate(['devotee/pay'])
    if(auth.currentUser===undefined){
      route.navigateByUrl('')
    }
  }

  onLogout(){
    this.auth.logout();
    this.route.navigateByUrl('')
  }

}
