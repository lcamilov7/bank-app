class Bank < ApplicationRecord
  # Asociaciones con los otros modelos
  has_many :accounts, dependent: :destroy
  has_many :clients, through: :accounts, dependent: :destroy

  # Validaciones
  validates :name, :nit, :phone, presence: true
  validates :nit, uniqueness: true
end
