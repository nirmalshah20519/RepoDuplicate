import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminCastComponent } from './admin-cast.component';

describe('AdminCastComponent', () => {
  let component: AdminCastComponent;
  let fixture: ComponentFixture<AdminCastComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AdminCastComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AdminCastComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
