import { Component } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'assignment-2';
  signUpData!:FormGroup;
  constructor(){
    this.signUpData=new FormGroup({
      Name:new FormControl(),
      Address:new FormGroup({
        streetAddress:new FormControl(),
        city:new FormControl(),
        state:new FormControl(),
        country:new FormControl(),
        pincode:new FormControl()
      }),
      PAN:new FormControl()
    });
  }

  disp(){
    console.log(this.signUpData);
  }
}
