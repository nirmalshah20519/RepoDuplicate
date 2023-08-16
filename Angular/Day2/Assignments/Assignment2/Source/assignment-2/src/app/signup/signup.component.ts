import { Component } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';

@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.css']
})
export class SignupComponent {
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
