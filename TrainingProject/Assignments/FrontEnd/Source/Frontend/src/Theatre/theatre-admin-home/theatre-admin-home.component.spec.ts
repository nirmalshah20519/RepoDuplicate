import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TheatreAdminHomeComponent } from './theatre-admin-home.component';

describe('TheatreAdminHomeComponent', () => {
  let component: TheatreAdminHomeComponent;
  let fixture: ComponentFixture<TheatreAdminHomeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TheatreAdminHomeComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(TheatreAdminHomeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
