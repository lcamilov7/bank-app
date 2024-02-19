class Account < ApplicationRecord
  # Asociaciones con los otros modelos
  belongs_to :bank
  belongs_to :client, dependent: :destroy

  # Validaciones
  validates :number, :bank_id, presence: true
  validates :number, uniqueness: true
end
