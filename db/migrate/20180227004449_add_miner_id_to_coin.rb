class AddMinerIdToCoin < ActiveRecord::Migration[5.1]
  def change
    add_column :coins, :miner_id, :ineteger
  end
end
