import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'read'
})
export class ReadPipe implements PipeTransform {

  transform(value: string): string {
    return value.split(' ').slice(0,25).join(' ');
  }

}
