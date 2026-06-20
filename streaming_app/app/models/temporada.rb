class Temporada
  include Mongoid::Document

  field :numero_temporada, type: Integer
  field :lanzamiento, type: Integer

  embedded_in :catalogo

  embeds_many :episodios, class_name: "Episodio"
  accepts_nested_attributes_for :episodios, allow_destroy: true, reject_if: :all_blank

  validates :numero_temporada, presence: true
  validates :lanzamiento, presence: true
  validate :episodios_validos

  private

  def episodios_validos
    if episodios.size < 2
      errors.add(:episodios, "debe tener al menos 2 episodios")
    end
    episodios.each_with_index do |episodio, index|
      next if episodio.valid?
      episodio.errors.full_messages.each do |message|
        errors.add(:base, "Episodio #{index + 1}: #{message}")
      end
    end
  end
end
