import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AppComponent } from './app.component';
import { LandingComponent } from './landing/landing.component';
import { MovieFullPageComponent } from './movie-full-page/movie-full-page.component';
import { MoviesDisplayComponent } from './movies-display/movies-display.component';
import { ForgotPasswdComponent } from './forgot-passwd/forgot-passwd.component';
import { AdminGuard } from 'src/Guards/admin.guard';
import { BusinessRegisterComponent } from './business-register/business-register.component';
import { ConnectionFailedComponent } from './connection-failed/connection-failed.component';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';

const routes: Routes = [
  {
    path:"", 
    component:AppComponent,
    children:[
      {
        path:'',
        component:LandingComponent,
        children:[
          {
            path:'',
            component:MoviesDisplayComponent
          },
          {
            path:'movie/:moviename/:id',
            component:MovieFullPageComponent,
            
          },
          {
            path:'movie/:moviename/:id',
            component:MovieFullPageComponent,
            
          },
          {
            path:'forgot-password',
            component:ForgotPasswdComponent
          },
          {
            path:'business-registration',
            component:BusinessRegisterComponent
          }
        ]
      },
      
    ]
  },
  {
    path:'connection-failed',
    component:ConnectionFailedComponent
  },
  {
    path:'not-found',
    component:PageNotFoundComponent
  },
  {
    path:"admin", 
    loadChildren: () => import('../Admin/admin.module').then(a => a.AdminModule),
    canActivate:[AdminGuard]
  },
  {
    path:"theatre-admin", 
    loadChildren: () => import('../Theatre/theatre-admin.module').then(f => f.TheatreAdminModule),
  },
  {
    path:'**',
    redirectTo:'not-found'
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
