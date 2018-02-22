class CoinMiner < ApplicationRecord
  belongs_to :coin
  belongs_to :miner
end
