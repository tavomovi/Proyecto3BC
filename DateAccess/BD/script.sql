USE [ACME]
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 11/4/2024 23:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[IDEmpresa] [int] NOT NULL,
	[IDTipoEmpresa] [int] NOT NULL,
	[Empresa] [varchar](50) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[RUC] [varchar](15) NOT NULL,
	[FechaCreacion] [date] NOT NULL,
	[Presupuesto] [decimal](18, 2) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Empresa] PRIMARY KEY CLUSTERED 
(
	[IDEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEmpresa]    Script Date: 11/4/2024 23:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEmpresa](
	[IDTipoEmpresa] [int] NOT NULL,
	[TipoEmpresa] [varchar](100) NULL,
	[Descripcion] [varchar](1000) NULL,
	[Sigla] [varchar](10) NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_TipoEmpresa] PRIMARY KEY CLUSTERED 
(
	[IDTipoEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AnularEmpresa]    Script Date: 11/4/2024 23:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Aquí comienza la creación del nuevo procedimiento almacenado
CREATE PROCEDURE [dbo].[AnularEmpresa]
    @IDEmpresa int
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
    SET NOCOUNT ON;

    UPDATE [dbo].[Empresa]
    SET [Activo] = 0
    WHERE IDEmpresa = @IDEmpresa
END
GO
/****** Object:  StoredProcedure [dbo].[BuscarEmpresa]    Script Date: 11/4/2024 23:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarEmpresa]
    @IDEmpresa int
AS
BEGIN
    SET NOCOUNT ON;

    SELECT [IDEmpresa]
          ,[IDTipoEmpresa]
          ,[Empresa]
          ,[Direccion]
          ,[RUC]
          ,[FechaCreacion]
          ,[Presupuesto]
          ,[Activo]
    FROM [dbo].[Empresa]
    WHERE IDEmpresa = @IDEmpresa
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarEmpresa]    Script Date: 11/4/2024 23:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertarEmpresa]
    @IDTipoEmpresa int,
    @Empresa varchar(50),
    @Direccion varchar(100),
    @RUC varchar(15),
    @FechaCreacion date,
    @Presupuesto decimal(18, 3),
    @Activo bit,
    @IDEmpresa int OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Empresa] (
           [IDTipoEmpresa],
           [Empresa],
           [Direccion],
           [RUC],
           [FechaCreacion],
           [Presupuesto],
           [Activo])
    VALUES (
           @IDTipoEmpresa,
           @Empresa,
           @Direccion,
           @RUC,
           @FechaCreacion,
           @Presupuesto,
           @Activo);

    SELECT @IDEmpresa = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[ListarEmpresa]    Script Date: 11/4/2024 23:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[ListarEmpresa]
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
    SET NOCOUNT ON;

    SELECT [IDEmpresa]
          ,[IDTipoEmpresa]
          ,[Empresa]
          ,[Direccion]
          ,[RUC]
          ,[FechaCreacion]
          ,[Presupuesto]
          ,[Activo]
    FROM [dbo].[Empresa]
END
GO
/****** Object:  StoredProcedure [dbo].[ModificarEmpresa]    Script Date: 11/4/2024 23:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ModificarEmpresa]
    @IDEmpresa int,
    @IDTipoEmpresa int,
    @Empresa varchar(50),
    @Direccion varchar(100),
    @RUC varchar(15),
    @FechaCreacion date,
    @Presupuesto decimal(18, 2),
    @Activo bit
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE dbo.Empresa
    SET IDTipoEmpresa = @IDTipoEmpresa,
        Empresa = @Empresa,
        Direccion = @Direccion,
        RUC = @RUC,
        FechaCreacion = @FechaCreacion,
        Presupuesto = @Presupuesto,
        Activo = @Activo
    WHERE IDEmpresa = @IDEmpresa;
END
GO
