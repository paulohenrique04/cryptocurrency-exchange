class Cryptocurrency < ApplicationRecord
  has_one_attached :photo  # Isso substitui o antigo campo photo:string
  
  validates :name, :company, :value, presence: true
  validates :value, numericality: { greater_than: 0 }
  
  validates :photo, presence: true
  validate :acceptable_image

  has_many :buys

  private 

  def acceptable_image
    return unless photo.attached?

    unless photo.content_type.in?(%w[image/png image/jpg image/jpeg])
      errors.add(:photo, "deve ser um arquivo PNG, JPG ou JPEG.")
    end
  end
end
