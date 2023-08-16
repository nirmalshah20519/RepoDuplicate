import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { DevoteeRoutingModule } from './devotee-routing.module';
import { HomeComponent } from './home/home.component';
import { PayComponent } from './pay/pay.component';
import { ProfileComponent } from './profile/profile.component';
import { FormsModule } from '@angular/forms';
import { MonthPipe } from 'src/Pipes/month.pipe';


@NgModule({
  declarations: [
    HomeComponent,
    PayComponent,
    ProfileComponent,
    MonthPipe
  ],
  imports: [
    CommonModule,
    DevoteeRoutingModule,
    FormsModule,
    
  ]
})
export class DevoteeModule { }
