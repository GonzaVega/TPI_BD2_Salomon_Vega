json.extract! historial_reproduccion, :id, :perfil_id, :episodio_id, :segundo_detenido, :visto_completo, :ultima_conexion, :created_at, :updated_at
json.url historial_reproduccion_url(historial_reproduccion, format: :json)
