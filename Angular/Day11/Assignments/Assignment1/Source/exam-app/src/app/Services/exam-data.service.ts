import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Question } from '../Model/Questions';
import { Response } from '../Model/Response';

@Injectable({
  providedIn: 'root'
})
export class ExamDataService {
  private Responses:Response[]=[];
  noOfQuestions:number=0;
  flag!:boolean;
  constructor(private http:HttpClient) { 

  }
  getQuestions():Observable<Question[]>{
    return this.http.get<Question[]>('assets/ExamQuestions.json');
  }

  addResponse(resp:Response){
    this.Responses.push(resp);
  }

  get userResponses(){
    return this.Responses;
  }
}
