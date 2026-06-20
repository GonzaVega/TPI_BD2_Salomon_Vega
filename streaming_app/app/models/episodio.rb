class Episodio
  include Mongoid::Document

  field :episodio_id, type: String
  field :titulo_episodio, type: String
  field :duracion_segundos, type: Integer

  embedded_in :temporada

  validates :episodio_id, presence: true
  validates :titulo_episodio, presence: true
  validates :duracion_segundos, presence: true
end
