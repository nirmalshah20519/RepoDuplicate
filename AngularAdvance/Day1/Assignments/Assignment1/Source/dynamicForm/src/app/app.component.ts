import { Component } from '@angular/core';
import { QuestionService } from './question.service';
import { Observable } from 'rxjs';
import { QuestionBase } from 'src/Models/question.genric';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'dynamicForm';
  questions: QuestionBase<any>[]=[];

  constructor(service: QuestionService) {
    service.getQuestions().subscribe({
      next:(resp:QuestionBase<string>[])=>{
        this.questions=resp
      }
    });
  }
}
