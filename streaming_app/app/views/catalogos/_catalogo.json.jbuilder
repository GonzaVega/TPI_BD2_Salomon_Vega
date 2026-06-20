json.extract! catalogo, :id, :titulo, :tipo, :sinopsis, :clasificacion, :disponible, :lanzamiento, :created_at, :updated_at
json.url catalogo_url(catalogo, format: :json)
