class Client < ApplicationRecord
  # Asociaciones con los otros modelos
  has_one :account, dependent: :destroy
  accepts_nested_attributes_for :account
  has_one :bank, through: :account

  enum document_type: {
    'Cédula de ciudadania' => 0,
    'Tarjeta de identidad' => 1,
    'Registro civil' => 2,
    'Cédula de extranjería' => 3,
    'Carné de identidad' => 4,
    'Documento nacional de identidad' => 4,
    'Pasaporte' => 5
  }

  def capitalization
    self.name = self.name.capitalize
  end

  # Validaciones
  validates :name, :document_type, :document_number, :phone, presence: true
end
