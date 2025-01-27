using System;
using System.Collections.Generic;

namespace Datos.Entidades;

public partial class EstadosCivile
{
    public int Id { get; set; }

    public string? Nombre { get; set; }

    public virtual ICollection<Empleado> Empleados { get; set; } = new List<Empleado>();
}
