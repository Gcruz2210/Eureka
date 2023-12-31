/* Nombre: Geraldo Cruz Romero - Mat. 16-EIIN-1-082 - Seccion: 0541*/


USE [master]
GO
/****** Object:  Database [Eureka 2]    Script Date: 22/12/2023 3:01:32 p. m. ******/
CREATE DATABASE [Eureka 2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Eureka 2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Eureka 2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Eureka 2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Eureka 2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Eureka 2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Eureka 2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Eureka 2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Eureka 2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Eureka 2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Eureka 2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Eureka 2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Eureka 2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Eureka 2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Eureka 2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Eureka 2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Eureka 2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Eureka 2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Eureka 2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Eureka 2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Eureka 2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Eureka 2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Eureka 2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Eureka 2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Eureka 2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Eureka 2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Eureka 2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Eureka 2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Eureka 2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Eureka 2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Eureka 2] SET  MULTI_USER 
GO
ALTER DATABASE [Eureka 2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Eureka 2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Eureka 2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Eureka 2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Eureka 2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Eureka 2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Eureka 2] SET QUERY_STORE = ON
GO
ALTER DATABASE [Eureka 2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Eureka 2]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 22/12/2023 3:01:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Establecimiento]    Script Date: 22/12/2023 3:01:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Establecimiento](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Sucursal] [varchar](50) NULL,
	[Id_Producto] [int] NULL,
	[Id_Cliente] [int] NULL,
 CONSTRAINT [PK_Establecimiento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orden de entrega]    Script Date: 22/12/2023 3:01:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orden de entrega](
	[Id] [int] NOT NULL,
	[Id_Pedido_Cliente] [int] NULL,
	[Id_Cliente] [int] NULL,
 CONSTRAINT [PK_Orden de entrega] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido Cliente]    Script Date: 22/12/2023 3:01:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido Cliente](
	[Id] [int] NOT NULL,
	[Id_Producto] [int] NULL,
	[Cantidad] [float] NULL,
	[Sucursal] [varchar](50) NULL,
	[Precio] [float] NULL,
	[Id_Cliente] [int] NULL,
	[Id_Estableciemiento] [int] NULL,
 CONSTRAINT [PK_Pedido Cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 22/12/2023 3:01:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Precio] [float] NULL,
	[Cantidad_Disponible] [float] NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cliente] ([Id], [Nombre], [Direccion], [Telefono]) VALUES (1, N'Juan Gomez', N'Calle 10, No. 2, Parque del este', N'8095657477')
INSERT [dbo].[Cliente] ([Id], [Nombre], [Direccion], [Telefono]) VALUES (2, N'Luis Mejia', N'Calle H, Edificio I2, Apto, 2A, Alma Rosa', N'8097658943')
INSERT [dbo].[Cliente] ([Id], [Nombre], [Direccion], [Telefono]) VALUES (3, N'Farmacia Michel', N'Calle 5, No. 3, Maquiteria', N'8092349876')
INSERT [dbo].[Cliente] ([Id], [Nombre], [Direccion], [Telefono]) VALUES (4, N'Jeicob Cruz', N'Calle 8, No. 45, Parque del este', N'8098762314')
INSERT [dbo].[Cliente] ([Id], [Nombre], [Direccion], [Telefono]) VALUES (5, N'Geraldo Perez', N'Calle San Vicente de Paul, No. 15, Los mina', N'8095678763')
INSERT [dbo].[Cliente] ([Id], [Nombre], [Direccion], [Telefono]) VALUES (6, N'Miguel Heredia', N'Calle Esperanza, No. 234, Alma Rosa', N'8295673245')
INSERT [dbo].[Cliente] ([Id], [Nombre], [Direccion], [Telefono]) VALUES (7, N'Pamela Garcia', N'Calle E, No. 131, La Moneda', N'8092138796')
INSERT [dbo].[Cliente] ([Id], [Nombre], [Direccion], [Telefono]) VALUES (8, N'Jesus Hidalgo', N'Manzana H, Edificio 3, Apto 2b, El eden', N'8497863524')
INSERT [dbo].[Cliente] ([Id], [Nombre], [Direccion], [Telefono]) VALUES (9, N'Luisa Reyes', N'Calle Juan Erazo, No. 35, Villa Carmen', N'8095676578')
INSERT [dbo].[Cliente] ([Id], [Nombre], [Direccion], [Telefono]) VALUES (10, N'Adriana Maria', N'Calle Prolongacion B, No. 8, Villa Duarte', N'8097896434')
GO
INSERT [dbo].[Establecimiento] ([Id], [Nombre], [Sucursal], [Id_Producto], [Id_Cliente]) VALUES (1, N'Wilson Gourmet', N'San Vicente', NULL, NULL)
INSERT [dbo].[Establecimiento] ([Id], [Nombre], [Sucursal], [Id_Producto], [Id_Cliente]) VALUES (2, N'Wilson Gourmet', N'Pedro Livio', NULL, NULL)
INSERT [dbo].[Establecimiento] ([Id], [Nombre], [Sucursal], [Id_Producto], [Id_Cliente]) VALUES (3, N'Julio Empanada', N'San Vicente', NULL, NULL)
INSERT [dbo].[Establecimiento] ([Id], [Nombre], [Sucursal], [Id_Producto], [Id_Cliente]) VALUES (4, N'Farmacia Carol', N'San Vicente No. 2', NULL, NULL)
INSERT [dbo].[Establecimiento] ([Id], [Nombre], [Sucursal], [Id_Producto], [Id_Cliente]) VALUES (5, N'Farmacia Carol', N'San Vicente No. 1', NULL, NULL)
INSERT [dbo].[Establecimiento] ([Id], [Nombre], [Sucursal], [Id_Producto], [Id_Cliente]) VALUES (6, N'Adry Shopping', N'Virtual', NULL, NULL)
INSERT [dbo].[Establecimiento] ([Id], [Nombre], [Sucursal], [Id_Producto], [Id_Cliente]) VALUES (7, N'Cell Phone', N'Galeria 360', NULL, NULL)
INSERT [dbo].[Establecimiento] ([Id], [Nombre], [Sucursal], [Id_Producto], [Id_Cliente]) VALUES (8, N'Farmacia Michell', N'San Isidro', NULL, NULL)
INSERT [dbo].[Establecimiento] ([Id], [Nombre], [Sucursal], [Id_Producto], [Id_Cliente]) VALUES (9, N'Farmacia VIP', N'San Isidro', NULL, NULL)
INSERT [dbo].[Establecimiento] ([Id], [Nombre], [Sucursal], [Id_Producto], [Id_Cliente]) VALUES (10, N'Styles Shop', N'Virtual', NULL, NULL)
GO
INSERT [dbo].[Orden de entrega] ([Id], [Id_Pedido_Cliente], [Id_Cliente]) VALUES (1987, 123, 1)
INSERT [dbo].[Orden de entrega] ([Id], [Id_Pedido_Cliente], [Id_Cliente]) VALUES (1996, 124, 7)
INSERT [dbo].[Orden de entrega] ([Id], [Id_Pedido_Cliente], [Id_Cliente]) VALUES (1999, 125, 8)
INSERT [dbo].[Orden de entrega] ([Id], [Id_Pedido_Cliente], [Id_Cliente]) VALUES (2005, 126, 10)
INSERT [dbo].[Orden de entrega] ([Id], [Id_Pedido_Cliente], [Id_Cliente]) VALUES (2009, 127, 2)
INSERT [dbo].[Orden de entrega] ([Id], [Id_Pedido_Cliente], [Id_Cliente]) VALUES (2013, 128, 6)
INSERT [dbo].[Orden de entrega] ([Id], [Id_Pedido_Cliente], [Id_Cliente]) VALUES (2021, 129, 9)
INSERT [dbo].[Orden de entrega] ([Id], [Id_Pedido_Cliente], [Id_Cliente]) VALUES (2024, 130, 2)
INSERT [dbo].[Orden de entrega] ([Id], [Id_Pedido_Cliente], [Id_Cliente]) VALUES (2036, 131, 3)
INSERT [dbo].[Orden de entrega] ([Id], [Id_Pedido_Cliente], [Id_Cliente]) VALUES (2068, 132, 7)
GO
INSERT [dbo].[Pedido Cliente] ([Id], [Id_Producto], [Cantidad], [Sucursal], [Precio], [Id_Cliente], [Id_Estableciemiento]) VALUES (123, 2, 5, N'San Vicente', 150, 1, 1)
INSERT [dbo].[Pedido Cliente] ([Id], [Id_Producto], [Cantidad], [Sucursal], [Precio], [Id_Cliente], [Id_Estableciemiento]) VALUES (124, 7, 2, N'Galeria 360', 800, 7, 7)
INSERT [dbo].[Pedido Cliente] ([Id], [Id_Producto], [Cantidad], [Sucursal], [Precio], [Id_Cliente], [Id_Estableciemiento]) VALUES (125, 8, 1, N'San Isidro', 150, 8, 8)
INSERT [dbo].[Pedido Cliente] ([Id], [Id_Producto], [Cantidad], [Sucursal], [Precio], [Id_Cliente], [Id_Estableciemiento]) VALUES (126, 10, 3, N'Virtual', 2000, 2, 10)
INSERT [dbo].[Pedido Cliente] ([Id], [Id_Producto], [Cantidad], [Sucursal], [Precio], [Id_Cliente], [Id_Estableciemiento]) VALUES (127, 3, 1, N'Pedro Livio', 150, 7, 2)
INSERT [dbo].[Pedido Cliente] ([Id], [Id_Producto], [Cantidad], [Sucursal], [Precio], [Id_Cliente], [Id_Estableciemiento]) VALUES (128, 4, 2, N'Virtual', 560, 5, 6)
INSERT [dbo].[Pedido Cliente] ([Id], [Id_Producto], [Cantidad], [Sucursal], [Precio], [Id_Cliente], [Id_Estableciemiento]) VALUES (129, 9, 2, N'San Isidro', 465, 2, 9)
INSERT [dbo].[Pedido Cliente] ([Id], [Id_Producto], [Cantidad], [Sucursal], [Precio], [Id_Cliente], [Id_Estableciemiento]) VALUES (130, 1, 3, N'Pedro Livio', 200, 10, 2)
INSERT [dbo].[Pedido Cliente] ([Id], [Id_Producto], [Cantidad], [Sucursal], [Precio], [Id_Cliente], [Id_Estableciemiento]) VALUES (131, 5, 15, N'San Vicente', 65, 9, 3)
INSERT [dbo].[Pedido Cliente] ([Id], [Id_Producto], [Cantidad], [Sucursal], [Precio], [Id_Cliente], [Id_Estableciemiento]) VALUES (132, 6, 5, N'Galeria 360', 600, 5, 7)
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [Precio], [Cantidad_Disponible]) VALUES (1, N'Wrap de pollo', 200, 27)
INSERT [dbo].[Producto] ([Id], [Nombre], [Precio], [Cantidad_Disponible]) VALUES (2, N'Wrap de queso', 150, 35)
INSERT [dbo].[Producto] ([Id], [Nombre], [Precio], [Cantidad_Disponible]) VALUES (3, N'Wrap de jamon y queso', 150, 23)
INSERT [dbo].[Producto] ([Id], [Nombre], [Precio], [Cantidad_Disponible]) VALUES (4, N'Pantalon de mujer', 560, 6)
INSERT [dbo].[Producto] ([Id], [Nombre], [Precio], [Cantidad_Disponible]) VALUES (5, N'Empanada de res', 65, 40)
INSERT [dbo].[Producto] ([Id], [Nombre], [Precio], [Cantidad_Disponible]) VALUES (6, N'Cover Iphone 15', 600, 17)
INSERT [dbo].[Producto] ([Id], [Nombre], [Precio], [Cantidad_Disponible]) VALUES (7, N'Protector Pantalla Sansumg S23', 800, 13)
INSERT [dbo].[Producto] ([Id], [Nombre], [Precio], [Cantidad_Disponible]) VALUES (8, N'Herceptin 100mg', 15500, 4)
INSERT [dbo].[Producto] ([Id], [Nombre], [Precio], [Cantidad_Disponible]) VALUES (9, N'Acetaminofen Jbe 100ml', 465, 27)
INSERT [dbo].[Producto] ([Id], [Nombre], [Precio], [Cantidad_Disponible]) VALUES (10, N'Gorra MLB ', 2000, 18)
GO
ALTER TABLE [dbo].[Establecimiento]  WITH CHECK ADD  CONSTRAINT [FK_Establecimiento_Cliente] FOREIGN KEY([Id_Cliente])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[Establecimiento] CHECK CONSTRAINT [FK_Establecimiento_Cliente]
GO
ALTER TABLE [dbo].[Establecimiento]  WITH CHECK ADD  CONSTRAINT [FK_Establecimiento_Producto] FOREIGN KEY([Id_Producto])
REFERENCES [dbo].[Producto] ([Id])
GO
ALTER TABLE [dbo].[Establecimiento] CHECK CONSTRAINT [FK_Establecimiento_Producto]
GO
ALTER TABLE [dbo].[Orden de entrega]  WITH CHECK ADD  CONSTRAINT [FK_Orden de entrega_Cliente] FOREIGN KEY([Id_Cliente])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[Orden de entrega] CHECK CONSTRAINT [FK_Orden de entrega_Cliente]
GO
ALTER TABLE [dbo].[Orden de entrega]  WITH CHECK ADD  CONSTRAINT [FK_Orden de entrega_Pedido Cliente] FOREIGN KEY([Id_Pedido_Cliente])
REFERENCES [dbo].[Pedido Cliente] ([Id])
GO
ALTER TABLE [dbo].[Orden de entrega] CHECK CONSTRAINT [FK_Orden de entrega_Pedido Cliente]
GO
ALTER TABLE [dbo].[Pedido Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Pedido Cliente_Cliente] FOREIGN KEY([Id_Cliente])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[Pedido Cliente] CHECK CONSTRAINT [FK_Pedido Cliente_Cliente]
GO
ALTER TABLE [dbo].[Pedido Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Pedido Cliente_Establecimiento] FOREIGN KEY([Id_Estableciemiento])
REFERENCES [dbo].[Establecimiento] ([Id])
GO
ALTER TABLE [dbo].[Pedido Cliente] CHECK CONSTRAINT [FK_Pedido Cliente_Establecimiento]
GO
ALTER TABLE [dbo].[Pedido Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Pedido Cliente_Producto] FOREIGN KEY([Id_Producto])
REFERENCES [dbo].[Producto] ([Id])
GO
ALTER TABLE [dbo].[Pedido Cliente] CHECK CONSTRAINT [FK_Pedido Cliente_Producto]
GO
USE [master]
GO
ALTER DATABASE [Eureka 2] SET  READ_WRITE 
GO
