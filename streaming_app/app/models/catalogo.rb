class Catalogo
  include Mongoid::Document
  include Mongoid::Timestamps

  store_in collection: "catalogo"

  field :titulo, type: String
  field :tipo, type: String
  field :sinopsis, type: String
  field :clasificacion, type: String
  field :disponible, type: Mongoid::Boolean, default: true
  field :lanzamiento, type: Integer
  field :generos, type: Array, default: []

  def generos_string
    generos&.join(", ")
  end

  def generos_string=(value)
    self.generos = value.to_s.split(",").map(&:strip).reject(&:blank?)
  end

  has_and_belongs_to_many :actores, class_name: "Actor", foreign_key: "actor_ids"

  embeds_many :temporadas, class_name: "Temporada"
  accepts_nested_attributes_for :temporadas, allow_destroy: true, reject_if: :all_blank

  validates :titulo, presence: true
  validates :tipo, presence: true, inclusion: { in: [ "Serie", "Pelicula" ] }
  validates :sinopsis, presence: true
  validates :clasificacion, presence: true, inclusion: { in: [ "G", "PG", "PG-13", "PG-16", "R", "NC-17", "TV-MA" ] }
  validates :lanzamiento, presence: true
  validate :generos_presentes
  validate :actores_presentes
  validate :temporadas_validas

  private

  def generos_presentes
    errors.add(:generos, "debe tener al menos un género") if generos.blank?
  end

  def actores_presentes
    errors.add(:actores, "debe tener al menos un actor") if actores.blank?
  end

  def temporadas_validas
    temporadas.each_with_index do |temporada, index|
      next if temporada.valid?
      temporada.errors.full_messages.each do |message|
        errors.add(:base, "Temporada #{index + 1}: #{message}")
      end
    end
  end
end
