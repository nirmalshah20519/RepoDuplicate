import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { User, registerModel } from 'src/Models/Account';
import { AuthService } from 'src/Services/auth.service';
import { UserService } from 'src/Services/user.service';

@Component({
  selector: 'app-create-user',
  templateUrl: './create-user.component.html',
  styleUrls: ['./create-user.component.css']
})
// FirstName:string,
// MiddleName:string
// LastName:string
// Email:string
// Image:File
// FlatNo:string
// Street:string
// City:string
// State:string
// Pincode:string
// InitDate:Date
export class CreateUserComponent {
  minDate!:string;
  showFlag:boolean=false;
  msg:string=""
  register!:FormGroup;
  imgFile:File|null=null;
  editUsr!:User;
  createEditFlag:boolean=false;
  constructor(private fb:FormBuilder, private auth:AuthService, private load:UserService, act:ActivatedRoute){
    this.register=fb.group({
      FirstName:['',[Validators.required]],
      MiddleName:['',[Validators.required]],
      LastName:['',[Validators.required]],
      Email:['',[Validators.required,Validators.email]],
      InitDate:['',[Validators.required]],
      FlatNo:['',[Validators.required]],
      Street:['',[Validators.required]],
      City:['',[Validators.required]],
      State:['',[Validators.required]],
      Pincode:['',[Validators.required, Validators.maxLength(6)]],
    })
    let twoMonthAgo=new Date()
    twoMonthAgo.setMonth(twoMonthAgo.getMonth()-2)
    this.minDate=twoMonthAgo.toISOString().split('T')[0]

    act.paramMap.subscribe(p=>{
      if(p.get('id')){
        console.log("inside if");
        let id:number=Number(p.get('id'));
        this.createEditFlag=true
        console.log(id);
        this.auth.getUserByID(id).subscribe({
          next:(resp:User[])=>{
            this.editUsr=resp[0]
            console.log(this.editUsr);
            console.log(this.register.get('FirstName'));
            this.register.get('FirstName')?.setValue(this.editUsr.firstName);
            this.register.get('MiddleName')?.setValue(this.editUsr.middleName);
            this.register.get('LastName')?.setValue(this.editUsr.lastName);
            this.register.get('Email')?.setValue(this.editUsr.email);
            this.register.get('InitDate')?.setValue(this.editUsr.initDate);
            this.register.get('FlatNo')?.setValue(this.editUsr.flatNo);
            this.register.get('Street')?.setValue(this.editUsr.street);
            this.register.get('City')?.setValue(this.editUsr.city);
            this.register.get('State')?.setValue(this.editUsr.state);
            this.register.get('Pincode')?.setValue(this.editUsr.pincode);
          }
        })
      }
    })
    
  }
  onselected(event:any){
    this.imgFile=event.target.files[0];
  }

  onSubmit(){
    this.load.setLoadFlag(true)
    const form = new FormData();
    form.append('file',this.imgFile as File)
    this.auth.upload(form).subscribe({
      next:(resp:any)=>{
          console.log(resp)
          let regData:registerModel=this.register.value;
          let imgUrl:string=resp.url
          regData.Image=imgUrl;
          console.log(regData);
          this.auth.register(regData).subscribe({
            next:(resp:any)=>{
              console.log(resp);
              this.msg=resp.message
              this.showFlag=true;
              this.register.reset()
              this.imgFile=null
              this.load.setLoadFlag(false)
              setTimeout(() => {
                this.showFlag=false;
                this.msg=""

              }, 3000);
            },
            error:(resp:any)=>{
              console.log(resp);
            }
        });
      },
      error:(resp:any)=>{
        console.log(resp);
      }
    })
    
    

  }


  onUpdate(){
    this.load.setLoadFlag(true)
    if(this.imgFile){
      const form = new FormData();
      form.append('file',this.imgFile as File)

    
    this.auth.upload(form).subscribe({
      next:(resp:any)=>{
          console.log(resp)
          let regData:registerModel=this.register.value;
          let imgUrl:string=resp.url
          regData.Image=imgUrl;
          console.log(regData);
          this.auth.updateUser(this.editUsr.id, regData).subscribe({
            next:(resp:any)=>{
              console.log(resp);
              this.msg=resp.message
              this.showFlag=true;
              this.register.reset()
              this.imgFile=null
              this.load.setLoadFlag(false)
              setTimeout(() => {
                this.showFlag=false;
                this.msg=""

              }, 3000);
            },
            error:(resp:any)=>{
              console.log(resp);
            }
        });
      },
      error:(resp:any)=>{
        console.log(resp);
      }
    })
  }
  else{
        let regData:registerModel=this.register.value;
        regData.Image=this.editUsr.profileUrl;
          console.log(regData);
          this.auth.updateUser(this.editUsr.id, regData).subscribe({
            next:(resp:any)=>{
              console.log(resp);
              this.msg=resp.message
              this.showFlag=true;
              this.register.reset()
              this.imgFile=null
              this.load.setLoadFlag(false)
              setTimeout(() => {
                this.showFlag=false;
                this.msg=""

              }, 3000);
            },
            error:(resp:any)=>{
              console.log(resp);
            }
        });    
  }

  }

}


