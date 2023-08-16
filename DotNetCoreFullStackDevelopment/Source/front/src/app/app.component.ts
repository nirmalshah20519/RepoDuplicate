import { Component } from '@angular/core';
import { UserService } from 'src/Services/user.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'front';
  constructor(private user:UserService){

  }

  get flag(){
    return this.user.loadFlag
  }
}
