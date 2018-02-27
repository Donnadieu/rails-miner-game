class Wallet < ApplicationRecord
  has_one :coin
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
end
