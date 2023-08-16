import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Cast } from 'src/Models/Cast';
import { CloudinaryService } from 'src/Services/cloudinary.service';
import { LoaderService } from 'src/Services/loader.service';
import { MovieService } from 'src/Services/movie.service';
import { UploadService } from 'src/Services/upload.service';

@Component({
  selector: 'app-admin-cast',
  templateUrl: './admin-cast.component.html',
  styleUrls: ['./admin-cast.component.css']
})
export class AdminCastComponent {

  loadFlag:boolean=false;
  green=false;
  message=''
  castEntry!:FormGroup
  castData:Cast={} as Cast
  ProfilePic:File|null=null;
  profile_url:string|null=null
  constructor(private router:Router, private fb:FormBuilder, private cloud:CloudinaryService, private movieService:MovieService, private loader:LoaderService, private upload:UploadService){
    this.castEntry = fb.group({
      Name:['',[Validators.required]],
      Gender:['',[Validators.required]],
      DOB:['',[Validators.required]],
      Description:['',[Validators.required]],
      City:['',[Validators.required]],
      State:['',[Validators.required]],
      Country:['',[Validators.required]],
    })
  }

  onFileSelected(event:any){
    this.ProfilePic=event.target.files[0];
    console.log(this.ProfilePic);
    this.upload.UploadProfile(this.ProfilePic as File).subscribe({
      next:(resp:any)=> {
        console.log(resp);
         this.profile_url=resp.url
      },
      error:(err) => {
        console.log(err);          
      },
    })
  }

  onSubmit(){
    this.loader.setFlag(true)
    this.castData=this.castEntry.value;
    this.castData.ProfileUrl=this.profile_url as string;
    this.profile_url=null;
    this.movieService.postCast(this.castData).subscribe(
      {
        next:(resp:any)=>{
          console.log(resp);
          this.castData={} as Cast
          this.ProfilePic={} as File
          this.castEntry.reset();
          this.ProfilePic=null
          this.loader.setFlag(false)
          this.message=resp.message
          this.green=true;
          setTimeout(() => {
            this.message=''
            this.green=false;
            this.router.navigateByUrl('/admin/castlist').catch((err:any)=>{console.log(err);})
          }, 2000);
        },
        error:(err:any)=>{
          console.log(err);
          this.loader.setFlag(false)
        }
      }
    )
  }

}
