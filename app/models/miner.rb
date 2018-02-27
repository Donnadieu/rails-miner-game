class Miner < ApplicationRecord
  has_many :mining_rig_miners
  has_many :mining_rigs, through: :mining_rig_miners

  validates :consumption, numericality: true
  validates :hash_rate, presence: true
  validates_numericality_of :hash_rate, greater_than: 0
  validates_inclusion_of :hash_rate, in: [14, 28, 56]

  def price
    if hash_rate == 56
      1000.00
    elsif hash_rate == 28
      500.00
    elsif hash_rate == 14
      250.00
    else
      0
    end
  end

  def get_consumption
    case hash_rate
    when 56
      2600
    when 28
      1300
    when 14
      650
    end
  end

  def day_consumption
    consumption * 24
  end

  def change_status
    if status
      self.status = false
    else
      self.status = true
    end
    save
  end

  def start_mining(coin)
    coin.update_price
    coin.update_difficulty
    x = coin.block_reward * hash_rate * 86400.00
    y = coin.difficulty * 2**32

    new_amount = (x / y) * 10000.00
    coin.amount += new_amount
    coin.save
  end
  handle_asynchronously :start_mining, :run_at => Proc.new { 1.minutes.from_now }
  handle_asynchronously :change_status, :run_at => Proc.new { 1.minutes.from_now }
end
