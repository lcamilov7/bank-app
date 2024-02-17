class Client < ApplicationRecord
  # Asociaciones con los otros modelos
  has_one :account, dependent: :destroy
  has_one :bank, through: :account
  # Nested attributes para la instancia de account asociada
  accepts_nested_attributes_for :account
  after_validation :capitalization

  # El campo document_type sera guardado como un enum para usar menos recursos
  enum document_type: {
    'Cédula de ciudadania' => 0,
    'Tarjeta de identidad' => 1,
    'Registro civil' => 2,
    'Cédula de extranjería' => 3,
    'Carné de identidad' => 4,
    'Documento nacional de identidad' => 5,
    'Pasaporte' => 6
  }

  # Con este metodo ponemos la primera palabra de todos los nombre y apellidos del campo name
  def capitalization
    self.name = self.name.titleize
  end

  # Con este metodo de clase nos aseguramos de obtener un metodo unico de cuenta para cada cliente, es invocado
  # con el callback after_validation
  def make_account_number
    auxiliar = false
    begin
      account = Faker::Bank.account_number
      Account.all.each do |instance|
        auxiliar = true if account == instance.number
      end
    end while auxiliar == true
    self.account.number = account
  end

  # Validaciones
  validates :name, :document_type, :document_number, :phone, presence: true
  validates :document_number, :phone, uniqueness: true

  # PG Search
  include PgSearch::Model
  pg_search_scope :global_search, # Nombre del metodo para invocar PG Search
  against: [ :name, :document_number, :phone ], # campos del modelo Client que aplican para la busqueda
  associated_against: {
    account: [ :number ] # Campos de modelos asociados a client que aplican a la busqueda
  },
  using: {
    tsearch: { prefix: true } # Para aceptar busquedas incompletas o no tan precisas
  }
end
