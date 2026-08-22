use TURISMOPERU_JECT


CREATE OR ALTER VIEW JECT.vw_alojamientos
as
select 

nombre,
TA.Nombre_Tipo,
TA.Descripcion,
getdate() as Fecha_consulta,
ject.fn_NombreCompletoPersona(108) as Estudiante
from ject.alojamiento A
inner join ject.tipo_alojamiento TA on 
A.id_tipoalojamiento = TA.id_tipoalojamiento


select*
from ject.vw_alojamientos;