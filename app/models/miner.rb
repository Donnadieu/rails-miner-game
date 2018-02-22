class Miner < ApplicationRecord
  belongs_to :user
  has_many :coin_miners
  has_many :coins, through: :coin_miners
end
