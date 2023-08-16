import { Component } from '@angular/core';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent {
  id: string = '';
  pwd: string = '';
  class: string = 'd-none w-100 bg-dark mt-3 p-3';
  resp: string = '';
  login() {
    if (this.id === 'admin' && this.pwd === 'admin') {
      console.log(true);
      this.class = 'd-block w-100 bg-success my-3 p-3';
      this.resp = 'Login Success';
    } else {
      console.log(false);
      this.class = 'd-block w-100 bg-danger my-3 p-3';
      this.resp = 'Wrong Credentials';
    }
    setTimeout(() => {
      this.class = 'd-none w-100 bg-dark mt-3 p-3';
      this.resp = '';
    }, 2000);
  }
}
