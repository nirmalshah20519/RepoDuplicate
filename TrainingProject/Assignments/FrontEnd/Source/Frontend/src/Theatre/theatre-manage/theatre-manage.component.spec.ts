import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TheatreManageComponent } from './theatre-manage.component';

describe('TheatreManageComponent', () => {
  let component: TheatreManageComponent;
  let fixture: ComponentFixture<TheatreManageComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TheatreManageComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(TheatreManageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
