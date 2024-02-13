class Account < ApplicationRecord
  # Asociaciones con los otros modelos
  belongs_to :bank
  belongs_to :client

  # Validaciones
  validates :number, :bank_id, :client_id, presence: true
end