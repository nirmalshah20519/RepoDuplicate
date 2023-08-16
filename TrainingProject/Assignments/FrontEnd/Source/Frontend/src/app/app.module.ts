import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import {HttpClientModule} from '@angular/common/http'
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NavbarComponent } from './navbar/navbar.component';
import { LandingComponent } from './landing/landing.component';
import { LoaderComponent } from './loader/loader.component';
import { MoviesDisplayComponent } from './movies-display/movies-display.component';
import { MovieCardComponent } from './movie-card/movie-card.component';
import { MovieFullPageComponent } from './movie-full-page/movie-full-page.component';
import { ForgotPasswdComponent } from './forgot-passwd/forgot-passwd.component';
import { FooterComponent } from './footer/footer.component';
import { BusinessRegisterComponent } from './business-register/business-register.component';
import { ConnectionFailedComponent } from './connection-failed/connection-failed.component';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatSlideToggleModule } from '@angular/material/slide-toggle';
import { AgGridModule } from 'ag-grid-angular';

// const cloudinary = {
//   cloudName:'movie-booking-site',
//   apiKey:'163183753378642',
//   apiSecret:'EagGoZH6WTLyDl39TfTV-VbKUoQ'
// }

@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    LandingComponent,
    LoaderComponent,
    MoviesDisplayComponent,
    MovieCardComponent,
    MovieFullPageComponent,
    ForgotPasswdComponent,
    FooterComponent,
    BusinessRegisterComponent,
    ConnectionFailedComponent,
    PageNotFoundComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    ReactiveFormsModule,
    FormsModule,
    BrowserAnimationsModule,
    MatSlideToggleModule,
    AgGridModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
