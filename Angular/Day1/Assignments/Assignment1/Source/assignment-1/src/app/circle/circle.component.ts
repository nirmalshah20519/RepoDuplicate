import { Component } from '@angular/core';

@Component({
  selector: 'app-circle',
  templateUrl: './circle.component.html',
  styleUrls: ['./circle.component.css']
})
export class CircleComponent {
  radius:number=0;
  result:number=0;
  PI:number=(22/7)
  calcArea(){
    this.result=this.PI*(Math.pow(this.radius,2))
  }

}
