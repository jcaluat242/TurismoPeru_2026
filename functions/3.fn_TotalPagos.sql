use TURISMOPERU_JECT


-- Total Pago por una reserva
CREATE OR ALTER FUNCTION JECT.fn_PagoTotalXReserva
(
    @IdReserva int
)
RETURNS MONEY
AS
BEGIN
    Declare @Total money
    Select
        @Total = sum(monto)
    from JECT.pago
    where id_reserva = @IdReserva;

    RETURN isnull (@Total,0);
END;

--EJECUTAR:
select JECT.fn_PagoTotalXReserva (2)
AS MontoPagado
, getdate() as Fecha_Consulta;