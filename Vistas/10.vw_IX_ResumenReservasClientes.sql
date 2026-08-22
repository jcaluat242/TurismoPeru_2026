USE TURISMOPERU_JECT;
GO

-- Opciones obligatorias para vistas indexadas.
SET NUMERIC_ROUNDABORT OFF;
SET ANSI_NULLS ON;
SET ANSI_PADDING ON;
SET ANSI_WARNINGS ON;
SET ARITHABORT ON;
SET CONCAT_NULL_YIELDS_NULL ON;
SET QUOTED_IDENTIFIER ON;
GO

CREATE OR ALTER VIEW JECT.vw_IX_ResumenReservasCliente
WITH SCHEMABINDING
AS
    SELECT
        R.id_cliente AS IdCliente,
        COUNT_BIG(*) AS TotalReservas,
        SUM(R.precio_total) AS ImporteTotalReservas

    FROM JECT.reserva AS R

    GROUP BY R.id_cliente;
GO

-- Materializa el resultado de la vista.
CREATE UNIQUE CLUSTERED INDEX IX_vw_ResumenReservasCliente
ON JECT.vw_IX_ResumenReservasCliente(IdCliente);
GO

---
SELECT
    V.*,
    GETDATE() AS FechaConsulta,
    JECT.fn_NombreCompletoPersona(108) AS Estudiante

FROM JECT.vw_IX_ResumenReservasCliente AS V
WITH (NOEXPAND)

ORDER BY V.TotalReservas DESC;

--
SELECT
    I.name AS NombreIndice,
    I.type_desc AS TipoIndice,
    I.is_unique AS EsUnico

FROM sys.indexes AS I

WHERE I.object_id =
      OBJECT_ID('JECT.vw_IX_ResumenReservasCliente')
  AND I.index_id > 0;