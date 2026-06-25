# Streaming App — TPI Bases de Datos 2

**Materia:** Bases de Datos 2
**Carrera:** Tecnicatura Universitaria en Programación (a Distancia)
**Universidad:** UTN
**Alumnos:** Farid Salomon, Gonzalo Vega

## Deploy

El proyecto se encuentra desplegado en Render (plan gratuito):

➡️ [https://tpi-bd2-salomon-vega.onrender.com](https://tpi-bd2-salomon-vega.onrender.com)

> ⚠️ Al ser un servicio gratuito, si no recibe tráfico por un tiempo entra en modo *sleep*. Al ingresar por primera vez puede demorar unos segundos en responder mientras el servidor se reactiva.

## Contenido del .zip

Este archivo contiene el código fuente completo del proyecto. No incluye artefactos de build ni dependencias. Para ejecutarlo en otra máquina es necesario seguir los pasos de instalación descritos abajo.

| Archivo/Carpeta | Descripción |
|---|---|
| `app/` | Modelos, controladores y vistas (lógica CRUD) |
| `config/` | Configuración de la app y conexión a BD (`mongoid.yml`) |
| `Gemfile` | Dependencias del proyecto |
| `.env` | Variables de entorno (incluye la URI de MongoDB compartida) |
| `README.md` | Este archivo |

**Excluidos del .zip:** `vendor/`, `tmp/`, `log/`, `node_modules/`, `Gemfile.lock` y archivos de IDE. Estos se generan al instalar y ejecutar el proyecto localmente.

## Requisitos e instalación

Solo necesitas **Ruby 3.x** y **Bundler**.

```bash
# 1. Instalar dependencias
bundle install

# 2. Iniciar el servidor
rails server
```

> El archivo `.env` ya viene incluido con la URI de conexión a MongoDB, por lo que no es necesario configurar nada adicional. La base de datos es compartida y ya contiene datos precargados.

## Partes clave del proyecto

### Conexión a la base de datos

`config/mongoid.yml` — Configuración de Mongoid. La URI se lee desde `ENV['MONGODB_URI']` definida en `.env`.

### Modelos (`app/models/`)

Documentos de MongoDB con validaciones y relaciones:
- `usuario.rb`, `perfil.rb`, `catalogo.rb`, `actor.rb`, `episodio.rb`, `temporada.rb`, `historial_reproduccion.rb`

### Controladores (`app/controllers/`)

CRUD expuesto como API REST:
- `usuarios_controller.rb`, `catalogos_controller.rb`, `actors_controller.rb`, `historial_reproduccions_controller.rb`

### Rutas (`config/routes.rb`)

Endpoints RESTful definidos con `resources`.

## Tecnologías utilizadas

- Ruby on Rails 7.2
- MongoDB + Mongoid
- Render (deploy)
