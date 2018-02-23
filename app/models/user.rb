class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]
  validates :username, uniqueness: true
  validates :username, presence: true

  has_many :miners
  has_one :wallet
  has_many :coins, through: :wallet
end
