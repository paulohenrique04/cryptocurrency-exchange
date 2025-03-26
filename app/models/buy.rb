class Buy < ApplicationRecord
  belongs_to :user
  belongs_to :cryptocurrency

  validates :quantity, :crypto_value, numericality: { greater_than: 0 }
end
