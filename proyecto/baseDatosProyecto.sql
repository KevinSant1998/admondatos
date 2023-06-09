USE [ProyectoNotas]
GO
/****** Object:  Table [dbo].[Asignacion]    Script Date: 21/6/2023 22:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignacion](
	[fiIDAsignacion] [int] IDENTITY(1,1) NOT NULL,
	[fiIDSeccion] [int] NOT NULL,
	[fcNombreAsignacion] [varchar](50) NOT NULL,
	[fcDescripcion] [varchar](50) NOT NULL,
	[fiActivo] [bit] NOT NULL,
 CONSTRAINT [PK_Asignacion] PRIMARY KEY CLUSTERED 
(
	[fiIDAsignacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 21/6/2023 22:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[fiIDEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[fiIDPersona] [int] NOT NULL,
	[fiIDTipoEmpleado] [int] NOT NULL,
	[fnSueldo] [decimal](13, 2) NOT NULL,
	[fiActivo] [bit] NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[fiIDEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estudiantes]    Script Date: 21/6/2023 22:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudiantes](
	[fiIDEstudiante] [int] IDENTITY(1,1) NOT NULL,
	[fiIDPersona] [int] NOT NULL,
	[fnActivo] [bit] NOT NULL,
	[fdFechaInicio] [datetime] NOT NULL,
	[fnBecado] [bit] NOT NULL,
	[fnTipoBeca] [int] NOT NULL,
 CONSTRAINT [PK_Estudiantes] PRIMARY KEY CLUSTERED 
(
	[fiIDEstudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materias]    Script Date: 21/6/2023 22:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materias](
	[fiMateria] [int] IDENTITY(1,1) NOT NULL,
	[fcNombreMateria] [varchar](50) NOT NULL,
	[fcDescripcion] [varchar](50) NOT NULL,
	[fnCosto] [decimal](13, 2) NOT NULL,
	[fiUnidadesValorativas] [int] NOT NULL,
 CONSTRAINT [PK_Materias] PRIMARY KEY CLUSTERED 
(
	[fiMateria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matricula]    Script Date: 21/6/2023 22:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matricula](
	[fiIDMatricula] [int] IDENTITY(1,1) NOT NULL,
	[fiIDSeccion] [int] NOT NULL,
	[fiIDEmpleado] [int] NOT NULL,
	[fiIDEstudiante] [int] NOT NULL,
	[fdFechaMatricula] [datetime] NOT NULL,
	[fnActivo] [int] NOT NULL,
 CONSTRAINT [PK_Matricula] PRIMARY KEY CLUSTERED 
(
	[fiIDMatricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notas]    Script Date: 21/6/2023 22:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notas](
	[fiIDNotaRegistro] [int] IDENTITY(1,1) NOT NULL,
	[fiIDEstudiante] [int] NOT NULL,
	[fiIDSeccion] [int] NOT NULL,
	[fnNota] [decimal](13, 2) NOT NULL,
 CONSTRAINT [PK_Notas] PRIMARY KEY CLUSTERED 
(
	[fiIDNotaRegistro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 21/6/2023 22:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[fiIDPersona] [int] IDENTITY(1,1) NOT NULL,
	[fcNombre] [varchar](50) NOT NULL,
	[fcTelefono] [varchar](50) NOT NULL,
	[fcCorreo] [varchar](50) NOT NULL,
	[fcDirecccion] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[fiIDPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puestos]    Script Date: 21/6/2023 22:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puestos](
	[fiPuesto] [int] IDENTITY(1,1) NOT NULL,
	[fcDescripcionPuesto] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Puestos] PRIMARY KEY CLUSTERED 
(
	[fiPuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seccion]    Script Date: 21/6/2023 22:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seccion](
	[fiIDSeccion] [int] IDENTITY(1,1) NOT NULL,
	[fiDias] [int] NOT NULL,
	[fcHora] [varchar](50) NOT NULL,
	[fiEmpleado] [int] NOT NULL,
	[fiIDMateria] [int] NOT NULL,
 CONSTRAINT [PK_Seccion] PRIMARY KEY CLUSTERED 
(
	[fiIDSeccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Asignacion]  WITH CHECK ADD  CONSTRAINT [FK_Asignacion_Seccion] FOREIGN KEY([fiIDSeccion])
REFERENCES [dbo].[Seccion] ([fiIDSeccion])
GO
ALTER TABLE [dbo].[Asignacion] CHECK CONSTRAINT [FK_Asignacion_Seccion]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Persona] FOREIGN KEY([fiIDPersona])
REFERENCES [dbo].[Persona] ([fiIDPersona])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_Persona]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Puestos] FOREIGN KEY([fiIDTipoEmpleado])
REFERENCES [dbo].[Puestos] ([fiPuesto])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_Puestos]
GO
ALTER TABLE [dbo].[Estudiantes]  WITH CHECK ADD  CONSTRAINT [FK_Estudiantes_Persona] FOREIGN KEY([fiIDPersona])
REFERENCES [dbo].[Persona] ([fiIDPersona])
GO
ALTER TABLE [dbo].[Estudiantes] CHECK CONSTRAINT [FK_Estudiantes_Persona]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_Matricula_Empleados] FOREIGN KEY([fiIDEmpleado])
REFERENCES [dbo].[Empleados] ([fiIDEmpleado])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_Matricula_Empleados]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_Matricula_Estudiantes] FOREIGN KEY([fiIDEstudiante])
REFERENCES [dbo].[Estudiantes] ([fiIDEstudiante])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_Matricula_Estudiantes]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_Matricula_Seccion] FOREIGN KEY([fiIDSeccion])
REFERENCES [dbo].[Seccion] ([fiIDSeccion])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_Matricula_Seccion]
GO
ALTER TABLE [dbo].[Notas]  WITH CHECK ADD  CONSTRAINT [FK_Notas_Estudiantes] FOREIGN KEY([fiIDEstudiante])
REFERENCES [dbo].[Estudiantes] ([fiIDEstudiante])
GO
ALTER TABLE [dbo].[Notas] CHECK CONSTRAINT [FK_Notas_Estudiantes]
GO
ALTER TABLE [dbo].[Notas]  WITH CHECK ADD  CONSTRAINT [FK_Notas_Seccion] FOREIGN KEY([fiIDSeccion])
REFERENCES [dbo].[Seccion] ([fiIDSeccion])
GO
ALTER TABLE [dbo].[Notas] CHECK CONSTRAINT [FK_Notas_Seccion]
GO
ALTER TABLE [dbo].[Seccion]  WITH CHECK ADD  CONSTRAINT [FK_Seccion_Empleados] FOREIGN KEY([fiEmpleado])
REFERENCES [dbo].[Empleados] ([fiIDEmpleado])
GO
ALTER TABLE [dbo].[Seccion] CHECK CONSTRAINT [FK_Seccion_Empleados]
GO
ALTER TABLE [dbo].[Seccion]  WITH CHECK ADD  CONSTRAINT [FK_Seccion_Materias1] FOREIGN KEY([fiIDMateria])
REFERENCES [dbo].[Materias] ([fiMateria])
GO
ALTER TABLE [dbo].[Seccion] CHECK CONSTRAINT [FK_Seccion_Materias1]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarNota]    Script Date: 21/6/2023 22:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ActualizarNota] 
	-- Add the parameters for the stored procedure here
	@piIDEstudiante int,
	@pnNota decimal(13,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Notas]
   SET 
      [fnNota] = @pnNota
 WHERE fiIDEstudiante = @piIDEstudiante
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearAsignacion]    Script Date: 21/6/2023 22:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CrearAsignacion]
	-- Add the parameters for the stored procedure here
	(@piIDSeccion int
     ,@pcNombreAsignacion varchar(50)
     ,@pcDescripcion varchar(50)
     ,@piActivo bit)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Asignacion]
           ([fiIDSeccion]
           ,[fcNombreAsignacion]
           ,[fcDescripcion]
           ,[fiActivo])
     VALUES
           (@piIDSeccion
           ,@pcNombreAsignacion
           ,@pcDescripcion
           ,@piActivo)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearEmpleado]    Script Date: 21/6/2023 22:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CrearEmpleado]
	-- Add the parameters for the stored procedure here
	(@pcNombre varchar(50),
	@pcTelefono varchar(50),
	@pcCorreo varchar(50),
	@pcDireccion varchar(150),
	@piIDTipoEmpleado int,
	@pnSueldo decimal(13,2))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Persona]
           ([fcNombre]
           ,[fcTelefono]
           ,[fcCorreo]
           ,[fcDirecccion])
     VALUES
           (@pcNombre
           ,@pcTelefono
           ,@pcCorreo
           ,@pcDireccion)

		   

	INSERT INTO [dbo].[Empleados]
           ([fiIDPersona]
           ,[fiIDTipoEmpleado]
           ,[fnSueldo]
           ,[fiActivo])
     VALUES
           (IDENT_CURRENT('Persona')
           ,@piIDTipoEmpleado
           ,@pnSueldo
           ,1)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearEstudiante]    Script Date: 21/6/2023 22:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CrearEstudiante] 
	-- Add the parameters for the stored procedure here
	(@pcNombre varchar(50),
	@pcTelefono varchar(50),
	@pcCorreo varchar(50),
	@pcDireccion varchar(150),
	@piBeca int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Persona]
           ([fcNombre]
           ,[fcTelefono]
           ,[fcCorreo]
           ,[fcDirecccion])
     VALUES
           (@pcNombre
           ,@pcTelefono
           ,@pcCorreo
           ,@pcDireccion)

	INSERT INTO [dbo].[Estudiantes]
           ([fiIDPersona]
           ,[fnActivo]
           ,[fdFechaInicio]
           ,[fnBecado]
           ,[fnTipoBeca])
     VALUES
           (IDENT_CURRENT('Persona')
           ,1
           ,GETDATE()
           ,1
           ,@piBeca)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearMateria]    Script Date: 21/6/2023 22:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CrearMateria]
	-- Add the parameters for the stored procedure here
	(@pcNombreMateria varchar(50),
	@pcDescripcion varchar(50),
	@pnCosto decimal(13,2),
	@piUnidadesValorativas int
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Materias]
           ([fcNombreMateria]
           ,[fcDescripcion]
           ,[fnCosto]
           ,[fiUnidadesValorativas])
     VALUES
           (@pcNombreMateria
           ,@pcDescripcion
           ,@pnCosto
           ,@piUnidadesValorativas)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearMatricula]    Script Date: 21/6/2023 22:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CrearMatricula]
	-- Add the parameters for the stored procedure here
	(@piIDSeccion int
     ,@piIDEmpleado int
     ,@piIDEstudiante int
     ,@pnActivo int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Matricula]
           ([fiIDSeccion]
           ,[fiIDEmpleado]
           ,[fiIDEstudiante]
           ,[fdFechaMatricula]
           ,[fnActivo])
     VALUES
           (@piIDSeccion
           ,@piIDEmpleado
           ,@piIDEstudiante
           ,GETDATE()
           ,@pnActivo)

	INSERT INTO [dbo].[Notas]
           ([fiIDEstudiante]
           ,[fiIDSeccion]
           ,[fnNota])
     VALUES
           (@piIDEstudiante
           ,@piIDSeccion
           ,0)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearPuesto]    Script Date: 21/6/2023 22:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CrearPuesto] 
	-- Add the parameters for the stored procedure here
	@pcDescripcionPuesto varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Puestos]
           ([fcDescripcionPuesto])
     VALUES
           (@pcDescripcionPuesto)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearSecccion]    Script Date: 21/6/2023 22:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CrearSecccion]
	-- Add the parameters for the stored procedure here
	(@piDias int
     ,@pcHora varchar(50)
     ,@piEmpleado int
	 ,@piMateria int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Seccion]
           ([fiDias]
           ,[fcHora]
           ,[fiEmpleado]
		   ,[fiIDMateria])
     VALUES
           (@piDias
           ,@pcHora
           ,@piEmpleado
		   ,@piMateria)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarAsignacion]    Script Date: 21/6/2023 22:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_EliminarAsignacion]
	-- Add the parameters for the stored procedure here
	@piIDAsignacion int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [dbo].[Asignacion]
      WHERE fiIDAsignacion = @piIDAsignacion
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarAsignaciones]    Script Date: 21/6/2023 22:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ListarAsignaciones] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
	A.fiIDAsignacion,
	A.fcNombreAsignacion,
	A.fcDescripcion,
	A.fiIDSeccion,
	A.fiActivo
	from Asignacion as A
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarEmpleados]    Script Date: 21/6/2023 22:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ListarEmpleados] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
	E.fiIDEmpleado,
	P.fcNombre,
	P.fcCorreo,
	P.fcTelefono,
	Pu.fcDescripcionPuesto,
	E.fnSueldo,
	E.fiActivo

	from Empleados as E
	left join Persona as P on P.fiIDPersona = E.fiIDPersona
	left join Puestos as Pu on Pu.fiPuesto = E.fiIDTipoEmpleado
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarEstudiantes]    Script Date: 21/6/2023 22:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ListarEstudiantes]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  
	E.fiIDEstudiante,
	P.fcNombre,
	P.fcCorreo,
	P.fcTelefono,
	E.fdFechaInicio,
	E.fnBecado,
	E.fnActivo

	from Estudiantes as E
	left join Persona as P on P.fiIDPersona = E.fiIDPersona
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarMAtricula]    Script Date: 21/6/2023 22:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ListarMAtricula]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
	M.fiIDMatricula,
	M.fdFechaMatricula,
	S.fiIDSeccion,
	Ms.fcNombreMateria,
	Em.fiIDEmpleado,
	P.fcNombre as fcNombreEmpleado,
	Es.fiIDEstudiante,
	Per.fcNombre as fcNombreEstudiante,
	N.fnNota
	from Matricula as M
	left join Seccion as S on S.fiIDSeccion = M.fiIDSeccion
	left join Notas as N on N.fiIDSeccion = S.fiIDSeccion
	left join Materias as Ms on Ms.fiMateria = S.fiIDMateria
	left join Empleados as Em on Em.fiIDEmpleado = M.fiIDEmpleado
	left join Persona as P on P.fiIDPersona = Em.fiIDPersona
	left join Estudiantes as Es on Es.fiIDEstudiante = M.fiIDEstudiante
	left join Persona as Per on Per.fiIDPersona = Es.fiIDPersona
END
GO
/****** Object:  StoredProcedure [dbo].[sp_VerNotas]    Script Date: 21/6/2023 22:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_VerNotas] 
	-- Add the parameters for the stored procedure here
	(@piIDEstudiante int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  
	P.fcNombre,
	S.fiIDSeccion,
	M.fcNombreMateria,
	N.fnNota
	from Notas as N
	left join Seccion as S on S.fiIDSeccion = N.fiIDSeccion
	left join Materias as M on M.fiMateria = S.fiIDMateria
	left join Estudiantes as E on E.fiIDEstudiante = @piIDEstudiante
	left join Persona as P on P.fiIDPersona = E.fiIDPersona
	where N.fiIDEstudiante = @piIDEstudiante
END
GO
