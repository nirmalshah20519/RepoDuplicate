import { Component } from '@angular/core';
import {MatSidenavModule} from '@angular/material/sidenav';
import {NgIf} from '@angular/common';

@Component({
  selector: 'app-manage-show',
  templateUrl: './manage-show.component.html',
  styleUrls: ['./manage-show.component.css'],
  standalone: true,
  imports: [NgIf, MatSidenavModule],
})
export class ManageShowComponent {

}
