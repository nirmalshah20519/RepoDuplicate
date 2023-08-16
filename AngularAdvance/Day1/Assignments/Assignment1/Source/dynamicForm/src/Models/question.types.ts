import { QuestionBase } from './question.genric';

export class TextboxQuestion extends QuestionBase<string> {
  override controlType = 'textbox';
}
export class DropdownQuestion extends QuestionBase<string> {
  override controlType = 'dropdown';
}
export class RadioButtonQuestion extends QuestionBase<string> {
  override controlType = 'radio';
}
export class CheckboxQuestion extends QuestionBase<string> {
  override controlType = 'checkbox';
}
