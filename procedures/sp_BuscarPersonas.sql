USE TURISMOPERU_JECT;
GO

CREATE OR ALTER PROCEDURE JECT.sp_BuscarPersonas
    @texto VARCHAR(100) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SET @texto = NULLIF(LTRIM(RTRIM(@texto)), '');

    SELECT
        id_persona,
        tipo_persona,
        nombres,
        apaterno,
        amaterno,
        numero_documento,
        estado
    FROM JECT.persona
    WHERE
        @texto IS NULL
        OR nombres LIKE '%' + @texto + '%'
        OR apaterno LIKE '%' + @texto + '%'
        OR amaterno LIKE '%' + @texto + '%'
        OR numero_documento LIKE '%' + @texto + '%'
    ORDER BY id_persona DESC;
END
GO