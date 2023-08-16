import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ExamDataService } from '../Services/exam-data.service';
import { Question } from '../Model/Questions';
import { ResponseClass } from '../Model/Response';

@Component({
  selector: 'app-question',
  templateUrl: './question.component.html',
  styleUrls: ['./question.component.css']
})
export class QuestionComponent {
  Questions:Question[]=[];
  
  currQue:Question={} as Question;
  Response:string='';
  constructor(private rt:ActivatedRoute, private serv:ExamDataService,){
    serv.getQuestions().subscribe(que=>{
      this.Questions=que;
      serv.noOfQuestions=que.length
      rt.paramMap.subscribe(route=>{
        let id=Number(route.get('ID'));
        if(id){
          let temp=this.Questions.find(q=>q.QuestionID===id);
          if(temp){
            this.currQue=temp;
          }
        }
      });
    });
  }
  get Resp(){
    return this.serv.userResponses
  }

  setFlag(bool:boolean){
    this.serv.flag=bool
  }

  addResponse(){
    if(this.Response.length>0){
      let Response=this.Response;
      let respArr=this.serv.userResponses;
      let check=respArr.find(resp=>resp.QuestionID===this.currQue.QuestionID);
      if(check){
        check.Response=Response
      }
      else{
        this.serv.addResponse({...this.currQue, Response})
      }
    }
  }

}
