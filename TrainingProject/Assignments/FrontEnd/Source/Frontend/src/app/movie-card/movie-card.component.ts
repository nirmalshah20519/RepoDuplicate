import { Component, Input } from '@angular/core';
import { Router } from '@angular/router';
import { Movie } from 'src/Models/Movie';

@Component({
  selector: 'app-movie-card',
  templateUrl: './movie-card.component.html',
  styleUrls: ['./movie-card.component.css']
})
export class MovieCardComponent {
  @Input() movie!:Movie

  constructor(private route:Router){

  }

  onClick(m:Movie){
    
  }
}
