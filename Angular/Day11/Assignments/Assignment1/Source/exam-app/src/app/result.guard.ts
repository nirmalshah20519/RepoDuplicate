import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, RouterStateSnapshot, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';
import { ExamDataService } from './Services/exam-data.service';

@Injectable({
  providedIn: 'root'
})
export class ResultGuard implements CanActivate {
  constructor(private serv:ExamDataService){

  }
  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {
    return this.serv.flag;
  }
  
}
