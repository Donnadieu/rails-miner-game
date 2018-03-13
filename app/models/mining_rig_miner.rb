class MiningRigMiner < ApplicationRecord
  belongs_to :mining_rig
  belongs_to :miner

  validates :hash_rate, presence: true
  validates :brand, presence: true
  validates_numericality_of :hash_rate, greater_than: 0
  validates_inclusion_of :hash_rate, in: [14, 28, 56]

  def hash_rate
      self.miner.hash_rate if self.miner
  end

  def hash_rate=(hash_rate)
    miner = Miner.find_or_create_by(hash_rate: hash_rate)
    self.miner = miner
  end
end
