import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { LayoutGet, LayoutPost, SeatType, ShortLayout } from 'src/Models/Layout.model';
import { Screen } from 'src/Models/Screen.model';
import { LayoutService } from 'src/Services/layout.service';
import { LoaderService } from 'src/Services/loader.service';
import { ScreenService } from 'src/Services/screen.service';
import { TheatreService } from 'src/Services/theatre.service';


@Component({
  selector: 'app-screen-layout',
  templateUrl: './screen-layout.component.html',
  styleUrls: ['./screen-layout.component.css']
})
export class ScreenLayoutComponent {
  screenURL="https://2717-nirmal.s-feb23dotnet.s3.ap-south-1.amazonaws.com/BookMyShow/assets/-8585140883267906627screen.png"
sid!:number
currScreen!:Screen
seatTypes:SeatType[]=[]
layoutForm:FormGroup=this.fb.group({})
previewData: { [key: string]: { [key: string]: number[] } }={};
keys:string[]=[]
VIEW_FLAG:boolean=true
ScreenLayout:LayoutGet[]=[]
  constructor(private load:LoaderService, private act:ActivatedRoute, private screenServ:ScreenService, private router:Router, private layoutServ:LayoutService, private fb:FormBuilder){
    this.init()
    this.getSeatTypes();

    Object.defineProperty(this.previewData, "areInnerObjectsEmpty", {
      get: function() {
        for (const key in this) {
          if (typeof this[key] === "object" && Object.keys(this[key]).length !== 0) {
            return false;
          }
        }
        return true;
      }
    });

  }
  seedForm(){
    this.seatTypes.forEach(s=>{
      this.layoutForm.addControl(s.id.toString(),this.fb.group({
        rows:[0,[Validators.min(0), Validators.max(26)]],
        seats:[0,[Validators.min(0)]]
      }))
    })
  }
  goBack(){
    this.router.navigate(['../'],{relativeTo:this.act})
  }

  get GrandTotal(){
    let total = 0;
    this.seatTypes.forEach(s=>{
      total+=this.Total(s.id)
    })
    return total
  }

  init(){
    
    this.act.paramMap.subscribe({
      next:(resp)=>{
        const sid=Number(resp.get('sid'));
        console.log("sid is : "+sid);
        this.sid=sid
        if(sid){
          this.CheckExists(sid)
          this.screenServ.getOne(sid).subscribe({
            next:(resp:any)=>{
              this.currScreen=resp

              // this.router.navigate(['manage-screen'], {relativeTo:this.act})
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

  getSeatTypes(){
    this.load.setFlag(true)
    this.layoutServ.getSeatTypes().subscribe({
      next:(resp:SeatType[])=>{
        this.seatTypes=resp
        this.seedForm();
        this.load.setFlag(false)
      },
      error:(err:any)=>{
        console.log(err);
        this.load.setFlag(false)
      }
    })
  }

  Total(sid:number){
    const g = this.layoutForm.get(sid.toString())
    const rows = g?.get('rows')?.value
    const seats = g?.get('seats')?.value
    return Number(rows)*Number(seats)
  }

  onPreview(){
    
    const layout=this.layoutForm.value
    this.keys = Object.keys(layout);    
    for (const key in layout) {
      if (layout.hasOwnProperty(key)) {
        const {rows, seats} = layout[key];
        this.previewData[key]={}

        for (let row = 1; row <= rows; row++) {
          const r = this.numToChar(row);
          if(seats){
            this.previewData[key][r]=Array.from({length:seats},(_,i)=>i+1)          
          }
        }        
      }
    }
    this.openModal()
  }

  modalOpen = false;
  modalOpen2 = false;
  openModal() {
    this.modalOpen = true;
    document.body.classList.add('modal-active');
  }

  closeModal() {
    this.modalOpen = false;
    document.body.classList.remove('modal-active');
  }

  openModal2() {
    this.modalOpen2 = true;
    document.body.classList.add('modal-active');
  }

  closeModal2() {
    this.modalOpen2 = false;
    document.body.classList.remove('modal-active');
  }

  numToChar(num:number){
    if(num>=1 && num<=26){
      return String.fromCharCode(64+num)
    }
    else{
      return 'NA'
    }
  }

  getSeatTypeName(id:any){
    let ID=Number(id)
    return this.seatTypes.find(s=>s.id===ID)?.name
  }

  onPostLayout(){
    this.load.setFlag(true)
    let postLayout:LayoutPost={
      sid:this.sid,
      layout:this.layoutForm.value as ShortLayout
    }
    this.layoutServ.addLayout(postLayout).subscribe({
      next:(resp:any)=>{
        console.log(resp);
        this.load.setFlag(false)
        this.CheckExists(this.sid)
      },
      error:(err:any)=>{
        console.log(err);
        this.load.setFlag(false)
      }
    })
    
    this.layoutForm.reset()
    this.closeModal()
  }

  

  CheckExists(sid:number){
    this.layoutServ.checkLayoutExists(sid).subscribe({
      next:(resp:any)=>{
        console.log(resp);
        this.ScreenLayout=resp
        this.VIEW_FLAG=false
      },
      error:(err:any)=>{
        console.log(err);
        this.VIEW_FLAG=true
      }
    })
  }


  ///  getter for post layout

  

}
