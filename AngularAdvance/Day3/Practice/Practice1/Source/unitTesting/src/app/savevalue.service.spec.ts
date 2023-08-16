import { TestBed } from '@angular/core/testing';

import { SavevalueService } from './savevalue.service';

describe('SavevalueService', () => {
  let service: SavevalueService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(SavevalueService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
