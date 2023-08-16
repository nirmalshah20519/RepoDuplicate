import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MovieAccessComponent } from './movie-access.component';

describe('MovieAccessComponent', () => {
  let component: MovieAccessComponent;
  let fixture: ComponentFixture<MovieAccessComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MovieAccessComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(MovieAccessComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
