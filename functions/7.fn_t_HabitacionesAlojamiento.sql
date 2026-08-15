
use TURISMOPERU_JECT

--habitaciones de alojamiento 
CREATE OR ALTER FUNCTION JECT.fn_HabitacionesAlojamiento
(
@IdAlojamiento int
)
returns table 
return
(
Select 
		H.id_alojamiento,
		H.numero_habitacion,
		TH.nombrehabitacion,
		H.precio_noche,
		H.estado,
		H.descripcion

from ject.habitacion H inner join
JECT.tipo_habitacion TH on
H.id_tipo_habitacion = TH.id_tipo_habitacion
where id_alojamiento = 1 --@Id Alojamiento
);
go

SELECT *,
GETDATE() AS Fecha_Consulta,
JECT.fn_NombreCompletoPersona(108) as Estudiante
from ject.fn_HabitacionesAlojamiento(5);