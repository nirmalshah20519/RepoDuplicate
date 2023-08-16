export class QuestionBase<T> {
    value: T|undefined;
    key: string;
    label: string;
    required: boolean;
    order: number;
    controlType: string;
    type: string;
    options: {key: string, value: string|number|boolean}[];
  
    constructor(options: {
        value?: T;
        key?: string;
        label?: string;
        required?: boolean;
        order?: number;
        controlType?: string;
        type?: string;
        options?: {key: string, value: string|number|boolean}[];
      } = {}) {
      this.value = options.value;
      this.key = options.key ?? '';
      this.label = options.label ?? '';
      this.required = !!options.required;
      this.order = options.order ?? 1
      this.controlType = options.controlType ?? '';
      this.type = options.type ?? '';
      this.options = options.options ?? [];
    }
  }