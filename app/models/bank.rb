class Bank < ApplicationRecord
  has_many :accounts
  has_many :clients, through: :accounts
end
