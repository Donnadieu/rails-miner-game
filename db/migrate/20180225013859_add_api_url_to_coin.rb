class AddApiUrlToCoin < ActiveRecord::Migration[5.1]
  def change
    add_column :coins, :api_url, :string, default: 'https://api.cryptonator.com/api/ticker/btc-usd'
  end
end
