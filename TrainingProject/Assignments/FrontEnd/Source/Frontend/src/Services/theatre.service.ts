import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Facility, Theatre, TheatreView } from 'src/Models/Theatre';
import { AccountService } from './account.service';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class TheatreService {
  private theatreId$:BehaviorSubject<number>
  URL:string="https://localhost:7133/api/Theatre/"
  constructor(private http:HttpClient, private accountServ:AccountService) { 
    this.theatreId$=new BehaviorSubject<number>(-1)
  }

  get TheatreID(){
    return this.theatreId$.asObservable()
  }

  setTheatreID(tid:number){
    this.theatreId$.next(tid)
  }

  addFacility(d:Facility){
    return this.http.post(this.URL+'add',d)
  }

  getFacilities(){
    return this.http.get<Facility[]>(this.URL+"facilities")
  }

  // addTheatre

  addTheatre(d:Theatre){
    return this.http.post(this.URL+'addTheatre',d)
  }

  getTheatres(){
    const uid=this.accountServ.getPayload()?.primarysid;
    return this.http.get<TheatreView[]>(this.URL+`theatres/${uid}`)

  }
}
