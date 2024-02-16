class Client < ApplicationRecord
  # Asociaciones con los otros modelos
  has_one :account, dependent: :destroy
  has_one :bank, through: :account
  accepts_nested_attributes_for :account
  after_validation :capitalization

  enum document_type: {
    'Cédula de ciudadania' => 0,
    'Tarjeta de identidad' => 1,
    'Registro civil' => 2,
    'Cédula de extranjería' => 3,
    'Carné de identidad' => 4,
    'Documento nacional de identidad' => 5,
    'Pasaporte' => 6
  }

  def capitalization
    self.name = self.name.capitalize
  end

  def make_account_number(all_accounts)
    auxiliar = false
    begin
      account = Faker::Bank.account_number
      all_accounts.each do |instance|
        auxiliar = true if account == instance.number
      end
    end while auxiliar == true
    self.account.number = account
  end

  # Validaciones
  validates :name, :document_type, :document_number, :phone, presence: true
  validates :document_number, :phone, uniqueness: true
end
