CREATE OR ALTER VIEW esquema.nombre_vista
AS
    SELECT
        T1.columna1,
        T2.columna2,
        T3.columna3,

        CASE
            WHEN condicion THEN resultado1
            ELSE resultado2
        END AS columna_calculada

    FROM tabla1 AS T1

    INNER JOIN tabla2 AS T2
        ON T1.clave = T2.clave

    INNER JOIN tabla3 AS T3
        ON T1.clave = T3.clave

    WHERE condicion;
GO