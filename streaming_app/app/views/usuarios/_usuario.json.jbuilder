json.extract! usuario, :id, :nombre, :email, :plan_suscripcion, :activo, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
