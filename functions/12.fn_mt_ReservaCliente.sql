use TURISMOPERU_JECT


--Reserva cliente

CREATE OR ALTER FUNCTION JECT.fn_MT_ReservasCliente
(

    @IdCliente int
)
RETURNS @Resultado TABLE (
    IdReserva int,
    FechaReserva date,
    EstadoReserva varchar(100),
    TotalPagado money
)
AS
BEGIN
    INSERT INTO @Resultado (
        IdReserva,
        FechaReserva,
        EstadoReserva, 
        TotalPagado 
    )
    SELECT 
        R.id_reserva,
        R.fecha_reserva,
        ER.nombre, -- estado reserva
        ISNULL(SUM(P.monto), 0) 
    FROM JECT.reserva R 
    INNER JOIN JECT.estado_reserva ER 
        ON ER.id_estado_reserva = R.id_estado_reserva
    LEFT JOIN JECT.pago P 
        ON R.id_reserva = P.id_reserva
    WHERE R.id_cliente = @IdCliente
    GROUP BY 
        R.id_reserva,
        R.fecha_reserva,
        ER.nombre;

    RETURN;
    end ;
GO

select *,
getdate()  as Fecha_Consulta,
ject.fn_NombreCompletoPersona (108) as Estudiante
From ject.fn_MT_ReservasCliente(10);