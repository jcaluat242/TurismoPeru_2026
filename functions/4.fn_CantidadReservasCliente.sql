USE TURISMOPERU_JECT;
-- FUNCIÓN ESCALAR:
-- Devuelve la cantidad de reservas de un cliente.

CREATE OR ALTER FUNCTION JECT.fn_CantidadReservasCliente
(
    @IdCliente INT
)
RETURNS INT
AS
BEGIN
    DECLARE @CantidadReservas INT;

    SELECT
        @CantidadReservas = COUNT(*)
    FROM JECT.reserva
    WHERE id_cliente = @IdCliente;

    RETURN @CantidadReservas;
END;
GO

SELECT
    108 AS IdCliente,
    JECT.fn_CantidadReservasCliente(2) AS CantidadReservas,
    GETDATE() AS FechaConsulta;