use TURISMOPERU_JECT
GO

CREATE OR ALTER VIEW ject.vw_pagosmayores500
AS
    SELECT
        id_pago,
        id_reserva
       monto,
       MP.nombre as [Medio de Pago],
       getdate () as Fecha_Consulta,
       ject.fn_NombreCompletoPersona(108) as Estudiante
    FROM JECT.pago P
    inner join ject.medio_pago MP on 
    P.id_medio_pago = MP.id_medio_pago
    where monto >500;
GO

select* from ject.vw_pagosmayores500