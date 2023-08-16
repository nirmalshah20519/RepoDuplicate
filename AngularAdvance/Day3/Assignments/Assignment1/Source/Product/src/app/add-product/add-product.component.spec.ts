import { ComponentFixture, TestBed, flush } from '@angular/core/testing';

import { AddProductComponent } from './add-product.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

describe('AddProductComponent', () => {
  let component: AddProductComponent;
  let fixture: ComponentFixture<AddProductComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [
        ReactiveFormsModule,FormsModule
      ],
      declarations: [ AddProductComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AddProductComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

 it('not be null',()=>{
  component.product.setValue({
    "Name":"",
    "Price":"",
    "Qty":"",
    "Total":"",
   "Discount":"", 
  })
  expect(component.product.invalid).toEqual(true)
 })
 it('not be invalid discount',()=>{
  component.product.setValue({
    "Name":"parleG",
    "Price":2000,
    "Qty":3,
    "Total":6000,
   "Discount":100, 
  })
  expect(component.product.invalid).toEqual(true)
 })
 it('not be invalid price',()=>{
  component.product.setValue({
    "Name":"parleG",
    "Price":-2000,
    "Qty":3,
    "Total":6000,
   "Discount":10, 
  })
  expect(component.product.invalid).toEqual(true)
 })
 it('not be invalid quantity',()=>{
  component.product.setValue({
    "Name":"parleG",
    "Price":-2000,
    "Qty":-2,
    "Total":6000,
   "Discount":10, 
  })
  expect(component.product.invalid).toEqual(true)
 })
});
