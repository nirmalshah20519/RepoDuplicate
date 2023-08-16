import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { TheatreView } from 'src/Models/Theatre';
import { TheatreStore } from 'src/Services/Theatre.store';
import { LoaderService } from 'src/Services/loader.service';
import { TheatreService } from 'src/Services/theatre.service';

@Component({
  selector: 'app-theatre-manage',
  templateUrl: './theatre-manage.component.html',
  styleUrls: ['./theatre-manage.component.css']
})
export class TheatreManageComponent {
  private theatreStore;
  theatre!:TheatreView;
  constructor(private load:LoaderService, private act:ActivatedRoute, private theatreServ:TheatreService, private router:Router) {
    this.theatreStore=new TheatreStore(theatreServ);
    this.init();

  }

  init(){
    
    this.act.paramMap.subscribe({
      next:(resp)=>{
        const tid=Number(resp.get('tid'));
        if(tid){
          this.theatreServ.setTheatreID(tid)
          this.theatreStore.getOne(tid).subscribe({
            next:(resp:any)=>{
              this.theatre=resp
              this.router.navigate(['manage-screen'], {relativeTo:this.act})
            },
            error:(err:any)=>{
              console.log(err);
            }
           });
         
          
        }
      },
      error:(err:any)=>{
        console.log(err);
      }
    });
    
  }

  goBack(){
    this.router.navigate(['../'],{relativeTo:this.act})
  }
}
