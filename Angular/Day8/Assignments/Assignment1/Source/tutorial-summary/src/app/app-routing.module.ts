import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { DetailComponent } from './detail/detail.component';
import { DisplayBarComponent } from './display-bar/display-bar.component';

const routes: Routes = [
  {
    path:"",
    component:HomeComponent
  },
  {
    path:":subjectName",
    component:DetailComponent,
    children:[{
      path:":taskName",
      component:DisplayBarComponent
    }]
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
