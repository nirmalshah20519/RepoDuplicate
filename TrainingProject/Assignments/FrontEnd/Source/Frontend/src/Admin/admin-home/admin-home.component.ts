import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AccountService } from 'src/Services/account.service';
import { Dropdown, Collapse, initTE} from "tw-elements";

@Component({
  selector: 'app-admin-home',
  templateUrl: './admin-home.component.html',
  styleUrls: ['./admin-home.component.css']
})
export class AdminHomeComponent {

  constructor(private route:Router, private accountServ:AccountService) {

    
  }
  ngOnInit() {
    initTE({ Dropdown, Collapse });
  }

  onLogout(){
    this.accountServ.logout();
    this.route.navigate(['']);
  }
}
