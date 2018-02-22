class AddWalletIdToCoin < ActiveRecord::Migration[5.1]
  def change
    add_column :coins, :wallet_id, :integer
  end
end
