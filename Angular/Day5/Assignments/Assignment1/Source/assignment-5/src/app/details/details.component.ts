import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { StudentDetail } from 'src/Models/StudentDetails';
import { StudentManagementDataService } from 'src/Services/student-management-data.service';

@Component({
  selector: 'app-details',
  templateUrl: './details.component.html',
  styleUrls: ['./details.component.css']
})
export class DetailsComponent {
  id!:number;
  stuData!:StudentDetail;
  

  constructor(private route:ActivatedRoute, private serv:StudentManagementDataService) {
    this.route.paramMap.subscribe((val)=>{
      this.id=Number(val.get('StuID'));
      let student=this.serv.Students.find(ele=>ele.ID===this.id);
      if(student){
        this.stuData=student
      }
    })    
  }
}
