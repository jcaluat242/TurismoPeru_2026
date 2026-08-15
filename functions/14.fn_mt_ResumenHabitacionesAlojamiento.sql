USE TURISMOPERU_JECT;
GO

CREATE OR ALTER FUNCTION JECT.fn_MT_ResumenHabitacionesAlojamiento
(
    @IdAlojamiento INT
)
RETURNS @Resultado TABLE
(
    IdAlojamiento INT,
    Alojamiento VARCHAR(100),
    CategoriaEstrellas TINYINT,
    TotalHabitaciones INT,
    Disponibles INT,
    Ocupadas INT,
    EnMantenimiento INT,
    FueraServicio INT,
    PrecioMinimo DECIMAL(10,2),
    PrecioMaximo DECIMAL(10,2),
    PrecioPromedio DECIMAL(10,2)
)
AS
BEGIN
    DECLARE @TotalHabitaciones INT;
    DECLARE @Disponibles INT;
    DECLARE @Ocupadas INT;
    DECLARE @EnMantenimiento INT;
    DECLARE @FueraServicio INT;
    DECLARE @PrecioMinimo DECIMAL(10,2);
    DECLARE @PrecioMaximo DECIMAL(10,2);
    DECLARE @PrecioPromedio DECIMAL(10,2);

    -- Primera sentencia: calcular cantidades y precios.
    SELECT
        @TotalHabitaciones = COUNT(*),

        @Disponibles = ISNULL(SUM(
            CASE WHEN H.estado = 'Disponible' THEN 1 ELSE 0 END
        ), 0),

        @Ocupadas = ISNULL(SUM(
            CASE WHEN H.estado = 'Ocupado' THEN 1 ELSE 0 END
        ), 0),

        @EnMantenimiento = ISNULL(SUM(
            CASE WHEN H.estado = 'Mantenimiento' THEN 1 ELSE 0 END
        ), 0),

        @FueraServicio = ISNULL(SUM(
            CASE WHEN H.estado = 'Fuera_servicio' THEN 1 ELSE 0 END
        ), 0),

        @PrecioMinimo = ISNULL(MIN(H.precio_noche), 0),
        @PrecioMaximo = ISNULL(MAX(H.precio_noche), 0),

        @PrecioPromedio = ISNULL(
            AVG(CAST(H.precio_noche AS DECIMAL(18,2))),
            0
        )

    FROM JECT.habitacion AS H
    WHERE H.id_alojamiento = @IdAlojamiento;

    -- Segunda sentencia: insertar el resumen.
    INSERT INTO @Resultado
    (
        IdAlojamiento,
        Alojamiento,
        CategoriaEstrellas,
        TotalHabitaciones,
        Disponibles,
        Ocupadas,
        EnMantenimiento,
        FueraServicio,
        PrecioMinimo,
        PrecioMaximo,
        PrecioPromedio
    )
    SELECT
        A.id_alojamiento,
        A.Nombre,
        A.Categoria_Estrellas,
        @TotalHabitaciones,
        @Disponibles,
        @Ocupadas,
        @EnMantenimiento,
        @FueraServicio,
        @PrecioMinimo,
        @PrecioMaximo,
        @PrecioPromedio
    FROM JECT.alojamiento AS A
    WHERE A.id_alojamiento = @IdAlojamiento;

    RETURN;
END;
GO

--ejecutar

SELECT
    *,
    GETDATE() AS FechaConsulta,
    JECT.fn_NombreCompletoPersona(108) AS Estudiante
FROM JECT.fn_MT_ResumenHabitacionesAlojamiento(1);