import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  loadFlag:boolean=false;
  setLoadFlag(b:boolean){
    this.loadFlag=b
  }
  constructor() { }
}
