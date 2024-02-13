class Client < ApplicationRecord
  has_one :account, dependent: :destroy
  has_one :bank, through: :account
end
