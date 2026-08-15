USE TURISMOPERU_JECT;
GO

-- FUNCIÓN DE TABLA DE MÚLTIPLES SENTENCIAS:
-- Cuenta las reservas y clasifica al cliente.

CREATE OR ALTER FUNCTION JECT.fn_MT_ClasificarReservasCliente
(
    @IdCliente INT
)
RETURNS @Resultado TABLE
(
    IdCliente INT,
    Cliente VARCHAR(200),
    CantidadReservas INT,
    Clasificacion VARCHAR(30)
)
AS
BEGIN
    DECLARE @CantidadReservas INT;
    DECLARE @Clasificacion VARCHAR(30);

    -- Primera sentencia: contar las reservas.
    SELECT
        @CantidadReservas = COUNT(*)
    FROM JECT.reserva
    WHERE id_cliente = @IdCliente;

    -- Segunda parte: determinar la clasificación.
    IF @CantidadReservas > 15
    BEGIN
        SET @Clasificacion = 'Cliente VIP';
    END
    ELSE IF @CantidadReservas > 5
    BEGIN
        SET @Clasificacion = 'Cliente Frecuente';
    END
    ELSE
    BEGIN
        SET @Clasificacion = 'Cliente Nuevo';
    END;

    -- Tercera sentencia: insertar el resultado.
    INSERT INTO @Resultado
    (
        IdCliente,
        Cliente,
        CantidadReservas,
        Clasificacion
    )
    VALUES
    (
        @IdCliente,
        JECT.fn_NombreCompletoPersona(@IdCliente),
        @CantidadReservas,
        @Clasificacion
    );

    RETURN;
END;
GO

--ejecutar
SELECT
    *,
    GETDATE() AS FechaConsulta,
    JECT.fn_NombreCompletoPersona(108) AS Estudiante
FROM JECT.fn_MT_ClasificarReservasCliente(2);