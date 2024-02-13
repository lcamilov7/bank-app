class Client < ApplicationRecord
  has_one :account
  has_one :bank, through: :account
end
