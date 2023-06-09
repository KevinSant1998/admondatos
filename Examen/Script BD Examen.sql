USE [master]
GO
/****** Object:  Database [Examen]    Script Date: 16/5/2023 21:16:08 ******/
CREATE DATABASE [Examen]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Examen', FILENAME = N'/var/opt/mssql/data/Examen.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Examen_log', FILENAME = N'/var/opt/mssql/data/Examen_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Examen] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Examen].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Examen] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Examen] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Examen] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Examen] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Examen] SET ARITHABORT OFF 
GO
ALTER DATABASE [Examen] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Examen] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Examen] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Examen] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Examen] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Examen] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Examen] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Examen] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Examen] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Examen] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Examen] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Examen] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Examen] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Examen] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Examen] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Examen] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Examen] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Examen] SET RECOVERY FULL 
GO
ALTER DATABASE [Examen] SET  MULTI_USER 
GO
ALTER DATABASE [Examen] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Examen] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Examen] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Examen] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Examen] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Examen] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Examen', N'ON'
GO
ALTER DATABASE [Examen] SET QUERY_STORE = OFF
GO
USE [Examen]
GO
/****** Object:  Table [dbo].[Caja]    Script Date: 16/5/2023 21:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Caja](
	[fiID] [int] IDENTITY(1,1) NOT NULL,
	[fiIDFactura] [int] NOT NULL,
	[fiMontoCaja] [int] NOT NULL,
 CONSTRAINT [PK_Caja] PRIMARY KEY CLUSTERED 
(
	[fiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 16/5/2023 21:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[fiIDCliente] [int] IDENTITY(1,1) NOT NULL,
	[fcNombre] [varchar](50) NOT NULL,
	[fcTelefono] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[fiIDCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deudas]    Script Date: 16/5/2023 21:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deudas](
	[fiIDDeuda] [int] IDENTITY(1,1) NOT NULL,
	[fcNombre] [varchar](50) NOT NULL,
	[fiMonto] [int] NOT NULL,
 CONSTRAINT [PK_Deudas] PRIMARY KEY CLUSTERED 
(
	[fiIDDeuda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 16/5/2023 21:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[fiIDFactura] [int] IDENTITY(1,1) NOT NULL,
	[fiIDProducto] [int] NULL,
	[fiCantidad] [int] NOT NULL,
	[fiIDCliente] [int] NULL,
	[fiMonto] [int] NOT NULL,
	[fcMovim] [varchar](50) NOT NULL,
	[fiIDDeuda] [int] NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[fiIDFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 16/5/2023 21:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[fiIDProducto] [int] IDENTITY(1,1) NOT NULL,
	[fcNombre] [nvarchar](50) NOT NULL,
	[fiPrecioCompra] [int] NOT NULL,
	[fiPrecioVenta] [int] NOT NULL,
	[fiUnidades] [int] NOT NULL,
	[fiIDProveedor] [int] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[fiIDProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 16/5/2023 21:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[fiIDProveedor] [int] IDENTITY(1,1) NOT NULL,
	[fcNombre] [varchar](50) NOT NULL,
	[fcTelefono] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[fiIDProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Caja] ON 

INSERT [dbo].[Caja] ([fiID], [fiIDFactura], [fiMontoCaja]) VALUES (1, 1, 1050)
INSERT [dbo].[Caja] ([fiID], [fiIDFactura], [fiMontoCaja]) VALUES (2, 2, 1075)
INSERT [dbo].[Caja] ([fiID], [fiIDFactura], [fiMontoCaja]) VALUES (3, 3, 1180)
INSERT [dbo].[Caja] ([fiID], [fiIDFactura], [fiMontoCaja]) VALUES (4, 4, 1240)
INSERT [dbo].[Caja] ([fiID], [fiIDFactura], [fiMontoCaja]) VALUES (5, 5, 1540)
INSERT [dbo].[Caja] ([fiID], [fiIDFactura], [fiMontoCaja]) VALUES (6, 6, 1600)
INSERT [dbo].[Caja] ([fiID], [fiIDFactura], [fiMontoCaja]) VALUES (7, 7, 1775)
INSERT [dbo].[Caja] ([fiID], [fiIDFactura], [fiMontoCaja]) VALUES (8, 8, 1575)
INSERT [dbo].[Caja] ([fiID], [fiIDFactura], [fiMontoCaja]) VALUES (9, 9, 1225)
INSERT [dbo].[Caja] ([fiID], [fiIDFactura], [fiMontoCaja]) VALUES (10, 10, 795)
SET IDENTITY_INSERT [dbo].[Caja] OFF
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([fiIDCliente], [fcNombre], [fcTelefono]) VALUES (1, N'Kevin', N'09-87-65-43')
INSERT [dbo].[Cliente] ([fiIDCliente], [fcNombre], [fcTelefono]) VALUES (2, N'Josue', N'09-87-62-43')
INSERT [dbo].[Cliente] ([fiIDCliente], [fcNombre], [fcTelefono]) VALUES (3, N'Mario', N'09-87-63-43')
INSERT [dbo].[Cliente] ([fiIDCliente], [fcNombre], [fcTelefono]) VALUES (4, N'Antonio', N'09-84-65-43')
INSERT [dbo].[Cliente] ([fiIDCliente], [fcNombre], [fcTelefono]) VALUES (5, N'Brayan', N'09-85-65-43')
INSERT [dbo].[Cliente] ([fiIDCliente], [fcNombre], [fcTelefono]) VALUES (6, N'Luis', N'09-87-66-43')
INSERT [dbo].[Cliente] ([fiIDCliente], [fcNombre], [fcTelefono]) VALUES (7, N'Juan', N'09-87-67-43')
INSERT [dbo].[Cliente] ([fiIDCliente], [fcNombre], [fcTelefono]) VALUES (8, N'Angel', N'09-87-68-43')
INSERT [dbo].[Cliente] ([fiIDCliente], [fcNombre], [fcTelefono]) VALUES (9, N'Gabriel', N'09-89-65-43')
INSERT [dbo].[Cliente] ([fiIDCliente], [fcNombre], [fcTelefono]) VALUES (10, N'Valeria', N'09-80-65-43')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Deudas] ON 

INSERT [dbo].[Deudas] ([fiIDDeuda], [fcNombre], [fiMonto]) VALUES (1, N'Luz', 200)
INSERT [dbo].[Deudas] ([fiIDDeuda], [fcNombre], [fiMonto]) VALUES (2, N'Telefono', 350)
INSERT [dbo].[Deudas] ([fiIDDeuda], [fcNombre], [fiMonto]) VALUES (3, N'Agua', 430)
SET IDENTITY_INSERT [dbo].[Deudas] OFF
GO
SET IDENTITY_INSERT [dbo].[Factura] ON 

INSERT [dbo].[Factura] ([fiIDFactura], [fiIDProducto], [fiCantidad], [fiIDCliente], [fiMonto], [fcMovim], [fiIDDeuda]) VALUES (1, 1, 2, 1, 50, N'Entrada', NULL)
INSERT [dbo].[Factura] ([fiIDFactura], [fiIDProducto], [fiCantidad], [fiIDCliente], [fiMonto], [fcMovim], [fiIDDeuda]) VALUES (2, 2, 1, 2, 25, N'Entrada', NULL)
INSERT [dbo].[Factura] ([fiIDFactura], [fiIDProducto], [fiCantidad], [fiIDCliente], [fiMonto], [fcMovim], [fiIDDeuda]) VALUES (3, 3, 3, 3, 105, N'Entrada', NULL)
INSERT [dbo].[Factura] ([fiIDFactura], [fiIDProducto], [fiCantidad], [fiIDCliente], [fiMonto], [fcMovim], [fiIDDeuda]) VALUES (4, 4, 4, 4, 60, N'Entrada', NULL)
INSERT [dbo].[Factura] ([fiIDFactura], [fiIDProducto], [fiCantidad], [fiIDCliente], [fiMonto], [fcMovim], [fiIDDeuda]) VALUES (5, 5, 5, 5, 300, N'Entrada', NULL)
INSERT [dbo].[Factura] ([fiIDFactura], [fiIDProducto], [fiCantidad], [fiIDCliente], [fiMonto], [fcMovim], [fiIDDeuda]) VALUES (6, 6, 6, 6, 60, N'Entrada', NULL)
INSERT [dbo].[Factura] ([fiIDFactura], [fiIDProducto], [fiCantidad], [fiIDCliente], [fiMonto], [fcMovim], [fiIDDeuda]) VALUES (7, 7, 7, 7, 175, N'Entrada', NULL)
INSERT [dbo].[Factura] ([fiIDFactura], [fiIDProducto], [fiCantidad], [fiIDCliente], [fiMonto], [fcMovim], [fiIDDeuda]) VALUES (8, NULL, 1, NULL, 200, N'Salida', 1)
INSERT [dbo].[Factura] ([fiIDFactura], [fiIDProducto], [fiCantidad], [fiIDCliente], [fiMonto], [fcMovim], [fiIDDeuda]) VALUES (9, NULL, 1, NULL, 350, N'Salida', 2)
INSERT [dbo].[Factura] ([fiIDFactura], [fiIDProducto], [fiCantidad], [fiIDCliente], [fiMonto], [fcMovim], [fiIDDeuda]) VALUES (10, NULL, 1, NULL, 430, N'Salida', 3)
SET IDENTITY_INSERT [dbo].[Factura] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([fiIDProducto], [fcNombre], [fiPrecioCompra], [fiPrecioVenta], [fiUnidades], [fiIDProveedor]) VALUES (1, N'PePsi', 20, 25, 100, 1)
INSERT [dbo].[Producto] ([fiIDProducto], [fcNombre], [fiPrecioCompra], [fiPrecioVenta], [fiUnidades], [fiIDProveedor]) VALUES (2, N'CocaCola', 20, 25, 60, 2)
INSERT [dbo].[Producto] ([fiIDProducto], [fcNombre], [fiPrecioCompra], [fiPrecioVenta], [fiUnidades], [fiIDProveedor]) VALUES (3, N'leche', 10, 35, 40, 3)
INSERT [dbo].[Producto] ([fiIDProducto], [fcNombre], [fiPrecioCompra], [fiPrecioVenta], [fiUnidades], [fiIDProveedor]) VALUES (4, N'Tomate', 10, 15, 40, 4)
INSERT [dbo].[Producto] ([fiIDProducto], [fcNombre], [fiPrecioCompra], [fiPrecioVenta], [fiUnidades], [fiIDProveedor]) VALUES (5, N'Arroz', 30, 60, 80, 5)
INSERT [dbo].[Producto] ([fiIDProducto], [fcNombre], [fiPrecioCompra], [fiPrecioVenta], [fiUnidades], [fiIDProveedor]) VALUES (6, N'Churro', 5, 10, 100, 6)
INSERT [dbo].[Producto] ([fiIDProducto], [fcNombre], [fiPrecioCompra], [fiPrecioVenta], [fiUnidades], [fiIDProveedor]) VALUES (7, N'Agua', 20, 25, 100, 7)
INSERT [dbo].[Producto] ([fiIDProducto], [fcNombre], [fiPrecioCompra], [fiPrecioVenta], [fiUnidades], [fiIDProveedor]) VALUES (8, N'Libro', 30, 105, 15, 8)
INSERT [dbo].[Producto] ([fiIDProducto], [fcNombre], [fiPrecioCompra], [fiPrecioVenta], [fiUnidades], [fiIDProveedor]) VALUES (9, N'Celular', 200, 300, 6, 9)
INSERT [dbo].[Producto] ([fiIDProducto], [fcNombre], [fiPrecioCompra], [fiPrecioVenta], [fiUnidades], [fiIDProveedor]) VALUES (10, N'Calendario', 20, 25, 10, 10)
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Proveedor] ON 

INSERT [dbo].[Proveedor] ([fiIDProveedor], [fcNombre], [fcTelefono]) VALUES (1, N'PePsi', N'12-34-56-78')
INSERT [dbo].[Proveedor] ([fiIDProveedor], [fcNombre], [fcTelefono]) VALUES (2, N'CocaCola', N'22-34-56-78')
INSERT [dbo].[Proveedor] ([fiIDProveedor], [fcNombre], [fcTelefono]) VALUES (3, N'Sula', N'32-34-56-78')
INSERT [dbo].[Proveedor] ([fiIDProveedor], [fcNombre], [fcTelefono]) VALUES (4, N'Natura', N'42-34-56-78')
INSERT [dbo].[Proveedor] ([fiIDProveedor], [fcNombre], [fcTelefono]) VALUES (5, N'NaNi', N'52-34-56-78')
INSERT [dbo].[Proveedor] ([fiIDProveedor], [fcNombre], [fcTelefono]) VALUES (6, N'RicaSula', N'62-34-56-78')
INSERT [dbo].[Proveedor] ([fiIDProveedor], [fcNombre], [fcTelefono]) VALUES (7, N'Rio', N'72-34-56-78')
INSERT [dbo].[Proveedor] ([fiIDProveedor], [fcNombre], [fcTelefono]) VALUES (8, N'Max', N'82-34-56-78')
INSERT [dbo].[Proveedor] ([fiIDProveedor], [fcNombre], [fcTelefono]) VALUES (9, N'Min', N'92-34-56-78')
INSERT [dbo].[Proveedor] ([fiIDProveedor], [fcNombre], [fcTelefono]) VALUES (10, N'Weber', N'10-34-56-78')
SET IDENTITY_INSERT [dbo].[Proveedor] OFF
GO
ALTER TABLE [dbo].[Caja]  WITH CHECK ADD  CONSTRAINT [FK_Caja_Factura] FOREIGN KEY([fiIDFactura])
REFERENCES [dbo].[Factura] ([fiIDFactura])
GO
ALTER TABLE [dbo].[Caja] CHECK CONSTRAINT [FK_Caja_Factura]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Cliente1] FOREIGN KEY([fiIDCliente])
REFERENCES [dbo].[Cliente] ([fiIDCliente])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Cliente1]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Deudas] FOREIGN KEY([fiIDDeuda])
REFERENCES [dbo].[Deudas] ([fiIDDeuda])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Deudas]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Producto1] FOREIGN KEY([fiIDProducto])
REFERENCES [dbo].[Producto] ([fiIDProducto])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Producto1]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Proveedor] FOREIGN KEY([fiIDProveedor])
REFERENCES [dbo].[Proveedor] ([fiIDProveedor])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Proveedor]
GO
USE [master]
GO
ALTER DATABASE [Examen] SET  READ_WRITE 
GO
