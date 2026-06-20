class Perfil
  include Mongoid::Document

  field :perfil_id, type: Integer
  field :nombre_perfil, type: String
  field :es_kids, type: Mongoid::Boolean, default: false
  field :idioma, type: String

  embedded_in :usuario

  validates :perfil_id, presence: true
  validates :nombre_perfil, presence: true
  validates :idioma, presence: true
end
