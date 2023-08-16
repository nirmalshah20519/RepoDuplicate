import { Component } from '@angular/core';
import { student } from 'src/Model/student';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'results';
  studentData:student[]=[
    {
      ID:1,
      Name:'Rahul',
      Image:"https://tse3.mm.bing.net/th?id=OIF.LnpH%2bdCXRTe695ziPs3jSA&w=327&h=184&c=7&r=0&o=5&pid=1.7",
      Address:"Ahmedabad",
      DOB:new Date("1980-02-09"),
      Subjects:[{
        name:"Hindi",
        marks:{
          internal:50,
          external:90
        }
      },
      {
        name:"English",
        marks:{
          internal:50,
          external:90
        }
      },
      {
        name:"Maths",
        marks:{
          internal:50,
          external:90
        }
      },
      {
        name:"Science",
        marks:{
          internal:50,
          external:90
        }
      }]
  },
    {
    ID:2,
    Name:'Rita',
    Image:"https://tse1.mm.bing.net/th?id=OIF.TvPkmI2cpQssFUFuQ%2brWEA&w=331&h=175&c=7&r=0&o=5&pid=1.7",
    Address:"Ahmedabad",
    DOB:new Date("1987-02-09"),
    Subjects:[{
      name:"Hindi",
      marks:{
        internal:30,
        external:100
      }
    },
    {
      name:"English",
      marks:{
        internal:80,
        external:100
      }
    },
    {
      name:"Maths",
      marks:{
        internal:70,
        external:40
      }
    },
    {
      name:"Science",
      marks:{
        internal:40,
        external:50
      }
    }]
  },
    {
    ID:3,
    Name:'Rohan',
    Image:"https://res.cloudinary.com/dadhpdkco/image/upload/v1681448667/samples/people/smiling-man.jpg",
    Address:"Ahmedabad",
    DOB:new Date("1987-02-09"),
    Subjects:[{
      name:"Hindi",
      marks:{
        internal:20,
        external:60
      }
    },
    {
      name:"English",
      marks:{
        internal:20,
        external:10
      }
    },
    {
      name:"Maths",
      marks:{
        internal:20,
        external:20
      }
    },
    {
      name:"Science",
      marks:{
        internal:40,
        external:20
      }
    }]
  }
]

current!:student;
}
