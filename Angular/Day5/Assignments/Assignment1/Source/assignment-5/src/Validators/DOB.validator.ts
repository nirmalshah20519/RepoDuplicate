import { AbstractControl, ValidationErrors } from '@angular/forms';

export class DOB {
  static dateOfBirth(control: AbstractControl): ValidationErrors | null {
    if (new Date().getFullYear() - new Date(control.value).getFullYear() <= 5) {
      return { dobValidator: true };
    } else {
      return null;
    }
  }
}
