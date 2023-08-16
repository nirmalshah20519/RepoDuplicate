import { Component } from '@angular/core';
import { Movie } from 'src/Models/Movie';
import { MovieService } from 'src/Services/movie.service';

@Component({
  selector: 'app-movies-display',
  templateUrl: './movies-display.component.html',
  styleUrls: ['./movies-display.component.css']
})
export class MoviesDisplayComponent {

  allMovies:Movie[]=[];

  constructor(private movie:MovieService){
    this.movie.getMovies().subscribe({
      next:(resp:Movie[])=>{
        this.allMovies=resp;
      }
    })
  }
}
