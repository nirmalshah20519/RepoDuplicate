import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Cast, CastList, cast } from 'src/Models/Cast';
import { GenreLang } from 'src/Models/GenreLang';
import { Movie, movieData } from 'src/Models/Movie';
import { AccountService } from './account.service';

@Injectable({
  providedIn: 'root'
})
export class MovieService {
URL:string="https://localhost:7133/api"
private createHeaders(): HttpHeaders {
  const token=`Bearer ${this.auth.getToken()}`
  const headers = new HttpHeaders({
    'Content-Type': 'application/json',
    Authorization: token
  });
  return headers;
}
  constructor(private http:HttpClient, private auth:AccountService) { 

  }

  getGenres(){
    const h=this.createHeaders()
    return this.http.get<GenreLang[]>(this.URL+"/Movies/Genres");
  }

  getLanguages():Observable<GenreLang[]>{
    return this.http.get<GenreLang[]>(this.URL+"/Movies/Languages");
  }

  postCast(castData:Cast){
    return this.http.post(this.URL+"/Casts",castData);
  }

  postMovie(movie:movieData){
    return this.http.post(this.URL+"/Movies",movie);
  }

  getMovies(){
    return this.http.get<Movie[]>(this.URL+"/Movies")
  }

  getCastlist():Observable<CastList[]>{
    return this.http.get<CastList[]>(this.URL+"/Casts/CastList")
  }

  getCastData():Observable<cast[]>{
    return this.http.get<cast[]>(this.URL+"/Casts/Castdata")
  }
  getRoleData():Observable<CastList[]>{
    return this.http.get<CastList[]>(this.URL+"/Movies/Rolelist")
  }

  getMovieByID(id:number){
    return this.http.get<Movie>(this.URL+"/Movies/"+id)
  }

  getRequestedMovies(userId:number){
    return this.http.get<Movie[]>(this.URL+"/Movies/requested/"+userId)
  }

  getAppeovedMovies(userId:number){
    return this.http.get<Movie[]>(this.URL+"/Movies/approved/"+userId)
  }
  
}
