use TURISMOPERU_JECT

create or alter function JECT.fn_CalcularIGVPago
(
@monto money
)
RETURNS Varchar (200)
as
begin
return @monto*0.18;
end
go
--ejecutar funcion 

select JECT.fn_CalcularIGVPago (459)
as IGV , getdate() as Fecha_Consulta;

----
SELECT
    monto,
    JECT.fn_CalcularIGVPago(monto) as IGV, 
    getdate() as Fecha_Consulta
FROM ject.pago
WHERE monto >= 0;