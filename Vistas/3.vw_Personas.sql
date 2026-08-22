use TURISMOPERU_JECT
GO



CREATE OR ALTER VIEW JECT.vw_Personas
AS
    SELECT
       p.apaterno,
       p.amaterno,
       p.nombres,
       case 
       when p.tipo_persona= 'N' then 'Natural'
       when p.tipo_persona ='N' then 'Natural'
       end as [Tipo Persona],
       estado,
       getdate() Fecha_Consulta,
       ject.fn_NombreCompletoPersona(108)  Estudiante
    FROM JECT.persona p;
GO


select*from ject.vw_Personas;
