import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminCastListComponent } from './admin-cast-list.component';

describe('AdminCastListComponent', () => {
  let component: AdminCastListComponent;
  let fixture: ComponentFixture<AdminCastListComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AdminCastListComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AdminCastListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
