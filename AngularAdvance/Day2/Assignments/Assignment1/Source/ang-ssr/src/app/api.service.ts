import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Product } from 'src/Models/product.model';

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  private URL:string="https://fakestoreapi.com/products"
  constructor(private http:HttpClient) { }

  getProducts():Observable<Product[]>{
    return this.http.get<Product[]>(this.URL)
  }
}
