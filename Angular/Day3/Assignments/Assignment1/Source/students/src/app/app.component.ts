import { Component } from '@angular/core';
import { Student, StudentClass } from 'src/Model/student';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'students';

  stuList:Student[]=[
    new StudentClass(1,'Bill Ellis',9,64,'BB',true),
    new StudentClass(2,'Louis Nguyen',9,46,'CC',true),
    new StudentClass(3,'Delia Rios',9,59,'BC',true),
    new StudentClass(4,'Earl Townsend',9,23,'FF',true),
    new StudentClass(5,'Iva Burgess',9,72,'AB',true),
    new StudentClass(6,'Viola Yates',9,86,'AA',true),
    new StudentClass(7,'Tommy Massey',9,91,'AA',true),
  ]

}
