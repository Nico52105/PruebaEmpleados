import { Component } from '@angular/core';
import { EmpleadosService } from '../swagger/ApiEnpleados/services';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  DatosTabla = {
    Titulo: 'Empleados',
    TituloColumnas: [
      'Nombres',
      'Apellidod',
      'Estado Civil',
      'Fecha de Nacimiento',
      'Tipo Documento',
      'Numero Documento',
      'Salario'
    ],
    NombreColumnas: [
      'nombres',
      'apellidos',
      'idEstadoCivil',
      'fechaNacimiento',
      'idTipoDocumento',
      'numeroDocumento',
      'salario'
    ],
    Datos: []
  };

  constructor(
    private empleadosService: EmpleadosService
  ) {
    this.empleadosService.rootUrl = 'https://localhost:7180';
    this.ObtenerEmpleados();
  }

  ObtenerEmpleados() {
    this.empleadosService.empleadosListarEmpleadosGet$Json().subscribe(
      (data: any) => {
        this.DatosTabla.Datos = data;
      },
      (error: any) => {
        console.log(error);
      }
    );
  }

  ObtenerDato(item: any, columna: any) {

    return item[columna];

  }



}
