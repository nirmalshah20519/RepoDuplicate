import { Component } from '@angular/core';


@Component({
  selector: 'app-hello',
  templateUrl: './hello.component.html',
  styleUrls: ['./hello.component.css']
})
export class HelloComponent {
  name!:string;
  greeting!:string;
   getname(){
    console.log(this.name);
    this.greeting="Hello "+this.name
   }

}
