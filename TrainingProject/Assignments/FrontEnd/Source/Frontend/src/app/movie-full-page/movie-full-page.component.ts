import { Component, HostListener, ViewChild } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Movie } from 'src/Models/Movie';
import { LoaderService } from 'src/Services/loader.service';
import { MovieService } from 'src/Services/movie.service';
import { initTE, Ripple, Modal} from "tw-elements";

@Component({
  selector: 'app-movie-full-page',
  templateUrl: './movie-full-page.component.html',
  styleUrls: ['./movie-full-page.component.css']
})
export class MovieFullPageComponent {
currMov:Movie={} as Movie;
@ViewChild('videoPlayer') videoPlayer: any;
  isPlaying = false;
  controlsVisible = true;
  timeout: any;

  togglePlayPause() {
    const video = this.videoPlayer.nativeElement;
    if (video.paused) {
      video.play();
      this.isPlaying = true;
    } else {
      video.pause();
      this.isPlaying = false;
    }
  }

  skipBackward() {
    const video = this.videoPlayer.nativeElement;
    video.currentTime -= 10;
  }

  skipForward() {
    const video = this.videoPlayer.nativeElement;
    video.currentTime += 10;
  }
  showControls() {
    clearTimeout(this.timeout);
    this.controlsVisible = true;
    this.timeout = setTimeout(() => {
      this.controlsVisible = false;
    }, 2000);
  }

  hideControls() {
    clearTimeout(this.timeout);
    this.controlsVisible = false;
  }

  @HostListener('mousemove')
  onMouseMove() {
    if (!this.controlsVisible) {
      this.showControls();
    }
  }

constructor(private act:ActivatedRoute, private movieServ:MovieService, private load:LoaderService){
load.setFlag(true)
  act.paramMap.subscribe(p=>{
    const id=Number(p.get('id'));
    movieServ.getMovieByID(id).subscribe(
      {
        next:(resp:Movie)=>{
          this.currMov=resp;
          load.setFlag(false)
        },
        error:(err:any)=>{
          console.log(err);
          load.setFlag(false)
        }
      }
    )

  })
}

ngOnInit(){
  initTE({ Ripple, Modal });
}
}
