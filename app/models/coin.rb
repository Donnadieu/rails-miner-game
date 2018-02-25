class Coin < ApplicationRecord
  belongs_to :wallet
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
  
end
