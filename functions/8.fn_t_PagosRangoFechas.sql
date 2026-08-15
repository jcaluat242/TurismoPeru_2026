USE TURISMOPERU_JECT;
GO

-- FUNCIÓN DE TABLA:
-- Devuelve los pagos realizados dentro de un rango de fechas.

CREATE OR ALTER FUNCTION JECT.fn_PagosRangoFechas
(
    @FechaInicio DATE,
    @FechaFin DATE
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        P.id_pago,
        P.id_reserva,
        P.id_medio_pago,
        P.monto,
        P.fecha_pago,
        P.numero_operacion,
        P.comprobante,
        P.estado
    FROM JECT.pago AS P
    WHERE P.fecha_pago >= @FechaInicio
      AND P.fecha_pago < DATEADD(DAY, 1, @FechaFin)
);
GO

SELECT
    *,
    GETDATE() AS FechaConsulta,
    JECT.fn_NombreCompletoPersona(108) AS Estudiante
FROM JECT.fn_PagosRangoFechas
(
    '2026-01-01',
    '2026-12-31'
);