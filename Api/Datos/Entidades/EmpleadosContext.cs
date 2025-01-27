using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Datos.Entidades;

public partial class EmpleadosContext : DbContext
{
    public EmpleadosContext()
    {
    }

    public EmpleadosContext(DbContextOptions<EmpleadosContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Empleado> Empleados { get; set; }

    public virtual DbSet<EstadosCivile> EstadosCiviles { get; set; }

    public virtual DbSet<TiposDocumento> TiposDocumentos { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Empleado>(entity =>
        {
            entity.Property(e => e.Apellidos)
                .HasMaxLength(250)
                .IsUnicode(false);
            entity.Property(e => e.Nombres)
                .HasMaxLength(250)
                .IsUnicode(false);

            entity.HasOne(d => d.IdEstadoCivilNavigation).WithMany(p => p.Empleados)
                .HasForeignKey(d => d.IdEstadoCivil)
                .HasConstraintName("FK_Empleados_EstadosCiviles");

            entity.HasOne(d => d.IdTipoDocumentoNavigation).WithMany(p => p.Empleados)
                .HasForeignKey(d => d.IdTipoDocumento)
                .HasConstraintName("FK_Empleados_TiposDocumento");
        });

        modelBuilder.Entity<EstadosCivile>(entity =>
        {
            entity.Property(e => e.Nombre)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TiposDocumento>(entity =>
        {
            entity.ToTable("TiposDocumento");

            entity.Property(e => e.Nombre)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
