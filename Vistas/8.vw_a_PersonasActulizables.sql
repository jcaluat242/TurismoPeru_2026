USE TURISMOPERU_JECT;
GO

CREATE OR ALTER VIEW JECT.vw_PersonasActualizables
AS
    SELECT
        id_persona,
        nombres,
        apaterno,
        amaterno,
        telefono,
        email,
        estado
    FROM JECT.persona;
GO
---
SELECT *
FROM JECT.vw_PersonasActualizables
WHERE id_persona = 108;

---
BEGIN TRANSACTION;

-- Actualización temporal mediante la vista.
UPDATE JECT.vw_PersonasActualizables
SET telefono = '999999999'
WHERE id_persona = 108;

-- Debe mostrar 999999999.
SELECT
    'Durante la prueba' AS Momento,
    *
FROM JECT.vw_PersonasActualizables
WHERE id_persona = 108;

-- Deshacer la actualización.
ROLLBACK TRANSACTION;

-- Debe volver a mostrar tu número original.
SELECT
    'Despues del rollback' AS Momento,
    *
FROM JECT.vw_PersonasActualizables
WHERE id_persona = 108;