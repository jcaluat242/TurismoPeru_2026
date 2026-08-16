USE TURISMOPERU_JECT;
GO

-- EJERCICIO 10:
-- Utilizar la función del ejercicio 9 en un JOIN.
USE TURISMOPERU_JECT;
GO

SELECT
    C.id_persona AS IdCliente,
    JECT.fn_NombreCompletoPersona(P.id_persona) AS Cliente,
    P.numero_documento,
    P.email,

    F.IdReserva,
    F.CodigoReserva,
    F.FechaInicio,
    F.FechaFin,
    F.EstadoReserva,
    F.TotalPagado,

    GETDATE() AS FechaConsulta,
    JECT.fn_NombreCompletoPersona(108) AS Estudiante

FROM JECT.cliente AS C
INNER JOIN JECT.persona AS P
    ON C.id_persona = P.id_persona

CROSS APPLY JECT.fn_MT_ReservasClienteEstado
(
    C.id_persona,
    NULL
) AS F

ORDER BY C.id_persona, F.FechaReserva;