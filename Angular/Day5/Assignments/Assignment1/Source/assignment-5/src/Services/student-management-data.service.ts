import { Injectable } from '@angular/core';
import { StudentDetail } from 'src/Models/StudentDetails';

@Injectable({
  providedIn: 'root'
})
export class StudentManagementDataService {
  studentDetail:StudentDetail[]=[]
  constructor() {}

   get Students(){
    return this.studentDetail
   }

   AddStudent(stu:StudentDetail){
    this.studentDetail.push(stu);
   }
}

