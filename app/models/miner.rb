class Miner < ApplicationRecord
  has_many :mining_rig_miners
  has_many :mining_rigs, through: :mining_rig_miners
  # belongs_to :user

  validates :consumption, numericality: true

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

  def consumption
    case hash_rate
    when 56
      self.consumption = 2600
    when 28
      self.consumption = 1300
    when 14
      self.consumption = 650
    end
  end

  def day_consumption
    consumption * 24
  end

  def mining(coin)
    coin.update_price
    coin.update_difficulty
    x = coin.block_reward * hash_rate * 86400.00
    y = coin.difficulty * 2**32
    binding.pry
    new_amount = (x / y) * 10000.00
    coin.amount += new_amount
    coin.save
    save
  end
  handle_asynchronously :mining, :run_at => Proc.new { 1.minutes.from_now }
end
