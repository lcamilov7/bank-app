class Bank < ApplicationRecord
  has_many :accounts, dependent: :destroy
  has_many :clients, through: :accounts
end
