class Usuario
  include Mongoid::Document
  include Mongoid::Timestamps

  field :nombre, type: String
  field :email, type: String
  field :plan_suscripcion, type: String
  field :activo, type: Mongoid::Boolean, default: true

  embeds_many :perfiles, class_name: "Perfil", validate: false
  accepts_nested_attributes_for :perfiles, allow_destroy: true

  validates :nombre, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :plan_suscripcion, presence: true, inclusion: { in: [ "Básico", "Plus", "Premium" ] }
  validates :perfiles, length: { minimum: 1, maximum: 5 }
  validate :perfiles_validos

  private

  def perfiles_validos
    perfiles.each_with_index do |perfil, index|
      next if perfil.valid?
      perfil.errors.full_messages.each do |message|
        errors.add(:base, "Perfil #{index + 1}: #{message}")
      end
    end
  end
end
