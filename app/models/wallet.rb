class Wallet < ApplicationRecord
  has_many :coins
  belongs_to :user

  def self.create_address
    Faker::Bitcoin.address
  end
end
