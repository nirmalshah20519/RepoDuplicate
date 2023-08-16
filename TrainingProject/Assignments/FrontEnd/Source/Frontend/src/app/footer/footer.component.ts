import { Component } from '@angular/core';

@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.css']
})
export class FooterComponent {
  icons:string[]=[];

  constructor(){
    this.icons=[
      'bi bi-facebook',
      'bi bi-twitter',
      'bi bi-youtube',
      'bi bi-instagram',
      'bi bi-pinterest',
      'bi bi-linkedin'
    ]
  }
}
