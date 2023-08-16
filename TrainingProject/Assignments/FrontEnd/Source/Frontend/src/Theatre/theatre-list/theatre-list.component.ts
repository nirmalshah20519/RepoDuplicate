import { Component, OnInit } from '@angular/core';
import { TheatreView } from 'src/Models/Theatre';
import { AppState, TheatreStore } from 'src/Services/Theatre.store';
import { LoaderService } from 'src/Services/loader.service';
import { TheatreService } from 'src/Services/theatre.service';
import { Ripple,initTE} from "tw-elements";

initTE({ Ripple });

@Component({
  selector: 'app-theatre-list',
  templateUrl: './theatre-list.component.html',
  styleUrls: ['./theatre-list.component.css']
})
export class TheatreListComponent implements OnInit {
  ngOnInit(): void {
    initTE({ Ripple });
  }

  Theatres:TheatreView[]=[]

  constructor(private theatreServ:TheatreService, private load:LoaderService, private theatreStore:TheatreStore) {
    this.getTheatres()
    
    
  }

  getTheatres(){
    this.load.setFlag(true)
    this.theatreStore.getTheatres().subscribe(
      (resp:AppState)=>{
        this.Theatres=resp.theatres
        this.load.setFlag(false)
      }
    )
  }

}


