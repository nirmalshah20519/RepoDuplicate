import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { ExamComponent } from './exam/exam.component';
import { ResultComponent } from './result/result.component';
import { QuestionComponent } from './question/question.component';
import { ResultGuard } from './result.guard';

const routes: Routes = [
  {
    path: '',
    component:HomeComponent
  },
  {
    path: 'exam',
    component:ExamComponent,
    children:[
      {
        path:':ID',
        component:QuestionComponent
      }
    ]
  },
  {
    path:'result',
    component: ResultComponent,
    canActivate:[ResultGuard]
  }

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
