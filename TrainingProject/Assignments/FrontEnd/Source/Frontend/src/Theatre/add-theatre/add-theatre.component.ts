import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Facility, Theatre } from 'src/Models/Theatre';
import { AccountService } from 'src/Services/account.service';
import { LoaderService } from 'src/Services/loader.service';
import { TheatreService } from 'src/Services/theatre.service';
import { UploadService } from 'src/Services/upload.service';

@Component({
  selector: 'app-add-theatre',
  templateUrl: './add-theatre.component.html',
  styleUrls: ['./add-theatre.component.css']
})
export class AddTheatreComponent {
  theatreData!:Theatre
  theatreForm!:FormGroup
  facilityForm!:FormGroup
  facName!:string
  facIcon!:File
  currFid:number=-1
facilities:Facility[]=[]
facPost:number[]=[]
  facData:Facility={
    id:-1,
    name:'',
    url:''
  }
  fac:number[]=[]
  get Userid(){
    const p = this.accountServ.getPayload()
    return p?.primarysid
  }

  getFacById(id:number){
    return this.facilities.find(f=>f.id===id)
  }
  removeFac(id:number){
    let i=this.facPost.findIndex(f=>f===id);
    if(i!==-1){
      this.facPost.splice(i,1)
    }
    this.fac.push(id)
  }
  constructor(private load:LoaderService, private router:Router, private fb:FormBuilder, private theatreServ:TheatreService, private accountServ:AccountService, private upload:UploadService, private act:ActivatedRoute) {
    this.theatreForm=fb.group({
      uid:[this.Userid,[Validators.required]],
      name:['',[Validators.required]],
      street:['',[Validators.required]],      
      city:['',[Validators.required]],
      state:['',[Validators.required]],
      country:['',Validators.required],
      minprice:['',[Validators.required, Validators.min(50)]]
    })

    this.get()

    
  }

  onSelected(event:any){
    this.facIcon=event.target.files[0]
    this.load.setFlag(true)
    this.upload.UploadFacility(this.facIcon).subscribe({
      next:(resp:any)=>{
        console.log(resp);
        this.facData.url=resp.url
        this.load.setFlag(false)
      },
      error:(err:any)=>{
        console.log(err);
        this.load.setFlag(false)
      }
    })
  }

  get(){
    this.theatreServ.getFacilities().subscribe({
      next:(resp:any)=>{
        this.facilities=resp
        this.facilities.forEach(f=>{
          this.fac.push(f.id)
        })
      },
      error:(err:any)=>{
        console.log(err);
      }
    })
  }

  onSubmit(){
    this.load.setFlag(true)
    this.theatreData=this.theatreForm.value;
    this.theatreData.facilities=this.facPost
    console.log(this.theatreData);
    this.facPost=[];
    this.get();
    this.theatreForm.reset();
    this.theatreServ.addTheatre(this.theatreData).subscribe({
      next:(resp:any)=>{
        console.log(resp);
        this.load.setFlag(false)
        this.router.navigate(['../my-theatres'],{relativeTo:this.act})
      },
      error:(err:any)=>{
        console.log(err);
        this.load.setFlag(false)
      }
    })
  }

  onAddFac(){
    let currFid=Number(this.currFid)
    this.facPost.push(currFid)
    let i=this.fac.findIndex(f=>f===currFid);
    if(i!==-1){
      this.fac.splice(i,1)
    }
  }

}
