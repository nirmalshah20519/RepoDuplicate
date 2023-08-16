import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { Product } from 'src/Models/product.model';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  
  title = 'ssr';
  name:string="Nirmal"
  Products:Product[]=[]
  private URL:string="https://fakestoreapi.com/products"

slickCarouselConfig = {
  slidesToShow: 3, // Number of cards to show at a time
  slidesToScroll: 1, // Number of cards to scroll
  infinite: true, // Enable infinite scrolling
  arrows: true, // Show navigation arrows
  dots: false, // Hide the dots navigation
  responsive: [
    {
      breakpoint: 768, // Responsive breakpoint
      settings: {
        slidesToShow: 2 // Number of cards to show at the breakpoint
      }
    },
    // Add more breakpoints and settings as needed
  ]
}
cards: any;
  constructor(private http:HttpClient) {
    this.getProducts();
  }

  getProducts(){
    this.http.get<Product[]>(this.URL).subscribe((data:Product[])=>{
      this.Products=data
  });
}
}
