import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LandingComponent } from './landing/landing.component';
import { AdminGuard } from './Guards/admin.guard';
import { DevoteeGuard } from './Guards/devotee.guard';

const routes: Routes = [
  {
    path:'',
    component:LandingComponent
  },
  {
    path:'admin',
    loadChildren:()=>import('../Admin/admin.module').then(a=>a.AdminModule),
    canActivate:[AdminGuard]
  },
  {
    path:'devotee',
    loadChildren:()=>import('../Devotee/devotee.module').then(d=>d.DevoteeModule),
    canActivate:[DevoteeGuard]
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
