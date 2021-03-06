USE [master]
GO
/****** Object:  Database [MURK]    Script Date: 23/07/2018 02:03:20 PM ******/
CREATE DATABASE [MURK]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MURK', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\MURK.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MURK_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\MURK_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MURK] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MURK].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MURK] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MURK] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MURK] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MURK] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MURK] SET ARITHABORT OFF 
GO
ALTER DATABASE [MURK] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MURK] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [MURK] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MURK] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MURK] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MURK] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MURK] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MURK] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MURK] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MURK] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MURK] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MURK] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MURK] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MURK] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MURK] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MURK] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MURK] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MURK] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MURK] SET RECOVERY FULL 
GO
ALTER DATABASE [MURK] SET  MULTI_USER 
GO
ALTER DATABASE [MURK] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MURK] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MURK] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MURK] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MURK', N'ON'
GO
USE [MURK]
GO
/****** Object:  StoredProcedure [dbo].[ALTA_CATEGORIA]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ALTA_CATEGORIA]
@cat varchar(50)
as insert into Categoria
values(@cat,'1')
GO
/****** Object:  StoredProcedure [dbo].[ALTA_COMPAÑIA]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ALTA_COMPAÑIA]
@NOM VARCHAR(50),
@DIRECCION VARCHAR(50),@MUN VARCHAR(50),
@EST VARCHAR (50),
@CP VARCHAR(10), 
@PAIS VARCHAR(50),
@RFC VARCHAR(50)
AS INSERT INTO COMPAÑIA
VALUES(@NOM,@DIRECCION,@MUN,@EST,@CP,@PAIS,@RFC,'1')
GO
/****** Object:  StoredProcedure [dbo].[ALTA_GENERO]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ALTA_GENERO]
@GEN VARCHAR(50)
AS INSERT INTO Genero
VALUES(@GEN,'1')


GO
/****** Object:  StoredProcedure [dbo].[ALTA_LIBRO]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ALTA_LIBRO]
@ISBN VARCHAR(50),
@TIT VARCHAR(50),
@EDIT VARCHAR(50),
@AUTOR VARCHAR(50),
@ID_GEN INT,
@NO_P INT,
@EDICION INT, 
@IDIOMA  VARCHAR(50),
@PRECIO MONEY,
@STOCK INT
AS INSERT INTO Libro
VALUES(@ISBN,@TIT,@EDIT,@AUTOR,@ID_GEN,@NO_P,@EDICION,@IDIOMA,@PRECIO,@STOCK,'1')


GO
/****** Object:  StoredProcedure [dbo].[ALTA_PERSONA]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ALTA_PERSONA]
@NOM VARCHAR(50),@AP VARCHAR(50),@AM VARCHAR(50),@FN DATE,@DIR VARCHAR(50),@COL VARCHAR(50),
@MUN VARCHAR(50),@EST VARCHAR(50),@EMAIL VARCHAR(50),@TEL BIGINT
AS INSERT INTO Personas VALUES(@NOM,@AP,@AM,@FN,@DIR,@COL,@MUN,@EST,@EMAIL,@TEL,'1')


GO
/****** Object:  StoredProcedure [dbo].[ALTA_PROVEEDOR]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ALTA_PROVEEDOR]
@NOM VARCHAR(50),@AP VARCHAR(50),@EMAIL VARCHAR(50),@TEL BIGINT,@COMP int
AS INSERT INTO Provedor VALUES(@NOM,@AP,@EMAIL,@TEL,@COMP,'1')


GO
/****** Object:  StoredProcedure [dbo].[ALTA_RECARGO]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ALTA_RECARGO]
@ID_PRESTAMO INT,
@DIAS INT,
@RECARGO MONEY,
@ESTADO VARCHAR(50)
AS INSERT INTO Recargos
VALUES(@ID_PRESTAMO,@DIAS,@RECARGO,@ESTADO,'1')


GO
/****** Object:  StoredProcedure [dbo].[ALTA_RFID_LIBRO]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ALTA_RFID_LIBRO]
@RFID  VARCHAR(50),
@ID_LIBRO INT
AS INSERT INTO Libro_rfid 
VALUES(@RFID,@ID_LIBRO,'1','1')


GO
/****** Object:  StoredProcedure [dbo].[ALTA_TIPO_USUARIO]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ALTA_TIPO_USUARIO]
@TIPO VARCHAR(50)
AS INSERT INTO Tipo_usuario
VALUES (@TIPO,'1')


GO
/****** Object:  StoredProcedure [dbo].[ALTA_USUARIO]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ALTA_USUARIO]
@RFID VARCHAR(50),
@IDP INT,
@IDT INT
AS INSERT INTO Usuarios 
VALUES(@RFID,@IDP,@IDT,'1')


GO
/****** Object:  StoredProcedure [dbo].[BuscarLogin]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarLogin]
@rfid varchar(50)
as
SELECT Usuarios.Id_tipo_usuario, Usuarios.Status, Personas.Nombre FROM Usuarios, Tipo_usuario, Personas WHERE Personas.Id = Usuarios.Id_persona AND Usuarios.Id_tipo_usuario = Tipo_usuario.Id AND Usuarios.Rfid = @rfid

GO
/****** Object:  StoredProcedure [dbo].[LISTAR_COMPAÑIAS]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LISTAR_COMPAÑIAS]
AS
SELECT ID, NOMBRE FROM Compañia

GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Login]
@RFID varchar(50)
as
select * from Usuarios where Usuarios.Rfid like @RFID
GO
/****** Object:  Table [dbo].[Articulo_rfid]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Articulo_rfid](
	[Rfid] [varchar](50) NOT NULL,
	[Id_articulo] [int] NULL,
	[Disponible] [bit] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Articulo_rfid] PRIMARY KEY CLUSTERED 
(
	[Rfid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Articulos]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Articulos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](50) NULL,
	[Id_categoria] [int] NULL,
	[Precio_compra] [money] NULL,
	[Precio_renta] [money] NULL,
	[Id_provedor] [int] NULL,
	[Stock] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Articulos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categoria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Compañia]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Compañia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Municipio] [varchar](50) NULL,
	[Estado] [varchar](50) NULL,
	[CP] [varchar](10) NULL,
	[Pais] [varchar](50) NULL,
	[RFC] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Compañia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Conf_Modulos]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Conf_Modulos](
	[id] [int] NOT NULL,
	[modulo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Conf_Modulos] PRIMARY KEY CLUSTERED 
(
	[modulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Conf_modulos_acciones]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Conf_modulos_acciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Modulo] [varchar](50) NULL,
	[Accion] [varchar](50) NULL,
	[Rfid_usuario] [varchar](50) NULL,
 CONSTRAINT [PK_Conf_modulos_acciones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Configuracion]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Configuracion](
	[Id] [int] NOT NULL,
	[Accion] [varchar](50) NULL,
	[Valor] [varchar](50) NULL,
 CONSTRAINT [PK_Configuracion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Detalle_entrada]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_entrada](
	[Id_entrada] [int] NULL,
	[Id_articulo] [int] NULL,
	[Cantidad] [int] NULL,
	[Costo_unidad] [money] NULL,
	[Costo_total] [money] NULL,
	[Status] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Detalle_prestamo_art]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Detalle_prestamo_art](
	[Id] [int] NOT NULL,
	[Id_prestamo] [int] NULL,
	[Rfid_articulo] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Detalle_prestamo_art] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Detalle_prestamo_libro]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Detalle_prestamo_libro](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_prestamo] [int] NULL,
	[Rfid_libro] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Detalle_prestamo_libro] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Entradas]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Entradas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NULL,
	[Rfid_empleado] [varchar](50) NULL,
	[Descripcion] [varchar](50) NULL,
	[No_articulos] [int] NULL,
	[Importe] [money] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Entradas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Genero]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Genero](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Genero] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Genero] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Libro](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ISBN] [varchar](50) NULL,
	[Titulo] [varchar](50) NULL,
	[Editorial] [varchar](50) NULL,
	[Autor] [varchar](50) NULL,
	[Id_genero] [int] NULL,
	[No_paginas] [int] NULL,
	[Edicion] [int] NULL,
	[Idioma] [varchar](50) NULL,
	[Precio_compra] [money] NULL,
	[Stock] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Libro] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Libro_rfid]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Libro_rfid](
	[Rfid] [varchar](50) NOT NULL,
	[Id_libro] [int] NULL,
	[Disponible] [bit] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Libro_rfid] PRIMARY KEY CLUSTERED 
(
	[Rfid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Personas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido_P] [varchar](50) NOT NULL,
	[Apellido_M] [varchar](50) NULL,
	[FechaNacimiento] [date] NULL,
	[Direccion] [varchar](50) NULL,
	[Colonia] [varchar](50) NULL,
	[Municipio] [varchar](50) NULL,
	[Estado] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Telefono] [bigint] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Personas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Prestamo_art]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Prestamo_art](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Rfid_persona] [varchar](50) NULL,
	[Rfid_empleado] [varchar](50) NULL,
	[Fecha] [date] NULL,
	[Fecha_devolucion] [date] NULL,
	[Dias] [int] NULL,
	[Importe] [money] NULL,
	[Tipo_prestamo] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Prestamo_art] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Provedor]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Provedor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
	[Telefono] [bigint] NULL,
	[Id_compañia] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Provedor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Recargos]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Recargos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_prestamo] [int] NULL,
	[Dias_retraso] [int] NULL,
	[Recargo] [money] NULL,
	[Estado] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Recargos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tipo_usuario]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tipo_usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_tipo_usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 23/07/2018 02:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Rfid] [varchar](50) NOT NULL,
	[Id_persona] [int] NOT NULL,
	[Id_tipo_usuario] [int] NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Rfid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([Id], [Nombre], [Status]) VALUES (1, N'Computacion', 1)
INSERT [dbo].[Categoria] ([Id], [Nombre], [Status]) VALUES (2, N'DAS', 1)
INSERT [dbo].[Categoria] ([Id], [Nombre], [Status]) VALUES (1002, N'Herramientas', 1)
SET IDENTITY_INSERT [dbo].[Categoria] OFF
SET IDENTITY_INSERT [dbo].[Compañia] ON 

INSERT [dbo].[Compañia] ([Id], [Nombre], [Direccion], [Municipio], [Estado], [CP], [Pais], [RFC], [Status]) VALUES (1, N'HP', N'SILICONVALEY #20', N'AGUASCALIENTES', N'AGUASCALIENTES', N'12342', N'MEXICO', N'MNCH78348898CBH', 1)
SET IDENTITY_INSERT [dbo].[Compañia] OFF
SET IDENTITY_INSERT [dbo].[Genero] ON 

INSERT [dbo].[Genero] ([Id], [Genero], [Status]) VALUES (1, N'Fisica', 1)
INSERT [dbo].[Genero] ([Id], [Genero], [Status]) VALUES (2, N'Quimica', 1)
INSERT [dbo].[Genero] ([Id], [Genero], [Status]) VALUES (3, N'Terror', 1)
SET IDENTITY_INSERT [dbo].[Genero] OFF
SET IDENTITY_INSERT [dbo].[Personas] ON 

INSERT [dbo].[Personas] ([Id], [Nombre], [Apellido_P], [Apellido_M], [FechaNacimiento], [Direccion], [Colonia], [Municipio], [Estado], [Email], [Telefono], [Status]) VALUES (1, N'Kevin', N'Vera', N'Melendez', CAST(0x561F0B00 AS Date), N'Morelos #3', N'Centro', N'LuisMoya', N'Zacatecas', N'kevin@gmail.com', 48938829202, 1)
INSERT [dbo].[Personas] ([Id], [Nombre], [Apellido_P], [Apellido_M], [FechaNacimiento], [Direccion], [Colonia], [Municipio], [Estado], [Email], [Telefono], [Status]) VALUES (2, N'Ubaldo', N'Miramontes', N'Raygoza', CAST(0xB1170B00 AS Date), N'morelos #3', NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Personas] OFF
SET IDENTITY_INSERT [dbo].[Provedor] ON 

INSERT [dbo].[Provedor] ([Id], [Nombre], [Apellido], [Correo], [Telefono], [Id_compañia], [Status]) VALUES (4, N'JOEL', N'MARTINES', N'JOEL@HOTMAIL.COM', 32332323, 1, 1)
INSERT [dbo].[Provedor] ([Id], [Nombre], [Apellido], [Correo], [Telefono], [Id_compañia], [Status]) VALUES (5, N'DANIEL', N'SOSA', N'SOSA@GMAIL.COM', 78392719, 1, 1)
INSERT [dbo].[Provedor] ([Id], [Nombre], [Apellido], [Correo], [Telefono], [Id_compañia], [Status]) VALUES (6, N'dasdads', N'sds', N'ss', 1, 1, 1)
INSERT [dbo].[Provedor] ([Id], [Nombre], [Apellido], [Correo], [Telefono], [Id_compañia], [Status]) VALUES (7, N'FERNANDA', N'ROMO', N'ROM@GMAIL.COM', 4567892378, 1, 1)
INSERT [dbo].[Provedor] ([Id], [Nombre], [Apellido], [Correo], [Telefono], [Id_compañia], [Status]) VALUES (8, N'FERNANDA', N'ROMO', N'ROM@GMAIL.COM', 4567892378, 1, 1)
SET IDENTITY_INSERT [dbo].[Provedor] OFF
SET IDENTITY_INSERT [dbo].[Tipo_usuario] ON 

INSERT [dbo].[Tipo_usuario] ([Id], [Tipo], [Status]) VALUES (1, N'Admin', 1)
INSERT [dbo].[Tipo_usuario] ([Id], [Tipo], [Status]) VALUES (2, N'User', 1)
SET IDENTITY_INSERT [dbo].[Tipo_usuario] OFF
INSERT [dbo].[Usuarios] ([Rfid], [Id_persona], [Id_tipo_usuario], [Status]) VALUES (N'36D025D9', 2, 2, 1)
INSERT [dbo].[Usuarios] ([Rfid], [Id_persona], [Id_tipo_usuario], [Status]) VALUES (N'A7FC24D9', 1, 1, 1)
ALTER TABLE [dbo].[Articulo_rfid] ADD  CONSTRAINT [DF_Articulo_rfid_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Articulos] ADD  CONSTRAINT [DF_Articulos_status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Categoria] ADD  CONSTRAINT [DF_Categoria_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Detalle_entrada] ADD  CONSTRAINT [DF_Detalle_entrada_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Detalle_prestamo_libro] ADD  CONSTRAINT [DF_Detalle_prestamo_libro_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Entradas] ADD  CONSTRAINT [DF_Entradas_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Genero] ADD  CONSTRAINT [DF_Genero_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Libro] ADD  CONSTRAINT [DF_Libro_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Libro_rfid] ADD  CONSTRAINT [DF_Libro_rfid_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Personas] ADD  CONSTRAINT [DF_Personas_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Prestamo_art] ADD  CONSTRAINT [DF_Prestamo_art_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Provedor] ADD  CONSTRAINT [DF_Provedor_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Recargos] ADD  CONSTRAINT [DF_Recargos_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Tipo_usuario] ADD  CONSTRAINT [DF_Tipo_usuario_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Articulo_rfid]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_rfid_Articulos] FOREIGN KEY([Id_articulo])
REFERENCES [dbo].[Articulos] ([Id])
GO
ALTER TABLE [dbo].[Articulo_rfid] CHECK CONSTRAINT [FK_Articulo_rfid_Articulos]
GO
ALTER TABLE [dbo].[Articulos]  WITH CHECK ADD  CONSTRAINT [FK_Articulos_Categoria] FOREIGN KEY([Id_categoria])
REFERENCES [dbo].[Categoria] ([Id])
GO
ALTER TABLE [dbo].[Articulos] CHECK CONSTRAINT [FK_Articulos_Categoria]
GO
ALTER TABLE [dbo].[Articulos]  WITH CHECK ADD  CONSTRAINT [FK_Articulos_Provedor] FOREIGN KEY([Id_provedor])
REFERENCES [dbo].[Provedor] ([Id])
GO
ALTER TABLE [dbo].[Articulos] CHECK CONSTRAINT [FK_Articulos_Provedor]
GO
ALTER TABLE [dbo].[Conf_modulos_acciones]  WITH CHECK ADD  CONSTRAINT [FK_Conf_modulos_acciones_Conf_Modulos] FOREIGN KEY([Modulo])
REFERENCES [dbo].[Conf_Modulos] ([modulo])
GO
ALTER TABLE [dbo].[Conf_modulos_acciones] CHECK CONSTRAINT [FK_Conf_modulos_acciones_Conf_Modulos]
GO
ALTER TABLE [dbo].[Conf_modulos_acciones]  WITH CHECK ADD  CONSTRAINT [FK_Conf_modulos_acciones_Usuarios] FOREIGN KEY([Rfid_usuario])
REFERENCES [dbo].[Usuarios] ([Rfid])
GO
ALTER TABLE [dbo].[Conf_modulos_acciones] CHECK CONSTRAINT [FK_Conf_modulos_acciones_Usuarios]
GO
ALTER TABLE [dbo].[Detalle_entrada]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_entrada_Articulos] FOREIGN KEY([Id_articulo])
REFERENCES [dbo].[Articulos] ([Id])
GO
ALTER TABLE [dbo].[Detalle_entrada] CHECK CONSTRAINT [FK_Detalle_entrada_Articulos]
GO
ALTER TABLE [dbo].[Detalle_entrada]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_entrada_Entradas] FOREIGN KEY([Id_entrada])
REFERENCES [dbo].[Entradas] ([Id])
GO
ALTER TABLE [dbo].[Detalle_entrada] CHECK CONSTRAINT [FK_Detalle_entrada_Entradas]
GO
ALTER TABLE [dbo].[Detalle_prestamo_art]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_prestamo_art_Articulo_rfid] FOREIGN KEY([Rfid_articulo])
REFERENCES [dbo].[Articulo_rfid] ([Rfid])
GO
ALTER TABLE [dbo].[Detalle_prestamo_art] CHECK CONSTRAINT [FK_Detalle_prestamo_art_Articulo_rfid]
GO
ALTER TABLE [dbo].[Detalle_prestamo_art]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_prestamo_art_Prestamo_art] FOREIGN KEY([Id_prestamo])
REFERENCES [dbo].[Prestamo_art] ([Id])
GO
ALTER TABLE [dbo].[Detalle_prestamo_art] CHECK CONSTRAINT [FK_Detalle_prestamo_art_Prestamo_art]
GO
ALTER TABLE [dbo].[Detalle_prestamo_libro]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_prestamo_libro_Libro_rfid] FOREIGN KEY([Rfid_libro])
REFERENCES [dbo].[Libro_rfid] ([Rfid])
GO
ALTER TABLE [dbo].[Detalle_prestamo_libro] CHECK CONSTRAINT [FK_Detalle_prestamo_libro_Libro_rfid]
GO
ALTER TABLE [dbo].[Detalle_prestamo_libro]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_prestamo_libro_Prestamo_art] FOREIGN KEY([Id_prestamo])
REFERENCES [dbo].[Prestamo_art] ([Id])
GO
ALTER TABLE [dbo].[Detalle_prestamo_libro] CHECK CONSTRAINT [FK_Detalle_prestamo_libro_Prestamo_art]
GO
ALTER TABLE [dbo].[Entradas]  WITH CHECK ADD  CONSTRAINT [FK_Entradas_Usuarios] FOREIGN KEY([Rfid_empleado])
REFERENCES [dbo].[Usuarios] ([Rfid])
GO
ALTER TABLE [dbo].[Entradas] CHECK CONSTRAINT [FK_Entradas_Usuarios]
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK_Libro_Genero] FOREIGN KEY([Id_genero])
REFERENCES [dbo].[Genero] ([Id])
GO
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK_Libro_Genero]
GO
ALTER TABLE [dbo].[Libro_rfid]  WITH CHECK ADD  CONSTRAINT [FK_Libro_rfid_Libro] FOREIGN KEY([Id_libro])
REFERENCES [dbo].[Libro] ([Id])
GO
ALTER TABLE [dbo].[Libro_rfid] CHECK CONSTRAINT [FK_Libro_rfid_Libro]
GO
ALTER TABLE [dbo].[Prestamo_art]  WITH CHECK ADD  CONSTRAINT [FK_Prestamo_art_Usuarios] FOREIGN KEY([Rfid_empleado])
REFERENCES [dbo].[Usuarios] ([Rfid])
GO
ALTER TABLE [dbo].[Prestamo_art] CHECK CONSTRAINT [FK_Prestamo_art_Usuarios]
GO
ALTER TABLE [dbo].[Prestamo_art]  WITH CHECK ADD  CONSTRAINT [FK_Prestamo_art_Usuarios1] FOREIGN KEY([Rfid_persona])
REFERENCES [dbo].[Usuarios] ([Rfid])
GO
ALTER TABLE [dbo].[Prestamo_art] CHECK CONSTRAINT [FK_Prestamo_art_Usuarios1]
GO
ALTER TABLE [dbo].[Provedor]  WITH CHECK ADD  CONSTRAINT [FK_Provedor_Compañia] FOREIGN KEY([Id_compañia])
REFERENCES [dbo].[Compañia] ([Id])
GO
ALTER TABLE [dbo].[Provedor] CHECK CONSTRAINT [FK_Provedor_Compañia]
GO
ALTER TABLE [dbo].[Recargos]  WITH CHECK ADD  CONSTRAINT [FK_Recargos_Prestamo_art] FOREIGN KEY([Id_prestamo])
REFERENCES [dbo].[Prestamo_art] ([Id])
GO
ALTER TABLE [dbo].[Recargos] CHECK CONSTRAINT [FK_Recargos_Prestamo_art]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Personas] FOREIGN KEY([Id_persona])
REFERENCES [dbo].[Personas] ([Id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Personas]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Tipo_usuario] FOREIGN KEY([Id_tipo_usuario])
REFERENCES [dbo].[Tipo_usuario] ([Id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Tipo_usuario]
GO
USE [master]
GO
ALTER DATABASE [MURK] SET  READ_WRITE 
GO
