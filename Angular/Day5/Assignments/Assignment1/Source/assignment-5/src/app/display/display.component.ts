import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { StudentDetail } from 'src/Models/StudentDetails';
import { StudentManagementDataService } from 'src/Services/student-management-data.service';

@Component({
  selector: 'app-display',
  templateUrl: './display.component.html',
  styleUrls: ['./display.component.css']
})
export class DisplayComponent {

  arr:StudentDetail[]=[]

  constructor(private service:StudentManagementDataService, private rt:Router){
    this.arr=this.service.Students
  }

  detail(ID:number){
    console.log(ID);
    this.rt.navigate([`/display/${ID}`])
  }

}
