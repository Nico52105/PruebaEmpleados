using Datos.Entidades;
using Microsoft.AspNetCore.Mvc;

namespace ApiEmpleados.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ListasController : Controller
    {
        EmpleadosContext empleadosContext;

        public ListasController(EmpleadosContext ContextDB)
        {
            this.empleadosContext = ContextDB;
        }

        [HttpGet]
        [Route("[action]")]
        public IActionResult EstadosCiviles()
        {
            return Ok(empleadosContext.EstadosCiviles);
        }

        [HttpGet]
        [Route("[action]")]
        public IActionResult TiposDocumento()
        {
            return Ok(empleadosContext.TiposDocumentos);
        }
    }
}
