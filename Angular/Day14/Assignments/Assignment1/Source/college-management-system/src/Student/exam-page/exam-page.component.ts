import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Exam } from 'src/Models/Exam';
import { Lecture } from 'src/Models/Lecture';
import { DataService } from 'src/Services/data.service';

@Component({
  selector: 'app-exam-page',
  templateUrl: './exam-page.component.html',
  styleUrls: ['./exam-page.component.css']
})
export class ExamPageComponent {
  currCID!:number;
  constructor(private serv:DataService, private rt:ActivatedRoute){
    rt.queryParamMap.subscribe(c=>{
      this.currCID=Number(c.get('CID'))
    })
  }

  get CurrentUser(){
    return this.serv.CurrentUser
  }

  get ExamData(){
    let ExData:Exam[]=[];
    this.serv.ExamList.forEach(ex=>{
      ex.Score.forEach(sc=>{
        if(sc.SID===this.CurrentUser.ID && sc.Score!==null){
          ExData.push(ex)
        }
      })
    })
    return ExData
  }

  getScByID(ex:Exam,id:number){
    return ex.Score.find(a=>a.SID===id)?.Score as number|null
  }

}
