import { Component, Input } from '@angular/core';
import { Subject } from 'src/Model/Interfaces';

@Component({
  selector: 'app-leftbar',
  templateUrl: './leftbar.component.html',
  styleUrls: ['./leftbar.component.css']
})
export class LeftbarComponent {
  @Input() SubjectInfo!:Subject|undefined
}
