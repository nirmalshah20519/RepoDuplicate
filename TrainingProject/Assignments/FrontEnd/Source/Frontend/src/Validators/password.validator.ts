import { AbstractControl, FormGroup, ValidationErrors } from '@angular/forms';

export function passwordMatchValidator(control: AbstractControl): ValidationErrors | null {
  const passwordControl = control.get('Password');
  const confirmPasswordControl = control.get('ConfirmPassword');

  // Check if the controls exist and both passwords match
  if (passwordControl && confirmPasswordControl && passwordControl.value !== confirmPasswordControl.value) {
    confirmPasswordControl.setErrors({ passwordMatch: true });
    return { passwordMatch: true };
  } else {
    return null;
  }
}
