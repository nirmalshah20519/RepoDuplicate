import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MovieFullPageComponent } from './movie-full-page.component';

describe('MovieFullPageComponent', () => {
  let component: MovieFullPageComponent;
  let fixture: ComponentFixture<MovieFullPageComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MovieFullPageComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(MovieFullPageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
