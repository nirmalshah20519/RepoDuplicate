import { TestBed } from '@angular/core/testing';

import { StudentManagementDataService } from './student-management-data.service';

describe('StudentManagementDataService', () => {
  let service: StudentManagementDataService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(StudentManagementDataService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
