USE TURISMOPERU_JECT;
GO

-- EJERCICIO 10:
-- Utilizar la función del ejercicio 9 en un JOIN.

SELECT
    P.id_persona AS IdCliente,
    JECT.fn_NombreCompletoPersona(P.id_persona) AS Cliente,
    P.numero_documento AS NumeroDocumento,
    P.email AS Email,

    F.IdReserva,
    F.CodigoReserva,
    F.FechaReserva,
    F.FechaInicio,
    F.FechaFin,
    F.EstadoReserva,
    F.TotalPagado,

    GETDATE() AS FechaConsulta,
    JECT.fn_NombreCompletoPersona(108) AS Estudiante

FROM JECT.persona AS P

INNER JOIN JECT.fn_MT_ReservasClienteEstado(2, NULL) AS F
    ON F.IdCliente = P.id_persona

WHERE P.id_persona = 2

ORDER BY F.FechaReserva;