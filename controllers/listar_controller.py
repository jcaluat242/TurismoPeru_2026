from database.conexion import conectar


def listarpersonas():
    conexion = conectar()
    cursor = None

    try:
        cursor = conexion.cursor()
        cursor.execute("EXEC JECT.sp_ListarPersonas")

        personas = cursor.fetchall()
        return personas

    finally:
        if cursor is not None:
            cursor.close()

        conexion.close()


def listarclientes():
    conexion = conectar()
    cursor = None

    try:
        cursor = conexion.cursor()
        cursor.execute("EXEC JECT.sp_ListarClientes")

        clientes = cursor.fetchall()
        return clientes

    finally:
        if cursor is not None:
            cursor.close()

        conexion.close()


def buscarpersonas(texto):
    conexion = conectar()
    cursor = None

    try:
        cursor = conexion.cursor()

        cursor.execute(
            "EXEC JECT.sp_BuscarPersonas ?",
            texto
        )

        personas = cursor.fetchall()
        return personas

    finally:
        if cursor is not None:
            cursor.close()

        conexion.close()