import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators, FormsModule, ReactiveFormsModule, FormArray  } from '@angular/forms';
import { Router } from '@angular/router';
import { AddressClass } from 'src/Models/Address';
import { EmergencyContact } from 'src/Models/EmergencyContact';
import { StudentDetailClass } from 'src/Models/StudentDetails';
import { fullNameClass } from 'src/Models/fullName';
import { parentDetailClass } from 'src/Models/parentDetail';
import { StudentManagementDataService } from 'src/Services/student-management-data.service';
import { DOB } from 'src/Validators/DOB.validator';
import { whiteSpace } from 'src/Validators/whiteSpace.validator';

@Component({
  selector: 'app-form',
  templateUrl: './form.component.html',
  styleUrls: ['./form.component.css']
})
export class FormComponent {
  form!:FormGroup;

  constructor(private fb:FormBuilder, private studentService:StudentManagementDataService, private rt:Router){
    this.form=fb.group({
      Name:fb.group({
        fname:["",[Validators.required, whiteSpace.whiteSpaceValidator, Validators.minLength(3)]],
        mname:["",[Validators.required, whiteSpace.whiteSpaceValidator, Validators.minLength(3)]],
        lname:["",[Validators.required, whiteSpace.whiteSpaceValidator, Validators.minLength(3)]]
      }),
      DOB:["",[Validators.required, DOB.dateOfBirth]],
      PlaceOfBirth:["",[Validators.required]],
      FirstLanguage:["",[Validators.required]],
      Address:fb.group({
        City:["",[Validators.required, Validators.pattern('^[A-Za-z]+$')]],
        State:["",[Validators.required, Validators.pattern('^[A-Za-z]+$')]],
        Country:["",[Validators.required, Validators.pattern('^[A-Za-z]+$')]],
        Pincode:["",[Validators.required, Validators.minLength(6), Validators.maxLength(6), Validators.pattern('^[0-9]+$')]],
      }),
      FatherDetails:fb.group({
        Name:fb.group({
          fname:["",[Validators.required, whiteSpace.whiteSpaceValidator, Validators.minLength(3)]],
          mname:["",[Validators.required, whiteSpace.whiteSpaceValidator, Validators.minLength(3)]],
          lname:["",[Validators.required, whiteSpace.whiteSpaceValidator, Validators.minLength(3)]]
        }),
        email:["",[Validators.required, Validators.email]],
        education:["",[Validators.required, Validators.pattern('^[A-Za-z]+$')]],
        profession:["",[Validators.required, Validators.pattern('^[A-Za-z]+$')]],
        designation:["",[Validators.required, Validators.pattern('^[A-Za-z]+$')]],
        phone:["",[Validators.required, Validators.minLength(10), Validators.maxLength(10), Validators.pattern('^[0-9]+$')]]
      }),
      MotherDetails:fb.group({
        Name:fb.group({
          fname:["",[Validators.required, whiteSpace.whiteSpaceValidator, Validators.minLength(3)]],
          mname:["",[Validators.required, whiteSpace.whiteSpaceValidator, Validators.minLength(3)]],
          lname:["",[Validators.required, whiteSpace.whiteSpaceValidator, Validators.minLength(3)]]
        }),
        email:["",[Validators.required, Validators.email]],
        education:["",[Validators.required, Validators.pattern('^[A-Za-z]+$')]],
        profession:["",[Validators.required, Validators.pattern('^[A-Za-z]+$')]],
        designation:["",[Validators.required, Validators.pattern('^[A-Za-z]+$')]],
        phone:["",[Validators.required, Validators.minLength(10), Validators.maxLength(10), Validators.pattern('^[0-9]+$')]]
      }),
      EmergencyContact:fb.array([
        this.fb.group({
          relation: ["", [Validators.required, Validators.pattern('^[A-Za-z]+$')]],
          number:["", [Validators.required, Validators.minLength(10), Validators.maxLength(10), Validators.pattern('^[0-9]+$')]]
        })
      ])
    });

    console.log(this.form);
  }

  get Emergency(){
    return this.form.get('EmergencyContact') as FormArray
  }

  get fc(){
    return this.form.controls
  }

  get Father(){
    return this.form.get('FatherDetails')
  }

  get Mother(){
    return this.form.get('MotherDetails')
  }

  Add(){
    this.Emergency.push(this.fb.group({
      relation: ["", [Validators.required, Validators.pattern('^[A-Za-z]+$')]],
      number:["", [Validators.required, Validators.minLength(10), Validators.maxLength(10), Validators.pattern('^[0-9]+$')]]
    }))
  }

  submit(){
    let id=this.studentService.Students.length===0?1:this.studentService.Students[this.studentService.Students.length-1].ID+1
    let stuName= new fullNameClass(this.fc['Name'].get('fname')?.value, this.fc['Name'].get('mname')?.value, this.fc['Name'].get('lname')?.value);
    let addr=new AddressClass(this.fc['Address'].get('City')?.value, this.fc['Address'].get('State')?.value, this.fc['Address'].get('Country')?.value, this.fc['Address'].get('Pincode')?.value);
    let FatherName=new fullNameClass(this.Father?.get('Name')?.get('fname')?.value, this.Father?.get('Name')?.get('mname')?.value, this.Father?.get('Name')?.get('lname')?.value);
    let MotherName=new fullNameClass(this.Mother?.get('Name')?.get('fname')?.value, this.Mother?.get('Name')?.get('mname')?.value, this.Mother?.get('Name')?.get('lname')?.value);
    let father=new parentDetailClass(FatherName,this.Father?.get('email')?.value, this.Father?.get('education')?.value, this.Father?.get('profession')?.value, this.Father?.get('designation')?.value, this.Father?.get('phone')?.value);
    let mother=new parentDetailClass(MotherName,this.Mother?.get('email')?.value, this.Mother?.get('education')?.value, this.Mother?.get('profession')?.value, this.Mother?.get('designation')?.value, this.Mother?.get('phone')?.value);
    let Emergency:EmergencyContact[]
    let arr = this.form.get('EmergencyContact')?.value
    let student= new StudentDetailClass(id,
                                        stuName,
                                        this.form.get('DOB')?.value,
                                        this.form.get('PlaceOfBirth')?.value, 
                                        this.form.get('PlaceOfBirth')?.value,
                                        addr,
                                        father,
                                        mother,
                                        arr);
    this.studentService.AddStudent(student)
    this.rt.navigate(['/display'])
  }

}
