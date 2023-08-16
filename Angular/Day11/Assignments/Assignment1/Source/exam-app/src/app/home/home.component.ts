import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { ExamDataService } from '../Services/exam-data.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent {

  constructor(private serv:ExamDataService, router:Router){
    serv.flag=false

    window.onload=function(){
      router.navigateByUrl('')
    }
  }

  

}
