class CreateWallets < ActiveRecord::Migration[5.1]
  def change
    create_table :wallets do |t|
      t.float :limit

      t.timestamps
    end
  end
end
