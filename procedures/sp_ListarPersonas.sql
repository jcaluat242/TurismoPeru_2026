USE TURISMOPERU_JECT;
GO
CREATE OR ALTER PROCEDURE JECT.sp_ListarPersonas
AS
BEGIN
    Select id_persona, tipo_persona,nombres, apaterno,amaterno, estado
    From JECT.persona
END
GO