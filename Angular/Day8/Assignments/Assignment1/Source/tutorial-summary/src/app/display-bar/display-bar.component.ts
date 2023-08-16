import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Task } from 'src/Model/Interfaces';
import { DataServiceService } from '../Services/data-service.service';
import { DomSanitizer } from '@angular/platform-browser';




@Component({
  selector: 'app-display-bar',
  templateUrl: './display-bar.component.html',
  styleUrls: ['./display-bar.component.css']
})
export class DisplayBarComponent {
  currTaskData:Task|undefined
  currTask!:string|null;
  currSubject!:string|null;
  TaskType!:string|null;
  constructor(private route:ActivatedRoute ,private serv:DataServiceService, public sanitizer:DomSanitizer){
    this.route.queryParamMap.subscribe(query=>{
      this.currSubject=query.get('Name');
      this.TaskType=query.get('TaskType')
    })
    this.route.paramMap.subscribe(val=>{
      console.log(this.route);
      this.currTask=val.get('taskName')
      console.log(this.currTask);
      this.currTaskData=this.serv.SubjectsData.find(sub=>sub.SubjectName===this.currSubject)?.SubjectData.find(Task=>Task.TaskType===this.TaskType)?.TaskDetails.find(t=>t.Name===this.currTask);
      console.log(this.currTaskData);
    })
  }
}
