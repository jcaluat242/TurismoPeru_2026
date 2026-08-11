from database.conexion import conectar


def insertar_persona(persona):
    conexion = conectar()
    cursor = None

    sql = "{CALL JECT.sp_insertarPersona (?,?,?,?,?,?,?,?,?,?,?,?)}"

    parametros = (
        persona.tipo_persona,
        persona.nombres,
        persona.apaterno,
        persona.amaterno,
        persona.razon_social,
        persona.nombre_comercial,
        persona.id_tipo_documento,
        persona.numero_documento,
        persona.telefono,
        persona.email,
        persona.id_nacionalidad,
        persona.estado
    )

    try:
        cursor = conexion.cursor()
        cursor.execute(sql, parametros)
        conexion.commit()
        return True

    except Exception as error:
        conexion.rollback()
        print("Error al insertar persona:", error)
        raise

    finally:
        if cursor is not None:
            cursor.close()

        conexion.close()


def obtener_persona_por_id(id_persona):
    conexion = conectar()
    cursor = None

    try:
        cursor = conexion.cursor()

        cursor.execute(
            "EXEC JECT.sp_ObtenerPersonaPorId ?",
            id_persona
        )

        persona = cursor.fetchone()
        return persona

    finally:
        if cursor is not None:
            cursor.close()

        conexion.close()


def actualizar_persona(id_persona, persona):
    conexion = conectar()
    cursor = None

    sql = """
        EXEC JECT.sp_ActualizarPersona
            @id_persona=?,
            @tipo_persona=?,
            @nombres=?,
            @apaterno=?,
            @amaterno=?,
            @razon_social=?,
            @nombre_comercial=?,
            @id_tipo_documento=?,
            @numero_documento=?,
            @telefono=?,
            @email=?,
            @id_nacionalidad=?,
            @estado=?
    """

    parametros = (
        id_persona,
        persona.tipo_persona,
        persona.nombres,
        persona.apaterno,
        persona.amaterno,
        persona.razon_social,
        persona.nombre_comercial,
        persona.id_tipo_documento,
        persona.numero_documento,
        persona.telefono,
        persona.email,
        persona.id_nacionalidad,
        persona.estado
    )

    try:
        cursor = conexion.cursor()
        cursor.execute(sql, parametros)
        conexion.commit()
        return True

    except Exception as error:
        conexion.rollback()
        print("Error al actualizar persona:", error)
        raise

    finally:
        if cursor is not None:
            cursor.close()

        conexion.close()


def eliminar_persona(id_persona):
    conexion = conectar()
    cursor = None

    try:
        cursor = conexion.cursor()

        cursor.execute(
            "EXEC JECT.sp_EliminarPersona ?",
            id_persona
        )

        conexion.commit()
        return True

    except Exception as error:
        conexion.rollback()
        print("Error al eliminar persona:", error)
        raise

    finally:
        if cursor is not None:
            cursor.close()

        conexion.close()