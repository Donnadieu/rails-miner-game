class Wallet < ApplicationRecord
  has_many :coins
  belongs_to :user

  def self.create_address
    Faker::Bitcoin.address
  end

  def balance
    @total = 0
    self.coins.each do |coin|
      coin_total = coin.amount * coin.price
      @total += coin_total
    end
    @total
  end
end
