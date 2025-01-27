using Datos.Entidades;
using Microsoft.AspNetCore.Mvc;

namespace ApiEmpleados.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class EmpleadosController : Controller
    {
        EmpleadosContext empleadosContext;

        public EmpleadosController(EmpleadosContext ContextDB)
        {
            this.empleadosContext = ContextDB;   
        }

        [HttpPost]
        [Route("[action]")]
        public ActionResult<Empleado> CrearEmpleado(Empleado nuevoEmpleado)
        {
            Empleado? empleado = null;
            empleadosContext.Empleados.Add(nuevoEmpleado);
            empleadosContext.SaveChanges();
            empleado = empleadosContext.Empleados.FirstOrDefault(e=> e.NumeroDocumento==nuevoEmpleado.NumeroDocumento && e.IdTipoDocumento==nuevoEmpleado.IdTipoDocumento );
            return Ok(empleado);
        }

        [HttpPut]
        [Route("[action]")]
        public ActionResult<Empleado> ActualizarEmpleado(Empleado nuevosDatosEmpleado)
        {
            Empleado? empleado = empleadosContext.Empleados.FirstOrDefault(e => e.NumeroDocumento == nuevosDatosEmpleado.NumeroDocumento && e.IdTipoDocumento == nuevosDatosEmpleado.IdTipoDocumento); ;
            if (empleado!=null)
            {
                empleado.Nombres = nuevosDatosEmpleado.Nombres;
                empleado.Apellidos = nuevosDatosEmpleado.Apellidos;
                empleado.IdTipoDocumento = nuevosDatosEmpleado.IdTipoDocumento;
                empleado.NumeroDocumento = nuevosDatosEmpleado.NumeroDocumento;
                empleado.FechaNacimiento = nuevosDatosEmpleado.FechaNacimiento;
                empleado.Salario = nuevosDatosEmpleado.Salario;
                empleado.IdEstadoCivil = nuevosDatosEmpleado.IdEstadoCivil;
                empleadosContext.Empleados.Update(empleado);
                empleadosContext.SaveChanges();
                return Ok(empleado);
            }
            else
            {
                return StatusCode(StatusCodes.Status412PreconditionFailed, "Empleado no encontrado");
            }
            
        }

        [HttpDelete]
        [Route("[action]")]
        public ActionResult<Empleado> EliminarEmpleado(int numeroDocumento,int idTipoDocumento)
        {
            Empleado? empleado = empleadosContext.Empleados.FirstOrDefault(e => e.NumeroDocumento == numeroDocumento && e.IdTipoDocumento == idTipoDocumento); ;
            if (empleado != null)
            {
                empleadosContext.Empleados.Remove(empleado);
                empleadosContext.SaveChanges();
                return Ok(empleado);
            }
            else
            {
                return StatusCode(StatusCodes.Status412PreconditionFailed, "Empleado no encontrado");
            }
        }

        [HttpGet]
        [Route("[action]")]
        public ActionResult<Empleado> ListarEmpleados()
        {
            return Ok(empleadosContext.Empleados);            
        }
    }
}
