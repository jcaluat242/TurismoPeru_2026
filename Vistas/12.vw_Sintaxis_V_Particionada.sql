CREATE OR ALTER VIEW esquema.nombre_vista
AS

SELECT
    columna1,
    columna2,
    columna3
FROM esquema.tabla_particion_1

UNION ALL

SELECT
    columna1,
    columna2,
    columna3
FROM esquema.tabla_particion_2

UNION ALL

SELECT
    columna1,
    columna2,
    columna3
FROM esquema.tabla_particion_3;
GO