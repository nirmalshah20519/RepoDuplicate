import { Component, EventEmitter, Input, Output } from '@angular/core';
import { student } from 'src/Model/student';

@Component({
  selector: 'app-dropdown',
  templateUrl: './dropdown.component.html',
  styleUrls: ['./dropdown.component.css']
})
export class DropdownComponent {
  @Input() data!: student[];
  @Output() dataChange = new EventEmitter<student>();
  current!:student;
  onDataChange(){
    console.log(this.current);
    this.dataChange.emit(this.current)
  }
}
