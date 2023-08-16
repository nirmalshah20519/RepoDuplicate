import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class SavevalueService {
values:Array<{name:string,value:number}>=[]
  constructor() { }
  add(obj:{name:string,value:number}){
    this.values.push(obj);
  }
}
