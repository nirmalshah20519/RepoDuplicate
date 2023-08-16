import { Component } from '@angular/core';
import { ExamDataService } from '../Services/exam-data.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-result',
  templateUrl: './result.component.html',
  styleUrls: ['./result.component.css']
})
export class ResultComponent {
  perc!:number;
  Correct:number=0
  constructor(private serv:ExamDataService, private router:Router){
    this.perc=this.calcResult();

    window.onload=function(){
      router.navigateByUrl('')

    }
  }

  calcResult():number{
    let rightCount=0
    this.serv.userResponses.forEach(r=>{
      if(r.Answer===r.Response){
        rightCount++;
      }
    });
    this.Correct=rightCount
    return (rightCount/this.serv.noOfQuestions)*100
  }

  navigateToHome(){
    this.router.navigateByUrl('')
  }

  get Resp(){
    return this.serv.userResponses.length
  }

  get TotalQue(){
    return this.serv.noOfQuestions
  }
  

}
