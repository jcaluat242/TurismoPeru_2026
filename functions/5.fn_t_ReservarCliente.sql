use  TURISMOPERU_JECT


CREATE OR ALTER FUNCTION JECT.fn_ReservaCliente
(
	@IdCliente int
)
RETURNS TABLE
RETURN
(
	SELECT
		id_reserva,
		fecha_reserva,
		ER.nombre as [Estado Reserva]
	FROM JECT.reserva R inner join
	JECT.estado_reserva ER on
	ER.id_estado_reserva = R.id_estado_reserva
	WHERE R.id_Cliente=@IdCliente
);
GO
--Ejecutar
SELECT * , getdate() as Fecha_Consulta, JECT.fn_NombreCompletoPersona(108)as Estudiane 
FROM JECT.fn_ReservaCliente(2);
