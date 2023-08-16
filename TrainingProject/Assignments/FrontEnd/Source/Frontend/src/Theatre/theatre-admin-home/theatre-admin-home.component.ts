import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { TheatreStore } from 'src/Services/Theatre.store';
import { AccountService } from 'src/Services/account.service';
import { TheatreService } from 'src/Services/theatre.service';
import { Dropdown, Collapse, initTE} from "tw-elements";
@Component({
  selector: 'app-theatre-admin-home',
  templateUrl: './theatre-admin-home.component.html',
  styleUrls: ['./theatre-admin-home.component.css']
})
export class TheatreAdminHomeComponent {
  
  tid!:number
  constructor(private route:Router, private accountServ:AccountService, private theatreServ:TheatreService, private act:ActivatedRoute, private theatreStore:TheatreStore) {

    route.navigate(['my-theatres'],{relativeTo:act})
    theatreStore.setTheatres()
    theatreStore.getTheatres()
  }
  ngOnInit() {
    initTE({ Dropdown, Collapse });
    
  }

  onLogout(){
    this.accountServ.logout();
    this.route.navigate(['']);
  }

  
}
