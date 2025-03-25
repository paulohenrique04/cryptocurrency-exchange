class Cryptocurrency < ApplicationRecord
  has_one_attached :photo  # Isso substitui o antigo campo photo:string
  
  validates :name, :company, :value, presence: true
  validates :value, numericality: { greater_than: 0 }
  validates :photo, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']

  has_many :buys
end
