USE TURISMOPERU_JECT;
GO

CREATE OR ALTER VIEW JECT.vw_ReservasParticionadas2026
AS

    SELECT
        id_reserva,
        codigo_reserva,
        id_cliente,
        fecha_inicio,
        fecha_fin,
        numero_personas,
        precio_total,
        id_estado_reserva
    FROM JECT.reserva_2026_ene_abr

    UNION ALL

    SELECT
        id_reserva,
        codigo_reserva,
        id_cliente,
        fecha_inicio,
        fecha_fin,
        numero_personas,
        precio_total,
        id_estado_reserva
    FROM JECT.reserva_2026_may_ago

    UNION ALL

    SELECT
        id_reserva,
        codigo_reserva,
        id_cliente,
        fecha_inicio,
        fecha_fin,
        numero_personas,
        precio_total,
        id_estado_reserva
    FROM JECT.reserva_2026_sep_dic;
GO

----
SELECT
    *,
    GETDATE() AS FechaConsulta,
    JECT.fn_NombreCompletoPersona(108) AS Estudiante
FROM JECT.vw_ReservasParticionadas2026
ORDER BY fecha_inicio;