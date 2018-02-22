class Wallet < ApplicationRecord
  has_many :coins
  belongs_to :user
end
