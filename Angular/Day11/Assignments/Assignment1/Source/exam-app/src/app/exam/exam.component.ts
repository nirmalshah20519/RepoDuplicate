import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { ExamDataService } from '../Services/exam-data.service';

@Component({
  selector: 'app-exam',
  templateUrl: './exam.component.html',
  styleUrls: ['./exam.component.css']
})
export class ExamComponent {
  Min:number=10;
  Sec:number=0;
  Ms:number=0
  Interval:any

  constructor(private serv:ExamDataService, private router:Router){

    // serv.flag=false
    window.onload=function(){
      router.navigateByUrl('')
    }
  }
  ngOnInit() {
    this.TimeCountDown()
  }
  TimeCountDown(){
    this.Interval=setInterval(()=>{
      if(this.Ms===0){
        if(this.Sec===0){
          if(this.Min===0){
            clearInterval(this.Interval)
            this.serv.flag=true;
            this.router.navigate(['/result'])
          }else{
            this.Min--;
            this.Sec=59;
          }
        }else{
          this.Sec--;
        }
        this.Ms=99;
      }else{
        this.Ms--;
      }
    },10)
  }

}
