class Coin < ApplicationRecord
  belongs_to :wallet
  belongs_to :miner
  validates :difficulty, numericality: true
  validates :amount, numericality: true
  validates :price, numericality: true

  def update_price
    url = api_url
    uri = URI(url)
    response = Net::HTTP.get(uri)
    parsed_page = JSON.parse(response)
    self.price = parsed_page["ticker"]["price"] unless !parsed_page["success"]
    self.save
  end

  def total_usd
    amount * price.to_f
  end

  def update_difficulty
    url = 'https://blockchain.info/q/getdifficulty'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    parsed_page = JSON.parse(response)
    self.difficulty = parsed_page
    self.save
  end
end
