USE TURISMOPERU_JECT;
GO

-- FUNCIÓN DE TABLA:
-- Devuelve los lugares turísticos pertenecientes a una región.

CREATE OR ALTER FUNCTION JECT.fn_LugaresTuristicosRegion
(
    @IdRegion INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        LT.id_lugarturistico AS IdLugarTuristico,
        LT.nombre AS LugarTuristico,
        CAST(LT.descripcion AS VARCHAR(MAX)) AS Descripcion,
        LT.precio_entrada AS PrecioEntrada,
        LT.horario_apertura AS HorarioApertura,
        LT.horario_cierre AS HorarioCierre,
        LT.calificacion AS Calificacion,
        LT.estado AS EstadoLugar,

        DLT.tipo_direccion AS TipoDireccion,
        DLT.es_principal AS EsPrincipal,

        D.calle AS Calle,
        D.numero AS Numero,
        D.codigo_postal AS CodigoPostal,
        D.latitud AS Latitud,
        D.longitud AS Longitud,

        C.nombreciudad AS Ciudad,
        S.nombresubregion AS Subregion,
        R.id_region AS IdRegion,
        R.nombreregion AS Region

    FROM JECT.lugar_turistico AS LT

    INNER JOIN JECT.direccion_lugarturistico AS DLT
        ON DLT.id_lugarturistico = LT.id_lugarturistico

    INNER JOIN JECT.direccion AS D
        ON D.id_direccion = DLT.id_direccion

    INNER JOIN JECT.ciudad AS C
        ON C.id_ciudad = D.id_ciudad

    INNER JOIN JECT.subregion AS S
        ON S.id_subregion = C.id_subregion

    INNER JOIN JECT.region AS R
        ON R.id_region = S.id_region

    WHERE R.id_region = @IdRegion
);
GO

SELECT
    id_region,
    nombreregion
FROM JECT.region
ORDER BY nombreregion;
--ejeccutar
SELECT
    *,
    GETDATE() AS FechaConsulta,
    JECT.fn_NombreCompletoPersona(108) AS Estudiante
FROM JECT.fn_LugaresTuristicosRegion(6);