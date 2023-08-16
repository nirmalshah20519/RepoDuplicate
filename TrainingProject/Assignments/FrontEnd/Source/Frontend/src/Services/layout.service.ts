import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { LoaderService } from './loader.service';
import { LayoutPost, SeatType } from 'src/Models/Layout.model';

@Injectable({
  providedIn: 'root'
})
export class LayoutService {

  constructor(private http:HttpClient, private load:LoaderService) { }

  private URL="https://localhost:7133/api/Layout/";

  getSeatTypes(){
    return this.http.get<SeatType[]>(this.URL+'seattypes')
  }

  addLayout(p:LayoutPost){
    return this.http.post(this.URL+'addlayout',p)
  }

  checkLayoutExists(sid:number){
    return this.http.get(this.URL+`LayoutExists/${sid}`)
  }
}
