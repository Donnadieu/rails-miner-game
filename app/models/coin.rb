class Coin < ApplicationRecord
  belongs_to :wallet

  def price
    url = api_url
    scraper = Mechanize.new
    page = scraper.get(url)
    parsed_page = JSON.parse(page.body)
    parsed_page["ticker"]["price"] unless !parsed_page["success"]
    binding.pry
  end
end
