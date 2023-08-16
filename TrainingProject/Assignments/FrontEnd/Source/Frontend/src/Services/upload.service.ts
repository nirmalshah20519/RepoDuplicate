import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class UploadService {
  URL: string = 'https://localhost:7133/api/Upload/';
  constructor(private http:HttpClient) { 

  }

  UploadProfile(file:File){
    const data = new FormData();
    data.append('file', file);
    return this.http.post(this.URL+'profile',data)
  }

  UploadPoster(file:File){
    const data = new FormData();
    data.append('file', file);
    return this.http.post(this.URL+'poster',data)
  }

  UploadTrailer(file:File){
    const data = new FormData();
    data.append('file', file);
    return this.http.post(this.URL+'trailer',data)
  }

  UploadFacility(file:File){
    const data = new FormData();
    data.append('file', file);
    return this.http.post(this.URL+'facility',data)
  }

  
}
