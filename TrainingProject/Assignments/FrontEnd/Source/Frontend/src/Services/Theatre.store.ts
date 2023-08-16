import { BehaviorSubject, map } from "rxjs";
import { TheatreView } from "src/Models/Theatre";
import { TheatreService } from "./theatre.service";
import { Injectable } from "@angular/core";

export interface AppState{
    theatres:TheatreView[]
}
@Injectable()
export class TheatreStore{
    private theatres$:BehaviorSubject<AppState>;
    constructor(private theatreServ:TheatreService){
        const initialtheatres:AppState={theatres:[]} ;
        this.theatres$=new BehaviorSubject<AppState>(initialtheatres);
        this.setTheatres()
    }

    getTheatres(){
        this.setTheatres()
        return this.theatres$.asObservable();
    }

    setTheatres():void{
        // const upDatedTheatres=[...currTheatre]
        this.theatreServ.getTheatres().subscribe({            
            next:(resp:TheatreView[])=>{
                this.theatres$.next({theatres:resp})
            },
            error:(err:any)=>{
                console.log(err);
            }
        })
    }

    getOne(tid:number){
        
      return this.getTheatres().pipe(        
        map((state:AppState)=>state.theatres.find(t=>t.id==tid))
      )
    //   return CurrTheatres.find(t=>t.id==11)
    }
    
}