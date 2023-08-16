import { AbstractControl, ValidationErrors } from '@angular/forms';

export class whiteSpace {
  static whiteSpaceValidator(control: AbstractControl): ValidationErrors | null {
    if (control.value.indexOf(' ') >= 0) {
      return { whiteSpaceValidator: true };
    } else {
      return null;
    }
  }
}
