import { Injectable } from '@angular/core';
import { HttpRequest, HttpHandler, HttpEvent, HttpInterceptor } from '@angular/common/http';
import { Observable } from 'rxjs';

import { AuthenticationService } from './authentication.service';

@Injectable({
  providedIn: 'root'
})
export class JwtInterceptorService implements HttpInterceptor {
  constructor(private authenticationService: AuthenticationService) { }

  intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
      // add auth header with jwt if user is logged in and request is to api url
      const currentUser = this.authenticationService.currentUserValue;
      const isLoggedIn = currentUser && currentUser.token;
      const isApiUrl = request.url.startsWith('http://192.168.176.26:3000/');
      if (isLoggedIn && isApiUrl) {
          request = request.clone({
              setHeaders: {
                  Authorization: `Bearer ${currentUser.token}`
              }
          });
      }

      return next.handle(request);
  }
}
