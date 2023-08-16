import { TestBed } from '@angular/core/testing';

import { DevoteeGuard } from './devotee.guard';

describe('DevoteeGuard', () => {
  let guard: DevoteeGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(DevoteeGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
