import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import { Lecture } from 'src/Models/Lecture';
import { Student } from 'src/Models/Student';
import { DataService } from 'src/Services/data.service';

@Component({
  selector: 'app-lecture-page',
  templateUrl: './lecture-page.component.html',
  styleUrls: ['./lecture-page.component.css']
})
export class LecturePageComponent {
  currCID!:number;
  constructor(private serv:DataService, private rt:ActivatedRoute, private http:HttpClient){
    rt.queryParamMap.subscribe(c=>{
      this.currCID=Number(c.get('CID'))
    })
  }

  get CurrentUser(){
    return this.serv.CurrentUser
  }

  get AttendanceData(){
    let LecData:Lecture[]=[];
    this.serv.LectureList.forEach(lec=>{
      lec.Attendance.forEach(att=>{
        if(att.SID===this.CurrentUser.ID && att.Status!==null){
          LecData.push(lec)
        }
      })
    })
    return LecData
  }

  getAttByID(lec:Lecture,id:number){
    return lec.Attendance.find(a=>a.SID===id)?.Status as boolean|null
  }

}
