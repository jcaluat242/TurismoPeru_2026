USE TURISMOPERU_JECT;
GO

CREATE OR ALTER PROCEDURE JECT.sp_ObtenerPersonaPorId
    @id_persona INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        id_persona,
        tipo_persona,
        nombres,
        apaterno,
        amaterno,
        razon_social,
        nombre_comercial,
        id_tipo_documento,
        numero_documento,
        telefono,
        email,
        id_nacionalidad,
        estado
    FROM JECT.persona
    WHERE id_persona = @id_persona;
END
GO
