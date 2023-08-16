import { Component } from '@angular/core';

@Component({
  selector: 'app-image-render',
  template: `
    <img [src]="params.value" alt="Profile Image" style="height: 50px;">
  `,
  styleUrls: ['./image-render.component.css']
})
export class ImageRenderComponent {
  params: any;

  agInit(params: any): void {
    this.params = params;
  }

  refresh(params: any): boolean {
    this.params = params;
    return true;
  }
}
