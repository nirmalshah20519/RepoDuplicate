import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { FormComponent } from './form/form.component';
import { DisplayComponent } from './display/display.component';
import { DetailsComponent } from './details/details.component';

const routes: Routes = [
  {
    path:'',
    component:HomeComponent
  },
  {
    path:'register',
    component:FormComponent
  },
  {
    path:'display',
    component:DisplayComponent,
    children:[
    {      
        path:':StuID',
        component:DetailsComponent      
    }
  ]
  }
//   {      
//     path:'display/:StuID',
//     component:DetailsComponent      
// }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
