import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MoviesDisplayComponent } from './movies-display.component';

describe('MoviesDisplayComponent', () => {
  let component: MoviesDisplayComponent;
  let fixture: ComponentFixture<MoviesDisplayComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MoviesDisplayComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(MoviesDisplayComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
