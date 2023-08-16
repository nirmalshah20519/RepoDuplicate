import { Injectable } from '@angular/core';
import { FormControl, Validators, FormGroup, FormArray } from '@angular/forms';
import { QuestionBase } from 'src/Models/question.genric';

@Injectable({
  providedIn: 'root'
})
export class QuestionControlService {

  toFormGroup(questions: QuestionBase<string>[] ) {
    const group: any = {};

    questions.forEach(question => {
      if(question.controlType==="checkbox"){
        group[question.key] = new FormArray([])
        question.options.forEach(o=>{
          group[question.key].push(new FormControl())
        })
      }
      else{
        group[question.key] = question.required ? new FormControl(question.value ?? '', Validators.required)
        : new FormControl(question.value ?? '');
      }
    });
    return new FormGroup(group);
  }
}