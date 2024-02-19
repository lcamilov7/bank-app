class Bank < ApplicationRecord
  # Asociaciones con los otros modelos
  has_many :accounts, dependent: :destroy
  has_many :clients, through: :accounts

  # Validaciones
  validates :name, :nit, :phone, presence: true
  validates :nit, uniqueness: true
end
