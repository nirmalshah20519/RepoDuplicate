import { Component, Input } from '@angular/core';
import { student } from 'src/Model/student';
import { subject } from 'src/Model/subject';

@Component({
  selector: 'app-result',
  templateUrl: './result.component.html',
  styleUrls: ['./result.component.css']
})
export class ResultComponent {
  @Input() currentStudent!: student;

  totalMarks(marksData:subject){
    return (marksData.marks.internal*0.3)+(marksData.marks.external*0.7);    
  }

  average(allMarksData:subject[]){
    let sum=0
    allMarksData.forEach(ele=>{
      let subTotal=(ele.marks.internal*0.3)+(ele.marks.external*0.7)
      sum+=subTotal
    })
    return sum/allMarksData.length
  }

  bgClass(avg:number){
    const str='text-light '
    return str+((avg>50)?'bg-success':'bg-danger');
  }

  str:string=' h1 text-center'

}
