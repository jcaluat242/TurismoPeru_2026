--modificar vista
ALTER VIEW esquema.nombre_vista
AS
    SELECT
        columnas
    FROM tabla
    WHERE condicion;
GO
--eliminar vista
DROP VIEW esquema.nombre_vista;
GO
