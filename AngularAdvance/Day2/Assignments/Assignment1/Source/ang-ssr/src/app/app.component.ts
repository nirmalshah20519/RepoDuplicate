import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Product } from 'src/Models/product.model';
import { ApiService } from './api.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'ang-ssr';
  name:string="Nirmal"
  Products:Product[]=[]
  constructor(private api:ApiService) {
    
  }
  ngOnInit(): void {
    this.getProducts();
  }

  getProducts(){
    this.api.getProducts().subscribe({
      next:(data:Product[])=>{
        this.Products=data
      },
      error:(err:any)=>{
        console.log(err);
      }
    })
}
}
