import { Component } from '@angular/core';
import { SavevalueService } from '../savevalue.service';

@Component({
  selector: 'app-test1',
  templateUrl: './test1.component.html',
  styleUrls: ['./test1.component.css'],
})
export class Test1Component {
  constructor(private serv: SavevalueService) {}
  num1: number = 20;
  check(val: string) {
    return val.toUpperCase();
  }

  Increase(val: number) {
    return this.num1 + val;
  }

  Decrease(val: number) {
    return this.num1 - val;
  }

  saveValue(val: number) {
    let obj = {
      name: 'tate' + val,
      value: this.Increase(val),
    };
    this.serv.add(obj);
  }
  CheckReturn(){
    if(this.Increase(40)>20){
      return "high"
    }
    else
    {
      return "low"
    }
  }
}
