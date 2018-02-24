class AddAddressToWallet < ActiveRecord::Migration[5.1]
  def change
    add_column :wallets, :address, :string
  end
end
