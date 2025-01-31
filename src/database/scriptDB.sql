USE [ASADA]
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo](
	[IdArticulo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Descripcion] [text] NULL,
	[IdCategoria] [int] NULL,
	[PrecioCosto] [decimal](10, 2) NULL,
	[PrecioPromedio] [decimal](10, 2) NULL,
	[CantidadActual] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auditoria]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auditoria](
	[IdAuditoria] [int] IDENTITY(1,1) NOT NULL,
	[FechaHora] [datetime] NULL,
	[Usuario] [varchar](100) NULL,
	[Rol] [varchar](50) NULL,
	[TablaAfectada] [varchar](100) NULL,
	[Accion] [varchar](50) NULL,
	[IdAfectado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAuditoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bodega]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bodega](
	[IdBodega] [int] IDENTITY(1,1) NOT NULL,
	[NombreBodega] [varchar](100) NULL,
	[Ubicacion] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdBodega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[NombreCategoria] [varchar](100) NULL,
	[DescripcionCategoria] [varchar](150) NULL,
	[NombreCorto] [varchar](50) NULL,
	[FechaCreacion] [date] NULL,
	[Estado] [varchar](50) NULL,
	[DetallesAdicionales] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[IdInventario] [int] IDENTITY(1,1) NOT NULL,
	[IdArticulo] [int] NULL,
	[IdBodega] [int] NULL,
	[CantidadStock] [int] NULL,
	[UmbralMinimo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdInventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientoInventario]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientoInventario](
	[IdMovimiento] [int] IDENTITY(1,1) NOT NULL,
	[IdArticulo] [int] NULL,
	[IdBodegaOrigen] [int] NULL,
	[IdBodegaDestino] [int] NULL,
	[Cantidad] [int] NULL,
	[TipoMovimiento] [varchar](50) NULL,
	[Fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trazabilidad]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trazabilidad](
	[IdTrazabilidad] [int] IDENTITY(1,1) NOT NULL,
	[IdArticulo] [int] NOT NULL,
	[IdBodega] [int] NULL,
	[Estado] [varchar](20) NULL,
	[FechaRegistro] [datetime] NULL,
	[Detalles] [varchar](max) NULL,
	[IdTrazabilidadP] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTrazabilidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Contrasena] [varchar](100) NULL,
	[Rol] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Auditoria] ADD  DEFAULT (getdate()) FOR [FechaHora]
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD FOREIGN KEY([IdArticulo])
REFERENCES [dbo].[Articulo] ([IdArticulo])
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD FOREIGN KEY([IdBodega])
REFERENCES [dbo].[Bodega] ([IdBodega])
GO
ALTER TABLE [dbo].[MovimientoInventario]  WITH CHECK ADD FOREIGN KEY([IdArticulo])
REFERENCES [dbo].[Articulo] ([IdArticulo])
GO
ALTER TABLE [dbo].[MovimientoInventario]  WITH CHECK ADD FOREIGN KEY([IdBodegaOrigen])
REFERENCES [dbo].[Bodega] ([IdBodega])
GO
ALTER TABLE [dbo].[MovimientoInventario]  WITH CHECK ADD FOREIGN KEY([IdBodegaDestino])
REFERENCES [dbo].[Bodega] ([IdBodega])
GO
ALTER TABLE [dbo].[Trazabilidad]  WITH NOCHECK ADD FOREIGN KEY([IdTrazabilidadP])
REFERENCES [dbo].[Trazabilidad] ([IdTrazabilidad])
GO
ALTER TABLE [dbo].[Trazabilidad]  WITH NOCHECK ADD  CONSTRAINT [FK_IdArticulo] FOREIGN KEY([IdArticulo])
REFERENCES [dbo].[Articulo] ([IdArticulo])
GO
ALTER TABLE [dbo].[Trazabilidad] NOCHECK CONSTRAINT [FK_IdArticulo]
GO
ALTER TABLE [dbo].[Trazabilidad]  WITH NOCHECK ADD  CONSTRAINT [FK_IdBodega] FOREIGN KEY([IdBodega])
REFERENCES [dbo].[Bodega] ([IdBodega])
GO
ALTER TABLE [dbo].[Trazabilidad] NOCHECK CONSTRAINT [FK_IdBodega]
GO
/****** Object:  StoredProcedure [dbo].[pa_ActualizarArticulo]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_ActualizarArticulo]
    @pIdArticulo INT,
    @pNombre VARCHAR(100),
    @pDescripcion TEXT,
    @pIdCategoria INT,
    @pPrecioCosto DECIMAL(10, 2),
    @pPrecioPromedio DECIMAL(10, 2),
    @pCantidadActual INT
AS
BEGIN
    DECLARE @msg VARCHAR(100);
    DECLARE @EstadoCategoria VARCHAR(50);

    -- Verificar si el artículo existe por su IdArticulo
    IF NOT EXISTS (SELECT 1 FROM Articulo WHERE IdArticulo = @pIdArticulo)
    BEGIN
        SET @msg = 'Artículo con ese IdArticulo no existe.';
        SELECT @msg AS Msg;
        RETURN;
    END;

    -- Verificar el estado de la categoría
    SELECT @EstadoCategoria = Estado FROM Categoria WHERE IdCategoria = @pIdCategoria;

    IF @EstadoCategoria = 'desactivado'
    BEGIN
        SET @msg = 'No se puede actualizar un artículo en una categoría desactivada.';
        SELECT @msg AS Msg;
        RETURN;
    END;

    -- Actualizar el artículo
    UPDATE Articulo
    SET Nombre = @pNombre,
        Descripcion = @pDescripcion,
        IdCategoria = @pIdCategoria,
        PrecioCosto = @pPrecioCosto,
        PrecioPromedio = @pPrecioPromedio,
        CantidadActual = @pCantidadActual
    WHERE IdArticulo = @pIdArticulo;

    -- Mensaje de éxito
    SET @msg = 'Artículo actualizado correctamente.';
    SELECT @msg AS Msg;
    RETURN;
END;
GO
/****** Object:  StoredProcedure [dbo].[pa_ActualizarBodega]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pa_ActualizarBodega]
    @pIdBodega INT,
    @pNombreBodega VARCHAR(50),
    @pUbicacion VARCHAR(45)
AS
BEGIN
	DECLARE @msg VARCHAR(100);
    IF NOT EXISTS (SELECT 1 FROM Bodega WHERE IdBodega = @pIdBodega)
    BEGIN
        SET @msg = 'Bodega con ese id no existe';
        SELECT @msg AS Msg;
        RETURN;
    END

    UPDATE Bodega
    SET NombreBodega = @pNombreBodega,
        Ubicacion = @pUbicacion
    WHERE IdBodega = @pIdBodega;

    SET @msg = 'Bodega actualizada correctamente';
        SELECT @msg AS Msg;
        RETURN;
END;
GO
/****** Object:  StoredProcedure [dbo].[pa_ActualizarCategoria]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_ActualizarCategoria]
    @pIdCategoria INT,
    @pNombreCategoria VARCHAR(100),
    @pDescripcionCategoria VARCHAR(150),
    @pNombreCorto VARCHAR(50),
    @pEstado VARCHAR(50),
    @pDetallesAdicionales VARCHAR(150)
AS
BEGIN
    DECLARE @msg VARCHAR(100);

    -- Verificar si la categoría existe por su IdCategoria
    IF NOT EXISTS (SELECT 1 FROM Categoria WHERE IdCategoria = @pIdCategoria)
    BEGIN
        SET @msg = 'La categoría con ese IdCategoria no existe.';
        SELECT @msg AS Msg;
        RETURN;
    END;

    -- Actualizar la categoría
    UPDATE Categoria
    SET NombreCategoria = @pNombreCategoria,
        DescripcionCategoria = @pDescripcionCategoria,
        NombreCorto = @pNombreCorto,
        FechaCreacion = GETDATE(), -- Usar la fecha y hora actuales
        Estado = @pEstado,
        DetallesAdicionales = @pDetallesAdicionales
    WHERE IdCategoria = @pIdCategoria;

    -- Mensaje de éxito
    SET @msg = 'Categoría actualizada correctamente.';
    SELECT @msg AS Msg;
    RETURN;
END;
GO
/****** Object:  StoredProcedure [dbo].[pa_ActualizarInventario]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_ActualizarInventario]
    @pIdInventario INT,
    @pIdArticulo INT,
    @pIdBodega INT,
    @pCantidadStock INT,
    @pUmbralMinimo INT
AS
BEGIN
    DECLARE @msg VARCHAR(100);

    -- Verificar si el registro de inventario existe por su IdInventario
    IF NOT EXISTS (SELECT 1 FROM Inventario WHERE IdInventario = @pIdInventario)
    BEGIN
        SET @msg = 'El registro de inventario con ese IdInventario no existe.';
        SELECT @msg AS Msg;
        RETURN;
    END;

    -- Actualizar el registro de inventario
    UPDATE Inventario
    SET IdArticulo = @pIdArticulo,
        IdBodega = @pIdBodega,
        CantidadStock = @pCantidadStock,
        UmbralMinimo = @pUmbralMinimo
    WHERE IdInventario = @pIdInventario;

    -- Mensaje de éxito
    SET @msg = 'Registro de inventario actualizado correctamente.';
    SELECT @msg AS Msg;
    RETURN;
END;
GO
/****** Object:  StoredProcedure [dbo].[pa_ActualizarMovimientoInventario]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_ActualizarMovimientoInventario]
    @pIdMovimiento INT,
    @pIdArticulo INT,
    @pIdBodegaOrigen INT,
    @pIdBodegaDestino INT,
    @pCantidad INT,
    @pTipoMovimiento VARCHAR(50)
AS
BEGIN
    DECLARE @msg VARCHAR(100);

    -- Verificar si el movimiento de inventario existe por su IdMovimiento
    IF NOT EXISTS (SELECT 1 FROM MovimientoInventario WHERE IdMovimiento = @pIdMovimiento)
    BEGIN
        SET @msg = 'El movimiento de inventario con ese IdMovimiento no existe.';
        SELECT @msg AS Msg;
        RETURN;
    END;

    -- Actualizar el movimiento de inventario
    UPDATE MovimientoInventario
    SET IdArticulo = @pIdArticulo,
        IdBodegaOrigen = @pIdBodegaOrigen,
        IdBodegaDestino = @pIdBodegaDestino,
        Cantidad = @pCantidad,
        TipoMovimiento = @pTipoMovimiento,
        Fecha = GETDATE()
    WHERE IdMovimiento = @pIdMovimiento;

    -- Mensaje de éxito
    SET @msg = 'Movimiento de inventario actualizado correctamente.';
    SELECT @msg AS Msg;
    RETURN;
END;
GO
/****** Object:  StoredProcedure [dbo].[pa_ActualizarUsuario]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_ActualizarUsuario]
    @pIdUsuario INT,
    @pNombre VARCHAR(50),
    @pContrasena VARCHAR(45),
	@pRol VARCHAR(45)
AS
BEGIN
	DECLARE @msg VARCHAR(100);
    IF NOT EXISTS (SELECT 1 FROM Usuario WHERE IdUsuario = @pIdUsuario)
    BEGIN
        SET @msg = 'El usuario específico no existe .';
        SELECT @msg AS Msg;
        RETURN;
    END

    UPDATE Usuario
    SET Nombre = @pNombre,
        Contrasena = @pContrasena,
		Rol = @pRol
    WHERE IdUsuario = @pIdUsuario;

    SET @msg = 'Usuario actualizado correctamete .';
        SELECT @msg AS Msg;
        RETURN;
END;
GO
/****** Object:  StoredProcedure [dbo].[pa_AgregarArticulo]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_AgregarArticulo]
    @pNombre VARCHAR(100),
    @pDescripcion TEXT,
    @pIdCategoria INT,
    @pPrecioCosto DECIMAL(10, 2),
    @pPrecioPromedio DECIMAL(10, 2),
    @pCantidadActual INT
AS
BEGIN
    DECLARE @msg VARCHAR(100);
    DECLARE @EstadoCategoria VARCHAR(50);

    -- Verificar el estado de la categoría
    SELECT @EstadoCategoria = Estado FROM Categoria WHERE IdCategoria = @pIdCategoria;

    IF @EstadoCategoria = 'desactivado'
    BEGIN
        SET @msg = 'No se puede agregar un artículo a una categoría desactivada.';
        SELECT @msg AS Msg;
        RETURN;
    END;

    -- Insertar el nuevo artículo
    INSERT INTO dbo.Articulo (Nombre, Descripcion, IdCategoria, PrecioCosto, PrecioPromedio, CantidadActual)
    VALUES (@pNombre, @pDescripcion, @pIdCategoria, @pPrecioCosto, @pPrecioPromedio, @pCantidadActual);

    -- Mensaje de éxito
    SET @msg = 'Artículo agregado correctamente.';
    SELECT @msg AS Msg;
    RETURN;
END;
GO
/****** Object:  StoredProcedure [dbo].[pa_AgregarBodega]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_AgregarBodega]

    @pNombreBodega VARCHAR(100),
    @pUbicacion VARCHAR(100)
AS
BEGIN
    DECLARE @msg VARCHAR(100);

    INSERT INTO dbo.Bodega (NombreBodega, Ubicacion)
    VALUES (@pNombreBodega, @pUbicacion);

    SET @msg = 'Bodega agregada correctamente.';
    SELECT @msg AS Msg;
    RETURN;
END;
GO
/****** Object:  StoredProcedure [dbo].[pa_AgregarCategoria]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_AgregarCategoria]
    @pNombreCategoria VARCHAR(100),
    @pDescripcionCategoria VARCHAR(150),
    @pNombreCorto VARCHAR(50),
    @pEstado VARCHAR(50),
    @pDetallesAdicionales VARCHAR(150)
AS
BEGIN
    DECLARE @msg VARCHAR(100);

    -- Insertar la nueva categoría
    INSERT INTO dbo.Categoria (NombreCategoria, DescripcionCategoria, NombreCorto, FechaCreacion, Estado, DetallesAdicionales)
    VALUES (@pNombreCategoria, @pDescripcionCategoria, @pNombreCorto, GETDATE(), @pEstado, @pDetallesAdicionales);

    -- Mensaje de éxito
    SET @msg = 'Categoría agregada correctamente.';
    SELECT @msg AS Msg;
    RETURN;
END;
GO
/****** Object:  StoredProcedure [dbo].[pa_AgregarInventario]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_AgregarInventario]
    @pIdArticulo INT,
    @pIdBodega INT,
    @pUmbralMinimo INT
AS
BEGIN
    DECLARE @msg VARCHAR(100);
    DECLARE @CantidadActual INT;

    -- Obtener la cantidad actual del artículo
    SELECT @CantidadActual = CantidadActual
    FROM dbo.Articulo
    WHERE IdArticulo = @pIdArticulo;

    -- Verificar si se obtuvo la cantidad actual del artículo
    IF @CantidadActual IS NULL
    BEGIN
        SET @msg = 'El artículo no existe o no tiene cantidad actual registrada.';
        SELECT @msg AS Msg;
        RETURN;
    END;

    -- Insertar nuevo registro de inventario utilizando la cantidad actual del artículo
    INSERT INTO dbo.Inventario (IdArticulo, IdBodega, CantidadStock, UmbralMinimo)
    VALUES (@pIdArticulo, @pIdBodega, @CantidadActual, @pUmbralMinimo);

    -- Mensaje de éxito
    SET @msg = 'Registro de inventario agregado correctamente.';
    SELECT @msg AS Msg;
    RETURN;
END;
GO
/****** Object:  StoredProcedure [dbo].[pa_AgregarMovimientoInventario]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_AgregarMovimientoInventario]
    @pIdArticulo INT,
    @pIdBodegaOrigen INT,
    @pIdBodegaDestino INT,
    @pCantidad INT,
    @pTipoMovimiento VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @msg VARCHAR(100);
    DECLARE @StockActualOrigen INT;

    -- Verificar si el artículo está en la bodega de origen
    SELECT @StockActualOrigen = CantidadStock 
    FROM Inventario 
    WHERE IdArticulo = @pIdArticulo AND IdBodega = @pIdBodegaOrigen;

    IF @StockActualOrigen IS NULL
    BEGIN
        -- Si el artículo no se encuentra en la bodega de origen, retornar un mensaje de error
        SET @msg = 'El artículo no se encuentra en la bodega de origen especificada';
        SELECT @msg AS Msg;
        RETURN;
    END

    -- Verificar si la cantidad a pasar es mayor que el stock en la bodega de origen
    IF @pCantidad > @StockActualOrigen
    BEGIN
        -- Si la cantidad a pasar es mayor que el stock disponible, retornar un mensaje de error
        SET @msg = 'La cantidad a pasar es mayor que el stock disponible en la bodega de origen';
        SELECT @msg AS Msg;
        RETURN;
    END

    -- Insertar el nuevo movimiento de inventario
    INSERT INTO dbo.MovimientoInventario (IdArticulo, IdBodegaOrigen, IdBodegaDestino, Cantidad, TipoMovimiento, Fecha)
    VALUES (@pIdArticulo, @pIdBodegaOrigen, @pIdBodegaDestino, @pCantidad, @pTipoMovimiento, GETDATE());

    -- Mensaje de éxito
    SET @msg = 'Movimiento de inventario agregado correctamente.';
    SELECT @msg AS Msg;
END;
GO
/****** Object:  StoredProcedure [dbo].[pa_AgregarUsuario]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[pa_AgregarUsuario]
    @pNombre VARCHAR(100),
    @pContrasena VARCHAR(100),
    @pRol VARCHAR(50)
AS
BEGIN
    DECLARE @msg VARCHAR(100);
    IF EXISTS (SELECT 1 FROM Usuario WHERE Nombre = @pNombre)
    BEGIN
        SET @msg = 'Ya existe un usuario con este nombre.';
        SELECT @msg AS Msg;
        RETURN;
    END;

   

    
    INSERT INTO dbo.Usuario(Nombre, Contrasena, Rol)
    VALUES (@pNombre, @pContrasena, @pRol);

    SET @msg = 'Usuario agregado correctamente.';
    SELECT @msg AS Msg;
    RETURN;
END;
GO
/****** Object:  StoredProcedure [dbo].[pa_EliminarArticulo]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_EliminarArticulo]
    @pIdArticulo INT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @msg VARCHAR(100);

    -- Verificar si el artículo existe por su IdArticulo
    IF NOT EXISTS (SELECT 1 FROM Articulo WHERE IdArticulo = @pIdArticulo)
    BEGIN
        SET @msg = 'El artículo no existe.';
        SELECT @msg AS Msg;
        RETURN;
    END;

    -- Verificar si el artículo está siendo utilizado en la tabla MovimientoInventario
    IF EXISTS (SELECT 1 FROM MovimientoInventario WHERE IdArticulo = @pIdArticulo)
    BEGIN
        SET @msg = 'El artículo se está utilizando en movimientos de inventario y no puede ser eliminado.';
        SELECT @msg AS Msg;
        RETURN;
    END;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Eliminar registros relacionados en la tabla Trazabilidad
        DELETE FROM Trazabilidad WHERE IdArticulo = @pIdArticulo;

        -- Eliminar registros relacionados en la tabla Inventario
        DELETE FROM Inventario WHERE IdArticulo = @pIdArticulo;

        -- Eliminar el artículo
        DELETE FROM Articulo WHERE IdArticulo = @pIdArticulo;

        COMMIT TRANSACTION;

        -- Mensaje de éxito
        SET @msg = 'Artículo eliminado correctamente.';
        SELECT @msg AS Msg;
        RETURN;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END
        -- Manejar el error según sea necesario
        SET @msg = 'Error al eliminar el artículo.';
        SELECT @msg AS Msg;
        RETURN;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[pa_EliminarBodega]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pa_EliminarBodega]
    @pIdBodega INT
AS
BEGIN
    DECLARE @msg VARCHAR(100);

    -- Verificar si la bodega existe
    IF NOT EXISTS (SELECT 1 FROM dbo.Bodega WHERE IdBodega = @pIdBodega)
    BEGIN
        SET @msg = 'La bodega no existe.';
        SELECT @msg AS Msg;
        RETURN;
    END;

    -- Verificar si la bodega está en uso en otras tablas
    IF EXISTS (SELECT 1 FROM dbo.Trazabilidad WHERE IdBodega = @pIdBodega)
    BEGIN
        SET @msg = 'No se puede eliminar la bodega porque está siendo utilizada en la tabla Trazabilidad.';
        SELECT @msg AS Msg;
        RETURN;
    END;

    IF EXISTS (SELECT 1 FROM dbo.Inventario WHERE IdBodega = @pIdBodega)
    BEGIN
        SET @msg = 'No se puede eliminar la bodega porque está siendo utilizada en la tabla Inventario.';
        SELECT @msg AS Msg;
        RETURN;
    END;

    IF EXISTS (SELECT 1 FROM dbo.MovimientoInventario WHERE IdBodegaOrigen = @pIdBodega OR IdBodegaDestino = @pIdBodega)
    BEGIN
        SET @msg = 'No se puede eliminar la bodega porque está siendo utilizada en la tabla MovimientoInventario.';
        SELECT @msg AS Msg;
        RETURN;
    END;

    -- Intentar eliminar el registro de la tabla Bodega
    BEGIN TRY
        DELETE FROM dbo.Bodega WHERE IdBodega = @pIdBodega;

        SET @msg = 'Bodega borrada correctamente.';
    END TRY
    BEGIN CATCH
        -- Manejo de errores
        SET @msg = ERROR_MESSAGE();
    END CATCH

    SELECT @msg AS Msg;
    RETURN;
END
GO
/****** Object:  StoredProcedure [dbo].[pa_EliminarCategoria]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_EliminarCategoria]
    @pIdCategoria INT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @msg VARCHAR(100);

    BEGIN TRY
        -- Verificar si la categoría existe por su IdCategoria
        IF NOT EXISTS (SELECT 1 FROM Categoria WHERE IdCategoria = @pIdCategoria)
        BEGIN
            SET @msg = 'La categoría no existe.';
            SELECT @msg AS Msg;
            RETURN;
        END;

        -- Eliminar todas las entradas relacionadas en Inventario, MovimientoInventario y Trazabilidad
        -- Primero, obtener todos los IdArticulo relacionados con la categoría
        DECLARE @IdArticulo INT;

        DECLARE ArticulosCursor CURSOR FOR
        SELECT IdArticulo
        FROM Articulo
        WHERE IdCategoria = @pIdCategoria;

        OPEN ArticulosCursor;

        FETCH NEXT FROM ArticulosCursor INTO @IdArticulo;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- Eliminar entradas relacionadas en Trazabilidad de forma jerárquica (resolviendo el conflicto)
            ;WITH TrazabilidadCTE AS (
                SELECT IdTrazabilidad
                FROM Trazabilidad
                WHERE IdArticulo = @IdArticulo
                UNION ALL
                SELECT T2.IdTrazabilidad
                FROM Trazabilidad T2
                INNER JOIN TrazabilidadCTE T1 ON T2.IdTrazabilidadP = T1.IdTrazabilidad
            )
            DELETE FROM Trazabilidad WHERE IdTrazabilidad IN (SELECT IdTrazabilidad FROM TrazabilidadCTE);

            -- Eliminar entradas relacionadas en Inventario
            DELETE FROM Inventario WHERE IdArticulo = @IdArticulo;

            -- Eliminar entradas relacionadas en MovimientoInventario
            DELETE FROM MovimientoInventario WHERE IdArticulo = @IdArticulo;

            FETCH NEXT FROM ArticulosCursor INTO @IdArticulo;
        END;

        CLOSE ArticulosCursor;
        DEALLOCATE ArticulosCursor;

        -- Eliminar artículos relacionados con la categoría
        DELETE FROM Articulo WHERE IdCategoria = @pIdCategoria;

        -- Finalmente, eliminar la categoría
        DELETE FROM Categoria WHERE IdCategoria = @pIdCategoria;

        -- Mensaje de éxito
        SET @msg = 'Categoría eliminada correctamente.';
        SELECT @msg AS Msg;
    END TRY
    BEGIN CATCH
        SET @msg = ERROR_MESSAGE();
        SELECT @msg AS Msg;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[pa_EliminarInventario]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_EliminarInventario]
    @pIdInventario INT
AS
BEGIN
    DECLARE @msg VARCHAR(100);

    -- Verificar si el registro de inventario existe por su IdInventario
    IF NOT EXISTS (SELECT 1 FROM Inventario WHERE IdInventario = @pIdInventario)
    BEGIN
        SET @msg = 'El registro de inventario no existe.';
        SELECT @msg AS Msg;
        RETURN;
    END;

    -- Eliminar el registro de inventario
    DELETE FROM Inventario WHERE IdInventario = @pIdInventario;

    -- Mensaje de éxito
    SET @msg = 'Registro de inventario eliminado correctamente.';
    SELECT @msg AS Msg;
    RETURN;
END;
GO
/****** Object:  StoredProcedure [dbo].[pa_EliminarMovimientoInventario]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_EliminarMovimientoInventario]
    @pIdMovimiento INT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @msg VARCHAR(100);
    DECLARE @IdArticulo INT, @IdBodegaOrigen INT, @IdBodegaDestino INT, @CantidadMovida INT;

    -- Verificar si el movimiento de inventario existe por su IdMovimiento
    IF NOT EXISTS (SELECT 1 FROM MovimientoInventario WHERE IdMovimiento = @pIdMovimiento)
    BEGIN
        SET @msg = 'El movimiento de inventario no existe.';
        SELECT @msg AS Msg;
        RETURN;
    END;

    -- Obtener los detalles del movimiento
    SELECT @IdArticulo = IdArticulo, @IdBodegaOrigen = IdBodegaOrigen, @IdBodegaDestino = IdBodegaDestino, @CantidadMovida = Cantidad
    FROM MovimientoInventario
    WHERE IdMovimiento = @pIdMovimiento;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Actualizar las cantidades en la bodega de origen
        UPDATE Inventario
        SET CantidadStock = CantidadStock + @CantidadMovida
        WHERE IdArticulo = @IdArticulo AND IdBodega = @IdBodegaOrigen;

        -- Actualizar las cantidades en la bodega de destino
        UPDATE Inventario
        SET CantidadStock = CantidadStock - @CantidadMovida
        WHERE IdArticulo = @IdArticulo AND IdBodega = @IdBodegaDestino;

        -- Eliminar el movimiento de inventario
        DELETE FROM MovimientoInventario WHERE IdMovimiento = @pIdMovimiento;

        COMMIT TRANSACTION;

        -- Mensaje de éxito
        SET @msg = 'Movimiento de inventario eliminado correctamente.';
        SELECT @msg AS Msg;
        RETURN;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END
        -- Manejar el error según sea necesario
        SET @msg = 'Error al eliminar el movimiento de inventario.';
        SELECT @msg AS Msg;
        RETURN;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[pa_EliminarTrazabilidad]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_EliminarTrazabilidad]
   @IdArticulo INT
AS
BEGIN
    -- Declarar variable para mensaje
    DECLARE @msg VARCHAR(100);

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Eliminar los registros de la tabla Trazabilidad asociados al IdArticulo proporcionado
        DELETE FROM [dbo].[Trazabilidad]
        WHERE IdArticulo = @IdArticulo;

        -- Commit si no hubo errores
        COMMIT TRANSACTION;

        -- Asignar mensaje de éxito
        SET @msg = 'Registros de trazabilidad eliminados correctamente.';
        -- Mostrar el mensaje
        SELECT @msg AS Msg;
        -- Salir del procedimiento
        RETURN;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            -- Rollback si hay errores
            ROLLBACK TRANSACTION;
        END
        -- Manejar el error según sea necesario
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[pa_EliminarUsuario]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_EliminarUsuario]
    @pIdUsuario INT
AS
BEGIN
    DECLARE @msg VARCHAR(100);
    
    -- Verificar si el usuario existe
    IF NOT EXISTS (SELECT 1 FROM Usuario WHERE IdUsuario = @pIdUsuario)
    BEGIN
        SET @msg = 'El Usuario no existe.';
        SELECT @msg AS Msg;
        RETURN;
    END;

    -- Obtener el rol del usuario
    DECLARE @rolUsuario VARCHAR(50);
    SELECT @rolUsuario = Rol FROM Usuario WHERE IdUsuario = @pIdUsuario;

    -- Verificar si el rol es administrador
    IF @rolUsuario = 'Administrador'
    BEGIN
        SET @msg = 'No se puede eliminar un usuario con rol de administrador.';
        SELECT @msg AS Msg;
        RETURN;
    END;

    -- Eliminar el usuario si no es administrador
    DELETE FROM Usuario WHERE IdUsuario = @pIdUsuario;

    SET @msg = 'Usuario borrado correctamente.';
    SELECT @msg AS Msg;
    RETURN;
END







GO
/****** Object:  StoredProcedure [dbo].[pa_GetArticulos]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_GetArticulos]
AS
BEGIN
    -- Seleccionar los artículos con el nombre de la categoría en lugar del ID
    SELECT A.IdArticulo,
           A.Nombre,
           A.Descripcion,
           C.NombreCategoria AS NombreCategoria,
           A.PrecioCosto,
           A.PrecioPromedio,
           A.CantidadActual
    FROM Articulo A
    INNER JOIN Categoria C ON A.IdCategoria = C.IdCategoria;
END;
GO
/****** Object:  StoredProcedure [dbo].[pa_GetAuditoria]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_GetAuditoria]
AS
BEGIN
    SELECT 
        IdAuditoria,
        CONVERT(varchar, FechaHora, 103) AS FechaHora,
        Usuario,
        Rol,
        TablaAfectada,
        Accion,
        IdAfectado
    FROM Auditoria;
END;
GO
/****** Object:  StoredProcedure [dbo].[pa_GetBodegas]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_GetBodegas]
AS
BEGIN
    SELECT *
    FROM Bodega;
END;
GO
/****** Object:  StoredProcedure [dbo].[pa_GetCategorias]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_GetCategorias]
AS
BEGIN
    SELECT 
        IdCategoria,
        NombreCategoria,
        DescripcionCategoria,
        NombreCorto,
        CONVERT(VARCHAR(10), FechaCreacion, 103) AS FechaCreacion, -- Formato DD/MM/YYYY
        CASE 
            WHEN Estado = 'desactivado' THEN 'Categoría Desactivada'
            ELSE Estado
        END AS Estado,
        DetallesAdicionales
    FROM Categoria;
END;
GO
/****** Object:  StoredProcedure [dbo].[pa_GetInventario]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_GetInventario]
AS
BEGIN
   
    SELECT I.IdInventario,
           A.Nombre AS NombreArticulo,
           B.NombreBodega AS NombreBodega,
           I.CantidadStock,
           I.UmbralMinimo
    FROM Inventario I
    INNER JOIN Articulo A ON I.IdArticulo = A.IdArticulo
    INNER JOIN Bodega B ON I.IdBodega = B.IdBodega;
END;
GO
/****** Object:  StoredProcedure [dbo].[pa_GetMovimientoInventario]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_GetMovimientoInventario]
AS
BEGIN
    -- Seleccionar el movimiento de inventario con el nombre del artículo, nombre de la bodega de origen y nombre de la bodega de destino
    SELECT MI.IdMovimiento,
           A.Nombre AS NombreArticulo,
           BO.NombreBodega AS NombreBodegaOrigen,
           BD.NombreBodega AS NombreBodegaDestino,
           MI.Cantidad,
           MI.TipoMovimiento,
           CONVERT(varchar, MI.Fecha, 103) AS Fecha -- Formato dd/mm/yyyy
    FROM MovimientoInventario MI
    INNER JOIN Articulo A ON MI.IdArticulo = A.IdArticulo
    INNER JOIN Bodega BO ON MI.IdBodegaOrigen = BO.IdBodega
    INNER JOIN Bodega BD ON MI.IdBodegaDestino = BD.IdBodega;
END;
GO
/****** Object:  StoredProcedure [dbo].[pa_GetTrazabilidad]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_GetTrazabilidad]
    @IdArticulo INT
AS
BEGIN

    SELECT 
        T.IdTrazabilidad,
        A.Nombre AS NombreArticulo,
        B.NombreBodega AS NombreBodega,
        CONVERT(varchar, T.FechaRegistro, 103) AS FechaRegistro,
        T.Detalles,
        (SELECT Detalles FROM [dbo].[Trazabilidad] WHERE IdTrazabilidad = T.IdTrazabilidadP) AS DetalleTrazabilidadP
    FROM 
        [dbo].[Trazabilidad] T
    INNER JOIN 
        [dbo].[Articulo] A ON T.IdArticulo = A.IdArticulo
    LEFT JOIN 
        [dbo].[Bodega] B ON T.IdBodega = B.IdBodega
    WHERE 
        T.IdArticulo = @IdArticulo;
END;
GO
/****** Object:  StoredProcedure [dbo].[pa_GetUser]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_GetUser]
AS
BEGIN
    SELECT *
    FROM Usuario;
END;
GO
/****** Object:  StoredProcedure [dbo].[pa_Login]    Script Date: 20/06/2024 01:03:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_Login]
    @pNombre varchar(45),
    @pContrasena varchar(30)
AS
BEGIN
	DECLARE @msg VARCHAR(100);
    SET NOCOUNT ON;
    BEGIN TRY
        DECLARE @id INT, @Rol VARCHAR(16)

        SELECT  @id = IdUsuario,
                @Rol = Rol
        FROM [dbo].[Usuario]
        WHERE Nombre= @pNombre AND Contrasena = @pContrasena;

        IF (@Rol = 'Usuario')
            BEGIN
                 SELECT @id IdUsuario, 
                        @Rol Rol
                FROM [dbo].[Usuario]
                WHERE IdUsuario = @id ;
            END;

        ELSE IF (@Rol = 'Administrador')
            BEGIN
                 SELECT @id IdUsuario, 
                        @Rol Rol
                FROM [dbo].[Usuario]
                WHERE IdUsuario = @id ;
            END;

        ELSE 
            BEGIN
                SET @msg = 'Datos incorrectos.';
				SELECT @msg AS Msg;
				RETURN;
            END;
    END TRY
    BEGIN CATCH
        SET @msg = 'Error al iniciar sesion.';
        SELECT @msg AS Msg;
        RETURN;
    END CATCH
    SET NOCOUNT OFF
END;
GO
