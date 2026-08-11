
USE TURISMOPERU_JECT;
GO
CREATE OR ALTER PROCEDURE JECT.sp_EliminarPersona
    @id_persona INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        UPDATE JECT.persona
        SET estado = 'Inactivo'
        WHERE id_persona = @id_persona;

        IF @@ROWCOUNT = 0
            THROW 50002, 'No se encontró la persona indicada.', 1;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO