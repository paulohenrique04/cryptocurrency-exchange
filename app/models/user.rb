class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, :address, :cpf, presence: true
  validates :cpf, uniqueness: true
  validates :balance, numericality: { greater_than_or_equal_to: 0 }

  has_one :wallet, dependent: :destroy
  has_many :buys

  after_create :create_wallet

  private

  def create_wallet
    Wallet.create(user: self)
  end
end
