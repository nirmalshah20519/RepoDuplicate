import { Component } from '@angular/core';
import { DataServiceService } from '../Services/data-service.service';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent {
  subjectList:string[]=[]
  constructor(private serv:DataServiceService){
    this.serv.SubjectsData.forEach(sub=>{
      this.subjectList.push(sub.SubjectName)
    })
  }

}
