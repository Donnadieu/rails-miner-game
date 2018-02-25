class Wallet < ApplicationRecord
  has_many :coins
  belongs_to :user

  def self.create_address
    Faker::Bitcoin.address
  end

  def balance
    total = 0
    coins.each do |coin|
      total += coin.total_usd
    end
    total
  end

  def sell_coin(coin, amount)
    if amount >= coin.amount
      coin.amount = coin.amount - amount

  end
end
