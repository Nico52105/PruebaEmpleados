USE [master]
GO
/****** Object:  Database [Empleados]    Script Date: 27/01/2025 9:34:21 a. m. ******/
CREATE DATABASE [Empleados]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Empleados', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Empleados.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Empleados_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Empleados_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Empleados] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Empleados].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Empleados] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Empleados] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Empleados] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Empleados] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Empleados] SET ARITHABORT OFF 
GO
ALTER DATABASE [Empleados] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Empleados] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Empleados] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Empleados] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Empleados] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Empleados] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Empleados] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Empleados] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Empleados] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Empleados] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Empleados] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Empleados] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Empleados] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Empleados] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Empleados] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Empleados] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Empleados] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Empleados] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Empleados] SET  MULTI_USER 
GO
ALTER DATABASE [Empleados] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Empleados] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Empleados] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Empleados] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Empleados] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Empleados] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Empleados] SET QUERY_STORE = ON
GO
ALTER DATABASE [Empleados] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Empleados]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 27/01/2025 9:34:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](250) NULL,
	[Apellidos] [varchar](250) NULL,
	[IdTipoDocumento] [int] NULL,
	[NumeroDocumento] [int] NULL,
	[FechaNacimiento] [date] NULL,
	[Salario] [int] NULL,
	[IdEstadoCivil] [int] NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadosCiviles]    Script Date: 27/01/2025 9:34:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadosCiviles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_EstadosCiviles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposDocumento]    Script Date: 27/01/2025 9:34:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposDocumento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_TiposDocumento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EstadosCiviles] ON 

INSERT [dbo].[EstadosCiviles] ([Id], [Nombre]) VALUES (1, N'Solter@')
INSERT [dbo].[EstadosCiviles] ([Id], [Nombre]) VALUES (2, N'Casad@')
SET IDENTITY_INSERT [dbo].[EstadosCiviles] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposDocumento] ON 

INSERT [dbo].[TiposDocumento] ([Id], [Nombre]) VALUES (1, N'Cédula de ciudadanía
')
INSERT [dbo].[TiposDocumento] ([Id], [Nombre]) VALUES (2, N'Tarjeta de identidad
')
INSERT [dbo].[TiposDocumento] ([Id], [Nombre]) VALUES (3, N'Registro civil
')
INSERT [dbo].[TiposDocumento] ([Id], [Nombre]) VALUES (4, N'Pasaporte
')
INSERT [dbo].[TiposDocumento] ([Id], [Nombre]) VALUES (5, N'Tarjeta de extranjería
')
INSERT [dbo].[TiposDocumento] ([Id], [Nombre]) VALUES (6, N'Permiso especial de permanencia
')
INSERT [dbo].[TiposDocumento] ([Id], [Nombre]) VALUES (7, N'Documento de identificación extranjero
')
SET IDENTITY_INSERT [dbo].[TiposDocumento] OFF
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_EstadosCiviles] FOREIGN KEY([IdEstadoCivil])
REFERENCES [dbo].[EstadosCiviles] ([Id])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_EstadosCiviles]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_TiposDocumento] FOREIGN KEY([IdTipoDocumento])
REFERENCES [dbo].[TiposDocumento] ([Id])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_TiposDocumento]
GO
USE [master]
GO
ALTER DATABASE [Empleados] SET  READ_WRITE 
GO
