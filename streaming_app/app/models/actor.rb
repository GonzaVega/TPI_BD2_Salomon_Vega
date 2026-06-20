class Actor
  include Mongoid::Document
  include Mongoid::Timestamps

  has_and_belongs_to_many :catalogos, class_name: "Catalogo", inverse_of: :actores
  store_in collection: "actores"

  field :nombre, type: String
  field :nacionalidad, type: String
  field :fecha_nacimiento, type: Date
  field :activo, type: Mongoid::Boolean, default: true

  validates :nombre, presence: true
  validates :nacionalidad, presence: true
  validates :fecha_nacimiento, presence: true
end
