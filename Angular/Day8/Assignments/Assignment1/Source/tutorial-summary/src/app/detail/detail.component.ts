import { Component } from '@angular/core';
import { DataServiceService } from '../Services/data-service.service';
import { ActivatedRoute, Router } from '@angular/router';
import { Subject } from 'src/Model/Interfaces';

@Component({
  selector: 'app-detail',
  templateUrl: './detail.component.html',
  styleUrls: ['./detail.component.css']
})
export class DetailComponent {
  currSubData:Subject|undefined
  currSubject!:string|null;
  constructor(private route:ActivatedRoute ,private serv:DataServiceService){
    this.route.paramMap.subscribe(val=>{
      this.currSubject=val.get('subjectName')
      this.currSubData = this.serv.SubjectsData.find(sub=>sub.SubjectName===this.currSubject)
      console.log(this.currSubject);
      console.log(this.currSubData);
    })
  }

}
