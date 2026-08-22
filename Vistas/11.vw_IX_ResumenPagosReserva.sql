USE TURISMOPERU_JECT;
GO

SET NUMERIC_ROUNDABORT OFF;
SET ANSI_NULLS ON;
SET ANSI_PADDING ON;
SET ANSI_WARNINGS ON;
SET ARITHABORT ON;
SET CONCAT_NULL_YIELDS_NULL ON;
SET QUOTED_IDENTIFIER ON;
GO

CREATE OR ALTER VIEW JECT.vw_IX_ResumenPagosReserva
WITH SCHEMABINDING
AS
    SELECT
        P.id_reserva AS IdReserva,
        COUNT_BIG(*) AS CantidadPagos,
        SUM(P.monto) AS TotalPagado

    FROM JECT.pago AS P

    GROUP BY P.id_reserva;
GO

CREATE UNIQUE CLUSTERED INDEX IX_vw_ResumenPagosReserva
ON JECT.vw_IX_ResumenPagosReserva(IdReserva);
GO
----
SELECT
    V.*,
    GETDATE() AS FechaConsulta,
    JECT.fn_NombreCompletoPersona(108) AS Estudiante

FROM JECT.vw_IX_ResumenPagosReserva AS V
WITH (NOEXPAND)

ORDER BY V.TotalPagado DESC;
--
