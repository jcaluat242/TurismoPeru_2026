USE TURISMOPERU_JECT;
GO

CREATE OR ALTER FUNCTION JECT.fn_MT_ReporteClientesFrecuentes
()
RETURNS @Resultado TABLE
(
    IdCliente INT,
    Cliente VARCHAR(200),
    Email VARCHAR(100),
    CantidadReservas INT,
    TotalPagado DECIMAL(18,2),
    Clasificacion VARCHAR(30)
)
AS
BEGIN

    INSERT INTO @Resultado
    (
        IdCliente,
        Cliente,
        Email,
        CantidadReservas,
        TotalPagado,
        Clasificacion
    )
    SELECT
        R.id_cliente,
        JECT.fn_NombreCompletoPersona(R.id_cliente),
        P.email,
        COUNT(*) AS CantidadReservas,
        0 AS TotalPagado,
        '' AS Clasificacion
    FROM JECT.reserva AS R

    INNER JOIN JECT.cliente AS C
        ON C.id_persona = R.id_cliente

    INNER JOIN JECT.persona AS P
        ON P.id_persona = C.id_persona

    GROUP BY
        R.id_cliente,
        P.email;

    UPDATE RT
    SET RT.TotalPagado = ISNULL
    (
        (
            SELECT SUM(PG.monto)
            FROM JECT.reserva AS R2

            INNER JOIN JECT.pago AS PG
                ON PG.id_reserva = R2.id_reserva

            WHERE R2.id_cliente = RT.IdCliente
        ),
        0
    )
    FROM @Resultado AS RT;

    UPDATE @Resultado
    SET Clasificacion =
        CASE
            WHEN CantidadReservas > 3
                THEN 'Cliente VIP'
            WHEN CantidadReservas > 2
                THEN 'Cliente Frecuente'
            ELSE 'Cliente Nuevo'
        END;

    RETURN;
END;
GO

---
SELECT
    *,
    GETDATE() AS FechaConsulta,
    JECT.fn_NombreCompletoPersona(108) AS Estudiante
FROM JECT.fn_MT_ReporteClientesFrecuentes()
ORDER BY CantidadReservas DESC, TotalPagado DESC;


---
SELECT
    *,
    GETDATE() AS FechaConsulta,
    JECT.fn_NombreCompletoPersona(108) AS Estudiante
FROM JECT.fn_MT_ReporteClientesFrecuentes()
WHERE Clasificacion IN
(
    'Cliente Frecuente',
    'Cliente VIP'
)
ORDER BY CantidadReservas DESC, TotalPagado DESC;