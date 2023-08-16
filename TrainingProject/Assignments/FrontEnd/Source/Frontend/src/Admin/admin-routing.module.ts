import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AdminHomeComponent } from './admin-home/admin-home.component';
import { AdminCastComponent } from './admin-cast/admin-cast.component';
import { AdminMovieComponent } from './admin-movie/admin-movie.component';
import { AdminCastListComponent } from './admin-cast-list/admin-cast-list.component';
import { AdminMovieListComponent } from './admin-movie-list/admin-movie-list.component';

const routes: Routes = [
  {
    path:"",
    component:AdminHomeComponent,
    children:[
      {
        path:"movie",
        component:AdminMovieComponent
      },
      {
        path:"movielist",
        component:AdminMovieListComponent
      },
      {
        path:"cast",
        component:AdminCastComponent,
      },
      {
        path:"castlist",
        component:AdminCastListComponent
      }
    ]
    
  },
  
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AdminRoutingModule { }
