import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Screen, ScreenModel, ScreenType } from 'src/Models/Screen.model';
import { AccountService } from 'src/Services/account.service';
import { LoaderService } from 'src/Services/loader.service';
import { ScreenService } from 'src/Services/screen.service';
import { TheatreService } from 'src/Services/theatre.service';

@Component({
  selector: 'app-manage-screen',
  templateUrl: './manage-screen.component.html',
  styleUrls: ['./manage-screen.component.css'],
})
export class ManageScreenComponent{
  CurrTid!:number
  ScreenForm!:FormGroup
  screenTypes:ScreenType[]=[]
  Screens:Screen[]=[]
  get Userid(){
    const p = this.accountServ.getPayload()
    return p?.primarysid
  }
  constructor(private accountServ:AccountService, private load:LoaderService, private act:ActivatedRoute, private theatreServ:TheatreService, private router:Router, private fb:FormBuilder, private screenServ:ScreenService) {
    this.init();
    this.getscreentypes()
    this.getScreens()
    this.ScreenForm=fb.group({
      uid:[this.Userid],
      tid:[this.CurrTid],
      name:['',[Validators.required]],
      type:['-1',[Validators.required, Validators.min(0)]]
    })
    
  }

  modalOpen = false;
  openModal() {
    this.modalOpen = true;
    document.body.classList.add('modal-active');
  }

  closeModal() {
    this.modalOpen = false;
    document.body.classList.remove('modal-active');
  }

  init(){
    this.theatreServ.TheatreID.subscribe(t=>{      
      this.CurrTid=t
    })
  }

  getscreentypes(){
    this.load.setFlag(true)
    this.screenServ.ScreenTypes.subscribe({
      next:(resp:ScreenType[])=>{
        this.screenTypes=resp
        
        this.load.setFlag(false)
      },
      error:(err:any)=>{
        console.log(err);
        this.load.setFlag(false)
      }
    })
  }

  getScreens(){
    this.load.setFlag(true)
    this.screenServ.setTID();
    this.screenServ.setScreens();
    this.screenServ.Screens.subscribe(r=>{
      this.Screens=r
      this.load.setFlag(false)
    })
    
  }

  onSubmit(){
    this.load.setFlag(true)
    let s:ScreenModel=this.ScreenForm.value
    this.screenServ.addScreen(s).subscribe({
      next:(resp:any)=>{
        console.log(resp);
        this.load.setFlag(false)
        this.closeModal()
        this.resetForm();
        this.getScreens();
      },
      error:(err:any)=>{
        console.log(err);
        this.load.setFlag(false)
      }
    })
  }

  resetForm(){
        this.ScreenForm.reset()
        this.ScreenForm.get('name')?.setValue('')
        this.ScreenForm.get('type')?.setValue('-1')
        this.ScreenForm.get('tid')?.setValue(this.CurrTid)
        this.ScreenForm.get('uid')?.setValue(this.Userid)
  }

  onManageScreen(sid:number){
    // console.log("sid : "+sid);
    this.router.navigate([sid],{relativeTo:this.act})
  }


}
