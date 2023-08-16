import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-add-product',
  templateUrl: './add-product.component.html',
  styleUrls: ['./add-product.component.css']
})
export class AddProductComponent {

product!:FormGroup

constructor(private fb:FormBuilder) {
  this.product=this.fb.group({
    Name:['',[Validators.required]],
    Price: ['',[Validators.required,Validators.min(0)]],
    Qty: ['',[Validators.required,Validators.min(1)]],
    Total: ['',[Validators.required]],
    Discount: ['',[Validators.required,Validators.pattern(/\b(?:10|20|30)\b/)]],
  })
}
}
