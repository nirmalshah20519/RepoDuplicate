import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { TheatreAdminRoutingModule } from './theatre-admin-routing.module';
import { TheatreAdminHomeComponent } from './theatre-admin-home/theatre-admin-home.component';
import { AddTheatreComponent } from './add-theatre/add-theatre.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { TheatreListComponent } from './theatre-list/theatre-list.component';
import { TheatreManageComponent } from './theatre-manage/theatre-manage.component';
import { TheatreManageDashboardComponent } from './theatre-manage-dashboard/theatre-manage-dashboard.component';
import { ManageScreenComponent } from './manage-screen/manage-screen.component';
import { ManageShowComponent } from './manage-show/manage-show.component';
import { TheatreStore } from 'src/Services/Theatre.store';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatSlideToggleModule } from '@angular/material/slide-toggle';
import { MatSidenavModule } from '@angular/material/sidenav';
import { ScreenLayoutComponent } from './screen-layout/screen-layout.component';
import { MovieAccessComponent } from './movie-access/movie-access.component';

@NgModule({
  declarations: [
    TheatreAdminHomeComponent,
    AddTheatreComponent,
    TheatreListComponent,
    TheatreManageComponent,
    TheatreManageDashboardComponent,
    ManageScreenComponent,
    ScreenLayoutComponent,
    MovieAccessComponent,
    
  ],
  providers:[
    TheatreStore
  ],
  imports: [
    CommonModule,
    TheatreAdminRoutingModule,
    ReactiveFormsModule,
    FormsModule,
    MatSlideToggleModule,
    MatSidenavModule

  ],
})
export class TheatreAdminModule {}
