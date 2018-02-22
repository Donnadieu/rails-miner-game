class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, uniqueness: true
  validates :username, presence: true

  has_many :miners
  has_one :wallet
end
