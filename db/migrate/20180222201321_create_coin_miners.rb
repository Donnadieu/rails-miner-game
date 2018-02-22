class CreateCoinMiners < ActiveRecord::Migration[5.1]
  def change
    create_table :coin_miners do |t|
      t.integer :coin_id
      t.integer :miner_id

      t.timestamps
    end
  end
end
