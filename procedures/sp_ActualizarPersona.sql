
USE TURISMOPERU_JECT;
GO
CREATE OR ALTER PROCEDURE JECT.sp_ActualizarPersona
    @id_persona INT,
    @tipo_persona VARCHAR(1),
    @nombres VARCHAR(100),
    @apaterno VARCHAR(100),
    @amaterno VARCHAR(100),
    @razon_social VARCHAR(150),
    @nombre_comercial VARCHAR(150),
    @id_tipo_documento INT,
    @numero_documento VARCHAR(20),
    @telefono VARCHAR(15),
    @email VARCHAR(100),
    @id_nacionalidad INT,
    @estado VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        UPDATE JECT.persona
        SET
            tipo_persona = @tipo_persona,
            nombres = @nombres,
            apaterno = @apaterno,
            amaterno = @amaterno,
            razon_social = @razon_social,
            nombre_comercial = @nombre_comercial,
            id_tipo_documento = @id_tipo_documento,
            numero_documento = @numero_documento,
            telefono = @telefono,
            email = @email,
            id_nacionalidad = @id_nacionalidad,
            estado = @estado
        WHERE id_persona = @id_persona;

        IF @@ROWCOUNT = 0
            THROW 50001, 'No se encontró la persona indicada.', 1;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO