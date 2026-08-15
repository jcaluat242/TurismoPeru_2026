use TURISMOPERU_JECT
-- FUNCIÓN ESCALAR:
-- Clasifica al cliente según su cantidad de reservas.

CREATE OR ALTER FUNCTION JECT.fn_ClasificacionCliente
(
    @IdCliente INT
)
RETURNS VARCHAR(30)
AS
BEGIN
    DECLARE @CantidadReservas INT;
    DECLARE @Clasificacion VARCHAR(30);

    -- Reutilizamos la función desarrollada anteriormente.
    SET @CantidadReservas =
        JECT.fn_CantidadReservasCliente(@IdCliente);

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

    RETURN @Clasificacion;
END;
GO

SELECT
    108 AS IdCliente,
    JECT.fn_CantidadReservasCliente(2) AS CantidadReservas,
    JECT.fn_ClasificacionCliente(2) AS Clasificacion,
    GETDATE() AS FechaConsulta;


    