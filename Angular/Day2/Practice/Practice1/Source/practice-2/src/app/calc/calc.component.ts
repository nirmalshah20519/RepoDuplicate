import { Component } from '@angular/core';

@Component({
  selector: 'app-calc',
  templateUrl: './calc.component.html',
  styleUrls: ['./calc.component.css']
})
export class CalcComponent {
  num1!:number;
  num2!:number;
  result!:number;
  opr:number=0


  onChange(id:number){
    this.opr=id
    console.log(this.opr);
  }

  calculate(){
    switch (this.opr) {
      case 1:
        this.result=this.num1+this.num2;
        break;
      
      case 2:
        this.result=this.num1-this.num2;
        break;

      case 3:
        this.result=this.num1*this.num2;
        break;

      default:
        break;
    }
  }

}
