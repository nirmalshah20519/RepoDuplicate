import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TheatreManageDashboardComponent } from './theatre-manage-dashboard.component';

describe('TheatreManageDashboardComponent', () => {
  let component: TheatreManageDashboardComponent;
  let fixture: ComponentFixture<TheatreManageDashboardComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TheatreManageDashboardComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(TheatreManageDashboardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
