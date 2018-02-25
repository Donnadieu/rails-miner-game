class Coin < ApplicationRecord
  belongs_to :wallet

  def price
    url = api_url
    scraper = Mechanize.new
    page = scraper.get(url)
    parsed_page = JSON.parse(page.body)
    parsed_page["ticker"]["price"] unless !parsed_page["success"]
  end

  def total_usd
    amount * price.to_f
  end
end
