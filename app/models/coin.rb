class Coin < ApplicationRecord
  belongs_to :wallet
  has_many :coin_miners
  has_many :miners, through: :coin_miners
end
