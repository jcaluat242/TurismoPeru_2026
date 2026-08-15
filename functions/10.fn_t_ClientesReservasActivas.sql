USE TURISMOPERU_JECT;
GO

-- FUNCIÓN DE TABLA:
-- Devuelve los clientes que poseen reservas todavía activas.

CREATE OR ALTER FUNCTION JECT.fn_ClientesReservasActivas
()
RETURNS TABLE
AS
RETURN
(
    SELECT
        R.id_cliente AS IdCliente,
        JECT.fn_NombreCompletoPersona(R.id_cliente) AS Cliente,
        P.numero_documento AS NumeroDocumento,
        P.telefono AS Telefono,
        P.email AS Email,

        R.id_reserva AS IdReserva,
        R.codigo_reserva AS CodigoReserva,
        R.fecha_reserva AS FechaReserva,
        R.fecha_inicio AS FechaInicio,
        R.fecha_fin AS FechaFin,
        R.numero_personas AS NumeroPersonas,
        R.precio_total AS PrecioTotal,
        R.saldo_pendiente AS SaldoPendiente,

        ER.nombre AS EstadoReserva

    FROM JECT.reserva AS R

    INNER JOIN JECT.cliente AS C
        ON C.id_persona = R.id_cliente

    INNER JOIN JECT.persona AS P
        ON P.id_persona = C.id_persona

    INNER JOIN JECT.estado_reserva AS ER
        ON ER.id_estado_reserva = R.id_estado_reserva

    WHERE ER.nombre NOT IN
    (
        'Completada',
        'Cancelada',
        'Anulada',
        'Reembolsada',
        'Vencida',
        'No Show',
        'Finalizada'
    )
);
GO

--ejecutar
SELECT
    *,
    GETDATE() AS FechaConsulta,
    JECT.fn_NombreCompletoPersona(108) AS Estudiante
FROM JECT.fn_ClientesReservasActivas()
ORDER BY IdCliente, FechaInicio;