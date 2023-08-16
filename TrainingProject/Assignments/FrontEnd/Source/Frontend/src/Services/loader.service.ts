import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class LoaderService {
  flag:boolean=false;
  setFlag(b:boolean){
    this.flag=b
  }
  constructor() { }
}
