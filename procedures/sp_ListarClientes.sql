USE TURISMOPERU_JECT;
GO
CREATE OR ALTER PROCEDURE JECT.sp_ListarClientes
AS
BEGIN
    Select p.id_persona, p.tipo_persona,nombres, apaterno,amaterno, estado
    From JECT.persona p
    inner join JECT.cliente c
    on p.id_persona = c.id_persona
END
GO