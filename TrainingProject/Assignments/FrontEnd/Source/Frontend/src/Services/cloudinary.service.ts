import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class CloudinaryService {
  CLOUD_NAME:string='movie-booking-site'

  constructor(private http:HttpClient) { }
  imageURL:string='https://api.cloudinary.com/v1_1/movie-booking-site/image/upload';
  videoURL:string='https://api.cloudinary.com/v1_1/movie-booking-site/video/upload';

  uploadImage(file:File,preset:string){
    const data = new FormData();
    data.append('file', file);
    data.append('upload_preset', preset);
    data.append('cloud_name', 'movie-booking-site');
    data.append('public_id', file.name + new Date().getTime());
    return this.http.post(this.imageURL, data)
  }

  uploadVideo(file:File,preset:string){
    const data = new FormData();
    data.append('file', file);
    data.append('upload_preset', preset);
    data.append('cloud_name', 'movie-booking-site');
    data.append('public_id', file.name + new Date().getTime());
    return this.http.post(this.videoURL, data)
  }


}
