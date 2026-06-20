class Actor
  include Mongoid::Document
  include Mongoid::Timestamps

  store_in collection: "actores"

  field :nombre, type: String
  field :nacionalidad, type: String
  field :fecha_nacimiento, type: Date
  field :activo, type: Mongoid::Boolean, default: true

  validates :nombre, presence: true
  validates :nacionalidad, presence: true
  validates :fecha_nacimiento, presence: true
end
