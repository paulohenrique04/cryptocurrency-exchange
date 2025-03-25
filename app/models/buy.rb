class Buy < ApplicationRecord
  belongs_to :user
  belongs_to :cryptocurrency
  belongs_to :wallet

  validates :quantity, :crypto_value, numericality: { greater_than: 0 }
end
