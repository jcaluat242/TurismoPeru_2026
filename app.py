from flask import Flask, render_template, request, redirect

from models.persona import Persona
from controllers.listar_controller import (
    listarclientes,
    listarpersonas,
    buscarpersonas
)
from controllers.persona_controller import (
    insertar_persona,
    obtener_persona_por_id,
    actualizar_persona,
    eliminar_persona
)


app = Flask(__name__)


@app.route("/")
def inicio():
    texto = request.args.get("buscar", "").strip()

    if texto:
        personas = buscarpersonas(texto)
    else:
        personas = listarpersonas()

    return render_template(
        "index.html",
        personas=personas,
        texto_busqueda=texto
    )


@app.route("/clientes")
def clientes():
    lista_clientes = listarclientes()

    return render_template(
        "clientes.html",
        clientes=lista_clientes
    )


@app.route("/nuevo")
def nuevo():
    return render_template("insertar.html")


@app.route("/guardar", methods=["POST"])
def guardar():
    persona = construir_persona_desde_formulario()

    insertar_persona(persona)
    return redirect("/")


@app.route("/editar/<int:id_persona>")
def editar(id_persona):
    persona = obtener_persona_por_id(id_persona)

    if persona is None:
        return redirect("/")

    return render_template(
        "editar.html",
        persona=persona
    )


@app.route(
    "/actualizar/<int:id_persona>",
    methods=["POST"]
)
def actualizar(id_persona):
    persona = construir_persona_desde_formulario()

    actualizar_persona(id_persona, persona)
    return redirect("/")


@app.route(
    "/eliminar/<int:id_persona>",
    methods=["POST"]
)
def eliminar(id_persona):
    eliminar_persona(id_persona)
    return redirect("/")


def construir_persona_desde_formulario():
    return Persona(
        request.form.get("tipo_persona"),
        request.form.get("nombres"),
        request.form.get("apaterno"),
        request.form.get("amaterno"),
        request.form.get("razon_social"),
        request.form.get("nombre_comercial"),
        request.form.get("id_tipo_documento"),
        request.form.get("numero_documento"),
        request.form.get("telefono"),
        request.form.get("email"),
        request.form.get("id_nacionalidad"),
        request.form.get("estado")
    )


if __name__ == "__main__":
    app.run(debug=True)