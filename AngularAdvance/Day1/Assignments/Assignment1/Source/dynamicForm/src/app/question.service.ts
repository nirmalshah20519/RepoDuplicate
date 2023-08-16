import { Injectable } from '@angular/core';
import { of } from 'rxjs';
import { QuestionBase } from 'src/Models/question.genric';
import { CheckboxQuestion, DropdownQuestion, RadioButtonQuestion, TextboxQuestion } from 'src/Models/question.types';

@Injectable({
  providedIn: 'root'
})
export class QuestionService {

  constructor() { }

  getQuestions(){
    const questions:QuestionBase<string>[] = [
      new TextboxQuestion({
        key:"Name",
        label:"Name",
        value:'',
        required:true,
        type:'text',
        order:1
      }),
      new TextboxQuestion({
        key:"Street",
        label:"Street",
        value:'',
        type:'text',
        order:2
      }),
      new DropdownQuestion({
        key:"City",
        label:"City",
        options: [
          {key: 'Ahmedabad',  value: 'Ahmedabad'},
          {key: 'Surat',  value: 'Surat'},
          {key: 'Delhi',   value: 'Delhi'},
          {key: 'Banglore', value: 'Banglore'}
        ],
        required:true,
        order:3
      }),
      new CheckboxQuestion({
        key:'Hobbies',
        label:'Hobbies',
        options:[
          {key:'Cricket', value:true},
          {key:'Movies', value:false},
          {key:'Football', value:false},
          {key:'Music', value:false},
        ],
        order:4
      }),
      new RadioButtonQuestion({
        key:'Gender',
        label:'Gender',
        options:[
          {key:'Male', value:'Male'},
          {key:'Female', value:'Female'}
        ],
        order:5
      })
    ];

    return of(questions.sort((a,b)=>a.order-b.order))
  }
}
