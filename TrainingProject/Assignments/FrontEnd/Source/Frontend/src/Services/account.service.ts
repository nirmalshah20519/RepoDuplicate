import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { JwtPayload, Login, Register } from 'src/Models/Account';
import { JwtHelperService } from '@auth0/angular-jwt';
import {AES, enc} from 'crypto-js'
import { Email, Password } from 'src/Models/Password';


@Injectable({
  providedIn: 'root',
})
export class AccountService {
  URL: string = 'https://localhost:7133/api/Account/';
  private SecretKey:string="N!₹m@|5h@h"
  tokenStr:string='encToken'
  payloadStr:string='encPayload'

  constructor(private http: HttpClient) {}

  testServer(){
    return this.http.get(this.URL+'testserver')
  }

  login(login: Login) {
    return this.http.post<any>(this.URL + 'login', login);
  }

  forgotPassword(email:Email){
    return this.http.post(this.URL+'forgotpassword',email)
  }

  resetPassword(Reset:Password){
    return this.http.post(this.URL+'resetpassword',Reset)
  }

  register(register: Register) {
    return this.http.post<any>(this.URL + 'register', register);
  }

  logout() {
    localStorage.removeItem(this.tokenStr);
    localStorage.removeItem(this.payloadStr);
  }
  
  getToken():string|null{
    const t = localStorage.getItem(this.tokenStr)
    if(t){
      return AES.decrypt(t,this.SecretKey).toString(enc.Utf8)
    }
    return null
  }

  getPayload():JwtPayload|null{
    const t = localStorage.getItem(this.tokenStr)
    if(t){
      return JSON.parse(AES.decrypt(t,this.SecretKey).toString(enc.Utf8))
    }
    return null
  }

  decryptAndSaveTokenPayload(token: string) {
    const helper = new JwtHelperService();
    const decodedToken = helper.decodeToken(token);
    console.log(decodedToken);
    
    const encryptedPayload = AES.encrypt( JSON.stringify(decodedToken), this.SecretKey).toString()
    const encryptedToken = AES.encrypt(token, this.SecretKey).toString()
    localStorage.setItem(this.tokenStr,encryptedPayload)
    localStorage.setItem(this.payloadStr,encryptedToken)
}

}
