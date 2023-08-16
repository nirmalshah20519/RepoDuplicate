import { Component } from '@angular/core';
import { Observable } from 'rxjs';
import { Movie } from 'src/Models/Movie';
import { AccountService } from 'src/Services/account.service';
import { LoaderService } from 'src/Services/loader.service';
import { MovieService } from 'src/Services/movie.service';

@Component({
  selector: 'app-movie-access',
  templateUrl: './movie-access.component.html',
  styleUrls: ['./movie-access.component.css']
})
export class MovieAccessComponent {
  Movies:Observable<Movie[]>
  RequestedMovies:Observable<Movie[]>
  ApprovedMovies:Observable<Movie[]>
  userId:number
  constructor(private load:LoaderService, private movieServ:MovieService, private accountSerc:AccountService){
    this.userId=Number(accountSerc.getPayload()?.primarysid)
    this.Movies=movieServ.getMovies()
    this.RequestedMovies=movieServ.getRequestedMovies(this.userId)
    this.ApprovedMovies=movieServ.getAppeovedMovies(this.userId)
    console.log(this.Movies);
  }

  modalOpen: boolean = false;
  currentTrailerLink: string = '';
  currentPosterLink: string = '';
  
  openModal(movie: Movie) {
    this.currentTrailerLink = movie.trailerLink;
    this.currentPosterLink = movie.posterLink;
    this.modalOpen = true;
  }
  
  closeModal() {
    this.modalOpen = false;
  }



  // delete  


  currentFilter: 'all' | 'requested' | 'approved' = 'all';

  setFilter(filter: 'all' | 'requested' | 'approved') {
    this.currentFilter = filter;
  }
  

}
