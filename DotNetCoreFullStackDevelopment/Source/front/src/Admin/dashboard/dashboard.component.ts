import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from 'src/Services/auth.service';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent {

  constructor(private route:Router, private auth:AuthService){
    route.navigate(['admin/donation'])

  }

  onLogout(){
    this.auth.logout();
    this.route.navigateByUrl('')
  }

}
