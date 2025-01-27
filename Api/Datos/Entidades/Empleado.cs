using System;
using System.Collections.Generic;

namespace Datos.Entidades;

public partial class Empleado
{
    public int Id { get; set; }

    public string? Nombres { get; set; }

    public string? Apellidos { get; set; }

    public int? IdTipoDocumento { get; set; }

    public int? NumeroDocumento { get; set; }

    public DateOnly? FechaNacimiento { get; set; }

    public int? Salario { get; set; }

    public int? IdEstadoCivil { get; set; }

    public virtual EstadosCivile? IdEstadoCivilNavigation { get; set; }

    public virtual TiposDocumento? IdTipoDocumentoNavigation { get; set; }
}
