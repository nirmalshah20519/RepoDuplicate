import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { User, history, loginModel, registerModel, usrs } from 'src/Models/Account';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private URL ="https://localhost:7041/api/Account/"
  currentUser:User|undefined;
  constructor(private http:HttpClient) { }

  login(login:loginModel){
    return this.http.post<any>(this.URL+'login',login)
  }

  register(register:registerModel){
    return this.http.post<any>(this.URL+'register',register)
  }

  upload(f:FormData){
    return this.http.post<any>(this.URL+'upload',f)
  }

  logout(){
    this.currentUser=undefined;
  }

  pay(pay:any){
    return this.http.post(this.URL+'pay',pay)
  }

  getOtp(){
    let d={"id":this.currentUser?.id}
    return this.http.post(this.URL+'otp',d)

  }

  getAllUserData(){
    return this.http.get<usrs[]>(this.URL+'donations')
  }

  getUserdata(){
    return this.http.get<history>(this.URL+'donations/'+this.currentUser?.id)
  }

  getUserByID(id:number){
    return this.http.get<User[]>(this.URL+`user/${id}`)
  }

  deleteUser(id:number){
    return this.http.delete<any>(this.URL+`deleteUser/${id}`)
  }

  updateUser(id:number, user:registerModel){
    return this.http.patch<any>(this.URL+`editUser/${id}`,user)
  }

}
