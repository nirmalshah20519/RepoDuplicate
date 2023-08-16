import { Injectable } from '@angular/core';
import { Subject } from 'src/Model/Interfaces';

@Injectable({
  providedIn: 'root'
})
export class DataServiceService {
  SubjectsData:Subject[]=[
  {
      SubjectName:'HTML',
      SubjectData:[
      {
        TaskType:'Assignments',
        TaskDetails:[
          {
            Name:'Assignment 1',
            URL:'https://comfy-caramel-784457.netlify.app/'
          },
          {
            Name:'Assignment 2',
            URL:'https://silver-rugelach-e9b581.netlify.app/'
          }
        ]
      }
    ]
  },
  {
      SubjectName:'CSS',
      SubjectData:[
      {
        TaskType:'Assignments',
        TaskDetails:[
          {
            Name:'Assignment 1',
            URL:'https://loquacious-haupia-c02136.netlify.app/'
          },
          {
            Name:'Assignment 2',
            URL:'https://2717-nirmal-swiggy-clone.netlify.app/'
          },
          {
            Name:'Assignment 3',
            URL:'https://nirmal-shah-portfolio.netlify.app/'
          }
        ]
      }
    ]
  },
  {
      SubjectName:'Javascript',
      SubjectData:[
      {
        TaskType:'Assignments',
        TaskDetails:[
          {
            Name:'Assignment 1',
            URL:'https://fastidious-cuchufli-c7c702.netlify.app/'
          },
          {
            Name:'Assignment 2',
            URL:'https://nirmal-shah-hr-management-system.netlify.app/'
          },
          {
            Name:'Assignment 3',
            URL:'https://lucent-dragon-72e2ba.netlify.app/'
          },
          {
            Name:'Assignment 4',
            URL:'https://luminous-semifreddo-22b0a0.netlify.app/'
          }
        ]
      }
    ]
  },
]
  constructor() { }
}
