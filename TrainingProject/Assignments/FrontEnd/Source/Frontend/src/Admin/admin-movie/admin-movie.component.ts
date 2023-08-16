import { Component } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { tap } from 'rxjs';
import { CastList } from 'src/Models/Cast';
import { GenreLang } from 'src/Models/GenreLang';
import { movieData, role } from 'src/Models/Movie';
import { CloudinaryService } from 'src/Services/cloudinary.service';
import { LoaderService } from 'src/Services/loader.service';
import { MovieService } from 'src/Services/movie.service';
import { UploadService } from 'src/Services/upload.service';

@Component({
  selector: 'app-admin-movie',
  templateUrl: './admin-movie.component.html',
  styleUrls: ['./admin-movie.component.css']
})
export class AdminMovieComponent {
  green=false;
  message=''
  loadFlag:boolean=false;
  PosterFile!:File;
  TrailerFile!:File;
  postData!:movieData
  MovieEntry!:FormGroup;
  Gen!:number
  Lang!:number
  tempGen:number[]=[]
  tempLang:number[]=[]
  allGen:GenreLang[]=[]
  allLang:GenreLang[]=[]
  masterGen:GenreLang[]=[]
  masterLang:GenreLang[]=[]


  castNames:CastList[]=[]
  roleNames:CastList[]=[]
  castName!:number
  roleName!:number
  addedRoles:role[]=[]

  
  constructor(private router:Router, private fb:FormBuilder, private movie:MovieService, private cloudinary:CloudinaryService, private loader:LoaderService, private upload:UploadService){
    this.MovieEntry = this.fb.group({
      MovieName:['', [Validators.required]],
      Description:['', [Validators.required]],
      ReleaseDate:['', [Validators.required]],
      IMDB:['', [Validators.required]],
      DurationHr:['', [Validators.required]],
      DurationMin:['', [Validators.required]],
      Poster:['', [Validators.required]],
      Trailer:['', [Validators.required]]
    })
    this.postData={...this.MovieEntry.value}
    this.movie.getGenres().subscribe(
      {
        next:(data:GenreLang[])=>{
          this.masterGen=data
          this.allGen=this.masterGen
        },
        error:(err:any)=>{
          console.log(err);
        }
      }
    );

    this.movie.getLanguages().subscribe(
      {
        next:(data:GenreLang[])=>{
          this.masterLang=data
          this.allLang=this.masterLang
        },
        error:(err:any)=>{
          console.log(err);
        }
      }
    );

    this.movie.getCastlist().subscribe({
      next:(data:CastList[])=>{
        this.castNames=data
      },
      error:(err:any)=>{
        console.log(err);
      }
    });

    this.movie.getRoleData().subscribe({
      next:(data:CastList[])=>{
        this.roleNames=data
      },
      error:(err:any)=>{
        console.log(err);
      }
    })
  }

  addGenre(){
    let id=Number(this.Gen)
    this.tempGen.push( id )
    this.allGen=this.allGen.filter(g=>g.id!==id)
    console.log(this.allGen);
  }
  removeG(id:number){
    this.allGen.push(this.getGbyID(id))
    this.tempGen=this.tempGen.filter(l=>l!==id)
  }

  addLang(){
    let id=Number(this.Lang)
    this.tempLang.push(id)
    this.allLang=this.allLang.filter(l=>l.id!==id)
    console.log(this.addLang);
  }
  removeL(id:number){
    console.log(id);
    this.allLang.push(this.getLbyID(id))
    this.tempLang=this.tempLang.filter(l=>l!==id)
  }

  getGbyID(id:number):GenreLang{
    return this.masterGen.find(g=>g.id===id) as GenreLang
  }

  getLbyID(id:number):GenreLang{
    return this.masterLang.find(g=>g.id===id) as GenreLang
  }

  getRbyID(id:number):CastList{
    return this.roleNames.find(r=>r.id===Number(id)) as CastList
  }

  getCbyID(id:number):CastList{
    return this.castNames.find(c=>c.id===Number(id)) as CastList
  }

  addCast(){
    console.log();
    let cast:role={cid:this.castName,rid:this.roleName}
    let isExist = this.addedRoles.find(r=>r.cid===cast.cid && r.rid===cast.rid);
    console.log(isExist);
    if(isExist===null || isExist===undefined){
      this.addedRoles.push(cast)
    }
    console.log(this.addedRoles);
  }
  removeAR(cid:number, rid:number){
    this.addedRoles= this.addedRoles.filter(ar=>ar.cid!==cid || ar.rid!==rid)
  }

  onTrailerSelected(event:any){
    this.TrailerFile=event.target.files[0];
    this.loader.setFlag(true)
    this.upload.UploadTrailer(this.TrailerFile).subscribe({
      next:(resp:any)=>{
        console.log(resp);
        this.postData.Trailer=resp?.url
        this.loader.setFlag(false)
      },
      error:(err:any)=>{
        console.log(err);
        this.loader.setFlag(false)
      }
    });
  }

  onPosterSelected(event:any){
    this.PosterFile=event.target.files[0];
    this.loader.setFlag(true)
    this.upload.UploadPoster(this.PosterFile).subscribe({
      next:(resp:any)=>{
        console.log(resp);
        this.postData.Poster=resp?.url
        this.loader.setFlag(false)
      },
      error:(err:any)=>{
        console.log(err);
        this.loader.setFlag(false)
      }
    })
  }

  onSubmit(){
    this.loader.setFlag(true)
    let form=this.MovieEntry.value
    form.Poster=this.postData.Poster
    form.Trailer=this.postData.Trailer
    let Genre=this.tempGen
    let Language=this.tempLang
    let Casts = this.addedRoles
    this.postData={...form, Genre, Language, Casts }
    console.log(this.postData);
    this.movie.postMovie(this.postData).subscribe({
      next:(resp:any)=>{
        console.log(resp);
        this.loader.setFlag(false);
        this.MovieEntry.reset();
        this.addedRoles=[];
        this.tempGen=[];
        this.tempLang=[];
        this.TrailerFile={} as File;
        this.PosterFile={} as File;
        this.message=resp.message
          this.green=true;
          setTimeout(() => {
            this.message=''
            this.green=false;
            this.router.navigate(['./movielist']).catch((err)=>{console.log(err);})
          }, 2000);
        
      },
      error:(err:any)=>{
        console.log(err);
        this.loader.setFlag(false)
      }
    })
  }


}
