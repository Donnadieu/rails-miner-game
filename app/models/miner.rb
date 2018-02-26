class Miner < ApplicationRecord
  has_many :mining_rig_miners
  has_many :mining_rigs, through: :mining_rig_miners

  validates :consumption, numericality: true
  validates :hash_rate, presence: true
  validates_numericality_of :hash_rate, greater_than: 0
  validates_inclusion_of :hash_rate, in: [3, 7, 14]

  def price
    if hash_rate == 14
      1000.00
    elsif hash_rate == 7
      500.00
    elsif hash_rate == 3
      250.00
    else
      0
    end
  end

  def get_consumption
    case hash_rate
    when 14
      1300
    when 7
      650
    when 3
      325
    end
  end

  def start_mining

  end

end
