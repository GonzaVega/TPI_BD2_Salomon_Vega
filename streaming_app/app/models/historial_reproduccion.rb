class HistorialReproduccion
  include Mongoid::Document
  include Mongoid::Timestamps

  store_in collection: "historial_reproduccion"

  field :perfil_id, type: Integer
  field :episodio_id, type: String
  field :segundo_detenido, type: Integer
  field :visto_completo, type: Mongoid::Boolean, default: false
  field :ultima_conexion, type: Time

  belongs_to :usuario
  belongs_to :contenido, class_name: "Catalogo"

  validates :perfil_id, presence: true
  validates :segundo_detenido, presence: true
  validates :ultima_conexion, presence: true
  validates :usuario, presence: true
  validates :contenido, presence: true
end
