use TURISMOPERU_JECT

create or alter function JECT.fn_NombreCompletoPersona
(
@IdPersona int 
)
RETURNS Varchar (200)
as
begin
DECLARE  @nombrecompleto varchar (200);
Select 
@nombrecompleto=
nombres+ ' '+
 apaterno + ' ' +
 amaterno 
from JECT.persona
where id_persona =@IdPersona;

---
return @nombrecompleto
end
go
--ejecutar funcion 

select JECT.fn_NombreCompletoPersona (108)
as persona , getdate() as FechaConsulta;