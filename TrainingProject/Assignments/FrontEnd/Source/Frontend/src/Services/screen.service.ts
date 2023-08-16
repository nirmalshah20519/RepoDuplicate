import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject, map } from 'rxjs';
import { Screen, ScreenModel, ScreenType } from 'src/Models/Screen.model';
import { TheatreService } from './theatre.service';

@Injectable({
  providedIn: 'root'
})
export class ScreenService {
  private screens$:BehaviorSubject<Screen[]>;
  tid!:number
  constructor(private http:HttpClient, private theatreServ:TheatreService) { 
    this.screens$=new BehaviorSubject<Screen[]>([])
    this.setScreens()
  }
private URL:string="https://localhost:7133/api/Screen/"
  get ScreenTypes(){
    return this.http.get<ScreenType[]>(this.URL+"screentypes")
  }

  setScreens(){
    this.setTID();
    this.getScreens(this.tid).subscribe({
      next:(resp:any)=>{
        this.screens$.next(resp)
    },
    error:(err:any)=>{
        console.log(err);
    }
    })
  }

  get Screens(){
    return this.screens$.asObservable()
  }

  setTID(){
    this.theatreServ.TheatreID.subscribe(t=>{
      this.tid=t
    })
  }

  addScreen(s:ScreenModel){
    return this.http.post(this.URL+'add',s)
  }

  getScreens(tid:number){
    return this.http.get(this.URL+`all/${tid}`)
  }

  getOne(sid:number){
    return this.Screens.pipe(
      map((screens:Screen[])=>screens.find(s=>s.id===sid))
    )
  }
}
