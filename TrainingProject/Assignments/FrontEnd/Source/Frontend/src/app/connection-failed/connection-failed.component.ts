import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AccountService } from 'src/Services/account.service';
import { LoaderService } from 'src/Services/loader.service';

@Component({
  selector: 'app-connection-failed',
  templateUrl: './connection-failed.component.html',
  styleUrls: ['./connection-failed.component.css']
})
export class ConnectionFailedComponent {
constructor(private router:Router, private accountServ:AccountService, private load:LoaderService){

}

onRetry(){
  this.load.setFlag(true)
  this.accountServ.testServer().subscribe({
    next:(resp:any)=>{
      this.load.setFlag(false)
      this.router.navigateByUrl('')
    },
    error:(err:any)=>{
      this.load.setFlag(false)
      console.log(err);
    }
  })
  
}
}
