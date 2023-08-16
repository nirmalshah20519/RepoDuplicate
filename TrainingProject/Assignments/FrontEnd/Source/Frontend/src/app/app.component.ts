import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { CloudinaryService } from '../Services/cloudinary.service';
import { LoaderService } from 'src/Services/loader.service';
import { AccountService } from 'src/Services/account.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
})
export class AppComponent {
  title = 'Frontend';
  SelectedFile!: File;
  POSTER_PRESET:string='posters';
  TRAILER_PRESET:string='trailers';
  constructor(private http: HttpClient, private cloudinary:CloudinaryService, private load:LoaderService, private accountServ:AccountService, private router:Router) {
    accountServ.testServer().subscribe({
      next:(resp:any)=>{
        let pyload = this.accountServ.getPayload()
        if(pyload){
          if(pyload.role.toLowerCase()==='admin'){
            this.router.navigate(['admin','movielist']).catch((err)=>{console.log(err);})
          }
          if(pyload.role.toLowerCase()==='theatreadmin'){
            this.router.navigate(['theatre-admin']).catch((err)=>{console.log(err);})
          }
        }
      },
      error:(err:any)=>{
        console.log(err);
        router.navigateByUrl('connection-failed')
      }
    })
    
  }
  
  onFileSelected(event: Event) {
    const input = event.target as HTMLInputElement;
    this.SelectedFile = input.files?.[0] as File;
  }

  get flag(){
    return this.load.flag
  }

}
