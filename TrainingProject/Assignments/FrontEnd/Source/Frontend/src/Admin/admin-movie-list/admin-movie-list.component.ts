import { Component } from '@angular/core';
import { cast } from 'src/Models/Cast';
import { Movie } from 'src/Models/Movie';
import { MovieService } from 'src/Services/movie.service';

@Component({
  selector: 'app-admin-movie-list',
  templateUrl: './admin-movie-list.component.html',
  styleUrls: ['./admin-movie-list.component.css']
})
export class AdminMovieListComponent {
  CastList:cast[]=[]
  Moviedata:Movie[]=[]

  constructor(private movieService:MovieService){
    this.seedMovies();
  }

  seedMovies(){
    this.movieService.getMovies().subscribe({
      next:(resp:Movie[])=>{
        this.Moviedata=resp
        console.log(this.Moviedata);
      }
    })
  }

  itemsPerPage = 5;
  currentPage = 1;
}
