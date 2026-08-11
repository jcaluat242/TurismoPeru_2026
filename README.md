# 🇵🇪 Sistema Turismo Perú 2026

## 🗄️ Proyecto Base de Datos

Aplicación web para gestionar personas y clientes del sistema Turismo Perú, desarrollada con Python, Flask y SQL Server.

El proyecto utiliza procedimientos almacenados para realizar las operaciones de consulta, registro, búsqueda, actualización y eliminación lógica de personas.

## 📘 Descripción General

El Sistema Turismo Perú permite administrar información de personas naturales y jurídicas almacenadas en la base de datos `TURISMOPERU_JECT`.

La aplicación se conecta a SQL Server mediante `pyodbc` y ejecuta procedimientos almacenados del esquema `JECT`.

### Funcionalidades implementadas

- Listar personas.
- Listar clientes.
- Registrar personas.
- Buscar personas por nombre, apellido o número de documento.
- Obtener una persona por su ID.
- Editar los datos de una persona.
- Actualizar personas.
- Realizar eliminación lógica.
- Cambiar el estado de una persona a `Inactivo`.
- Mostrar formularios y tablas utilizando Bootstrap.

## 🚀 Fases del Proyecto

### 1. Configuración de la base de datos

- Creación de la base de datos `TURISMOPERU_JECT`.
- Uso del esquema `JECT`.
- Configuración de las tablas `persona` y `cliente`.
- Configuración de la conexión desde Python.

### 2. Creación de procedimientos almacenados

Se implementaron siete procedimientos almacenados:

| Procedimiento | Descripción |
|---|---|
| `JECT.sp_ListarPersonas` | Lista todas las personas registradas. |
| `JECT.sp_ListarClientes` | Lista las personas relacionadas con clientes. |
| `JECT.sp_insertarPersona` | Registra una persona nueva. |
| `JECT.sp_ObtenerPersonaPorId` | Obtiene todos los datos de una persona por su ID. |
| `JECT.sp_ActualizarPersona` | Actualiza la información de una persona. |
| `JECT.sp_EliminarPersona` | Realiza una eliminación lógica cambiando el estado a `Inactivo`. |
| `JECT.sp_BuscarPersonas` | Busca por nombres, apellidos o número de documento. |

### 3. Desarrollo del backend

- Configuración de Flask.
- Conexión con SQL Server mediante `pyodbc`.
- Creación de controladores.
- Ejecución parametrizada de procedimientos almacenados.
- Manejo de transacciones con `commit` y `rollback`.
- Implementación de rutas para listar, registrar, buscar, editar y eliminar.

### 4. Desarrollo de la interfaz

- Página principal con lista de personas.
- Formulario para registrar personas.
- Formulario para editar personas.
- Cuadro de búsqueda.
- Botones de editar y eliminar.
- Confirmación antes de realizar la eliminación lógica.
- Diseño mediante Bootstrap.

### 5. Pruebas realizadas

- Prueba de conexión con SQL Server.
- Prueba de listado de personas.
- Prueba de listado de clientes.
- Prueba de registro de personas.
- Prueba de búsqueda.
- Prueba de obtención por ID.
- Prueba de actualización.
- Prueba de eliminación lógica.

## 🧠 Competencias a Desarrollar

- Diseño y administración de bases de datos relacionales.
- Creación de procedimientos almacenados en SQL Server.
- Programación con Python.
- Desarrollo de aplicaciones web con Flask.
- Conexión entre Python y SQL Server.
- Uso de consultas parametrizadas.
- Manejo de transacciones.
- Desarrollo de interfaces con HTML, Jinja y Bootstrap.
- Organización de proyectos por capas.
- Control de versiones con Git y GitHub.

## 🗂️ Estructura del Proyecto

```bash
TurismoPeru_2026/
│
├── controllers/
│   ├── listar_controller.py
│   └── persona_controller.py
│
├── database/
│   └── conexion.py
│
├── models/
│   ├── cliente.py
│   └── persona.py
│
├── procedures/
│   ├── sp_ActualizarPersona.sql
│   ├── sp_BuscarPersonas.sql
│   ├── sp_EliminarPersona.sql
│   ├── sp_insertarPersona.sql
│   ├── sp_ListarClientes.sql
│   ├── sp_ListarPersonas.sql
│   └── sp_ObtenerPersonaPorId.sql
│
├── scripts/
│   └── Archivos auxiliares del proyecto
│
├── static/
│   └── Archivos estáticos
│
├── templates/
│   ├── clientes.html
│   ├── editar.html
│   ├── index.html
│   └── insertar.html
│
├── .env.example
├── .gitignore
├── app.py
├── config.py
├── README.md
└── requirements.txt
```

Las carpetas `myenv`, `__pycache__` y el archivo `.env` no deben subirse al repositorio.

## 🧰 Requisitos

- Python 3.10 o superior.
- SQL Server.
- SQL Server Management Studio.
- Microsoft ODBC Driver para SQL Server.
- Flask.
- pyodbc.
- python-dotenv.
- Git.

Las dependencias de Python se encuentran en:

```text
requirements.txt
```

## ⚙️ Instalación y configuración

### 1. Clonar el repositorio

```bash
git clone URL_DEL_REPOSITORIO
cd TurismoPeru_2026
```

### 2. Crear un entorno virtual

En Windows:

```powershell
python -m venv myenv
.\myenv\Scripts\Activate.ps1
```

### 3. Instalar las dependencias

```powershell
pip install -r requirements.txt
```

### 4. Configurar las variables de entorno

Copia `.env.example` como `.env` y completa los datos de conexión requeridos por `config.py`.

El archivo `.env` puede contener información privada y no debe subirse a GitHub.

### 5. Crear los procedimientos almacenados

Abre los archivos de la carpeta `procedures` en SQL Server Management Studio y ejecútalos sobre la base de datos:

```sql
USE TURISMOPERU_JECT;
GO
```

### 6. Ejecutar la aplicación

```powershell
python app.py
```

Después abre en el navegador:

```text
http://127.0.0.1:5000/
```

## 🧪 Operaciones disponibles

| Ruta | Método | Operación |
|---|---|---|
| `/` | GET | Listar o buscar personas. |
| `/clientes` | GET | Listar clientes. |
| `/nuevo` | GET | Mostrar formulario de registro. |
| `/guardar` | POST | Registrar una persona. |
| `/editar/<id_persona>` | GET | Mostrar formulario de edición. |
| `/actualizar/<id_persona>` | POST | Actualizar una persona. |
| `/eliminar/<id_persona>` | POST | Desactivar una persona. |

## 🔒 Seguridad

- Las consultas utilizan parámetros para evitar concatenar valores directamente.
- Las credenciales se almacenan en `.env`.
- La eliminación de personas es lógica.
- El archivo `.env` y el entorno virtual no se incluyen en Git.

## 👨‍🏫 Autor

Proyecto desarrollado aplicando conceptos de bases de datos, procedimientos almacenados, Python y desarrollo web con Flask.

**Jhon Emerson Calua Teran**

**Fecha:** 11.08.2026