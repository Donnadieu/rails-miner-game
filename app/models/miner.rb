class Miner < ApplicationRecord
  has_many :mining_rig_miners
  has_many :mining_rigs, through: :mining_rig_miners

  validates :consumption, numericality: true
  validates :hash_rate, numericality: { less_than_or_equal_to: 14.0 }

  def price(hash_rate)
    if hash_rate == 14
      1000.00
    elsif hash_rate == 7
      500.00
    elsif hash_rate == 3
      250.00
    end
  end

  def valid_hashrate?(hash_rate)
    case hash_rate
    when 14, 7, 3
      true
    else
      false
    end
  end

  def get_consumption(hash_rate)
    case hash_rate
    when 14
      1300
    when 7
      650
    when 3.5
      325
    end
  end
end
