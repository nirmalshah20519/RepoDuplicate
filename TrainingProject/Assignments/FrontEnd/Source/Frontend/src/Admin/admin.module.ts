import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AdminRoutingModule } from './admin-routing.module';
import { AdminHomeComponent } from './admin-home/admin-home.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AdminCastComponent } from './admin-cast/admin-cast.component';
import { AdminMovieComponent } from './admin-movie/admin-movie.component';
import { AdminCastListComponent } from './admin-cast-list/admin-cast-list.component';
import { AdminMovieListComponent } from './admin-movie-list/admin-movie-list.component';
import { ReadPipe } from './Pipes/read.pipe';
import { NgxPaginationModule } from 'ngx-pagination';
import { AgGridModule } from 'ag-grid-angular';
import { ImageRenderComponent } from './image-render/image-render.component';

@NgModule({
  declarations: [
    AdminHomeComponent,
    AdminCastComponent,
    AdminMovieComponent,
    AdminCastListComponent,
    AdminMovieListComponent,
    ReadPipe,
    ImageRenderComponent
  ],
  imports: [
    CommonModule,
    AdminRoutingModule,
    ReactiveFormsModule,
    FormsModule,
    NgxPaginationModule,
    AgGridModule
  ],
  
})
export class AdminModule { }
