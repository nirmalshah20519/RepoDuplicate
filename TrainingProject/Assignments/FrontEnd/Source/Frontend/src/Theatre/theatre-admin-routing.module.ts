import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { TheatreAdminHomeComponent } from './theatre-admin-home/theatre-admin-home.component';
import { AddTheatreComponent } from './add-theatre/add-theatre.component';
import { TheatreListComponent } from './theatre-list/theatre-list.component';
import { TheatreManageComponent } from './theatre-manage/theatre-manage.component';
import { ManageScreenComponent } from './manage-screen/manage-screen.component';
import { ManageShowComponent } from './manage-show/manage-show.component';
import { ScreenLayoutComponent } from './screen-layout/screen-layout.component';
import { MovieAccessComponent } from './movie-access/movie-access.component';

const routes: Routes = [
  {
    path:'',
    component:TheatreAdminHomeComponent,
    children:[
      {
        path:'add-theatre',
        component:AddTheatreComponent
      },
      {
        path:'my-theatres',
        component:TheatreListComponent
      },
      {
        path:'my-theatres/:tid',
        component:TheatreManageComponent,
        children:[
          {
            path:'manage-screen',
            component:ManageScreenComponent
          },
          {
            path:'manage-show',
            component:ManageShowComponent
          },
          {
            path:'manage-screen/:sid',
            component:ScreenLayoutComponent
          },
        ]
      },
      { 
        path: 'movies', 
        component: MovieAccessComponent 
      },
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class TheatreAdminRoutingModule { }
