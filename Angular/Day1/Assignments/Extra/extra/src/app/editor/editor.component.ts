import { Component } from '@angular/core';

@Component({
  selector: 'app-editor',
  templateUrl: './editor.component.html',
  styleUrls: ['./editor.component.css']
})
export class EditorComponent {
  TAclass:string="form-control bg-dark text-light";
  BoldBtnClass:string="btn btn-outline-light me-3 fw-bold"
  ItalicBtnClass:string="btn btn-outline-light me-3 fst-italic"
  BoldFlag:boolean=false;
  ItalicFlag:boolean=false;

  
  handleBoldBtn(){
    this.BoldFlag=!this.BoldFlag
    if(this.BoldFlag){
      this.TAclass=this.ItalicFlag? "form-control bg-dark text-light fw-bold fst-italic":"form-control bg-dark text-light fw-bold";
      this.BoldBtnClass="btn btn-light me-3 fw-bold"
    }else{
      this.TAclass=this.ItalicFlag? "form-control bg-dark text-light fst-italic":"form-control bg-dark text-light";
      this.BoldBtnClass="btn btn-outline-light me-3 fw-bold"
    }
  }

  handleItalicBtn(){
    this.ItalicFlag=!this.ItalicFlag
    if(this.ItalicFlag){
      this.TAclass=this.BoldFlag? "form-control bg-dark text-light fw-bold fst-italic":"form-control bg-dark text-light fst-italic";
      this.ItalicBtnClass="btn btn-light me-3 fst-italic"
    }else{
      this.TAclass=this.BoldFlag? "form-control bg-dark text-light fw-bold":"form-control bg-dark text-light";
      this.ItalicBtnClass="btn btn-outline-light me-3 fst-italic"
    }
  }
}
