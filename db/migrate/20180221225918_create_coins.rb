class CreateCoins < ActiveRecord::Migration[5.1]
  def change
    create_table :coins do |t|
      t.string :name, default: 'Bitcoin'
      t.string :symbol, default: "BTC"
      t.float :difficulty, default: 0.0
      t.float :amount, default: 0.0
      t.float :price, default: 0.0

      t.timestamps
    end
  end
end
