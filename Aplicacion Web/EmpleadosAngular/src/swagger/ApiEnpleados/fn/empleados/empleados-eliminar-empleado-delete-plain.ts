/* tslint:disable */
/* eslint-disable */
/* Code generated by ng-openapi-gen DO NOT EDIT. */

import { HttpClient, HttpContext, HttpResponse } from '@angular/common/http';
import { Observable } from 'rxjs';
import { filter, map } from 'rxjs/operators';
import { StrictHttpResponse } from '../../strict-http-response';
import { RequestBuilder } from '../../request-builder';

import { Empleado } from '../../models/empleado';

export interface EmpleadosEliminarEmpleadoDelete$Plain$Params {
  numeroDocumento?: number;
  idTipoDocumento?: number;
}

export function empleadosEliminarEmpleadoDelete$Plain(http: HttpClient, rootUrl: string, params?: EmpleadosEliminarEmpleadoDelete$Plain$Params, context?: HttpContext): Observable<StrictHttpResponse<Empleado>> {
  const rb = new RequestBuilder(rootUrl, empleadosEliminarEmpleadoDelete$Plain.PATH, 'delete');
  if (params) {
    rb.query('numeroDocumento', params.numeroDocumento, {});
    rb.query('idTipoDocumento', params.idTipoDocumento, {});
  }

  return http.request(
    rb.build({ responseType: 'text', accept: 'text/plain', context })
  ).pipe(
    filter((r: any): r is HttpResponse<any> => r instanceof HttpResponse),
    map((r: HttpResponse<any>) => {
      return r as StrictHttpResponse<Empleado>;
    })
  );
}

empleadosEliminarEmpleadoDelete$Plain.PATH = '/Empleados/EliminarEmpleado';
