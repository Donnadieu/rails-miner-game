class Miner < ApplicationRecord
  has_many :mining_rig_miners
  has_many :mining_rigs, through: :mining_rig_miners

  validates :name, uniqueness: true
  validates :name, presence: true
  validates :consumption, numericality: true
  validates :price, numericality: true
  validates :hash_rate, numericality: true
end
