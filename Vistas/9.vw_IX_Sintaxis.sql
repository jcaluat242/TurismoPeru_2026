USE nombre_base_datos;
GO

-- Opciones requeridas.
SET NUMERIC_ROUNDABORT OFF;
SET ANSI_NULLS ON;
SET ANSI_PADDING ON;
SET ANSI_WARNINGS ON;
SET ARITHABORT ON;
SET CONCAT_NULL_YIELDS_NULL ON;
SET QUOTED_IDENTIFIER ON;
GO

-- Crear la vista con enlace al esquema.
CREATE VIEW esquema.nombre_vista
WITH SCHEMABINDING
AS
    SELECT
        columna_clave,
        COUNT_BIG(*) AS Cantidad,
        SUM(columna_numerica) AS Total

    FROM esquema.tabla

    GROUP BY columna_clave;
GO

-- Crear el primer índice de la vista.
CREATE UNIQUE CLUSTERED INDEX nombre_indice
ON esquema.nombre_vista(columna_clave);
GO